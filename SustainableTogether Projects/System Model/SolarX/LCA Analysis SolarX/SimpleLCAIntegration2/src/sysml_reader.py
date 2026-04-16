"""sysml_reader.py — SysML v2 REST API reader with offline fallback.

Tries to connect to the SysML v2 Pilot Implementation REST API at
localhost:9000.  On any connection error it loads data/battery.ttl
directly, so the rest of the pipeline runs standalone without a
running SysML server.

API endpoints used (SysML v2 Pilot Implementation):
  GET /api/projects                            → list all projects
  GET /api/projects/{id}/elements              → list all elements
  GET /api/projects/{id}/elements/{elemId}     → single element

Element JSON structure (partial):
  {
    "@type":        "PartDefinition",
    "@id":          "<uuid>",
    "declaredName": "BatteryModule",
    "ownedElement": [...],
    "ownedAttribute": [
        { "name": "mass", "defaultValue": { "value": "4.2" } }, ...
    ]
  }
"""

from __future__ import annotations

import uuid
from pathlib import Path
from typing import Optional

import requests
from rdflib import URIRef, Literal, BNode
from rdflib.namespace import RDF, RDFS, XSD

from .graph import LCAKnowledgeGraph, SYSML, LCA, QUDT, UNIT, BATTERY_PATH

SYSML_API_BASE  = "http://localhost:9000/api"
REQUEST_TIMEOUT = 5   # seconds


class SysMLReader:
    """
    Fetches PartDefinition elements from the SysML v2 REST API and
    converts each element to RDF triples for the knowledge graph.

    If the API is unreachable, ``load()`` falls back to loading
    ``data/battery.ttl`` directly so the pipeline can run offline.
    """

    def __init__(self, api_base: str = SYSML_API_BASE) -> None:
        self.api_base = api_base.rstrip("/")

    # ------------------------------------------------------------------
    # Public interface
    # ------------------------------------------------------------------

    def load(self, graph: LCAKnowledgeGraph) -> bool:
        """
        Main entry point.  Returns ``True`` if the REST API was used,
        ``False`` if the offline fallback (battery.ttl) was used.
        """
        project_id = self._discover_project()
        if project_id is not None:
            elements = self._fetch_elements(project_id)
            triples: list[tuple] = []
            for el in elements:
                triples.extend(self._element_to_triples(el))
            graph.add_triples(triples)
            print(
                f"[sysml_reader] {len(elements)} elements from API "
                f"→ {len(triples)} triples added"
            )
            return True

        print("[sysml_reader] API not reachable — using battery.ttl fallback")
        graph.load_instance_data(BATTERY_PATH)
        return False

    # ------------------------------------------------------------------
    # API helpers
    # ------------------------------------------------------------------

    def _discover_project(self) -> Optional[str]:
        """
        Return the first project ``@id`` from the API, or ``None`` if
        the server is unreachable or returns no projects.
        """
        try:
            resp = requests.get(
                f"{self.api_base}/projects",
                timeout=REQUEST_TIMEOUT,
            )
            resp.raise_for_status()
            projects = resp.json()
            if projects:
                pid = projects[0].get("@id") or projects[0].get("id")
                print(f"[sysml_reader] Connected — project: {pid}")
                return pid
            print("[sysml_reader] API reachable but no projects found")
        except (requests.RequestException, ValueError) as exc:
            print(f"[sysml_reader] API probe failed: {exc}")
        return None

    def _fetch_elements(self, project_id: str) -> list[dict]:
        """
        Fetch all elements for the given project and filter to
        ``PartDefinition`` elements only.
        """
        try:
            resp = requests.get(
                f"{self.api_base}/projects/{project_id}/elements",
                timeout=REQUEST_TIMEOUT,
            )
            resp.raise_for_status()
            elements = resp.json()
        except (requests.RequestException, ValueError) as exc:
            print(f"[sysml_reader] Element fetch failed: {exc}")
            return []

        part_defs = [
            el for el in elements
            if el.get("@type") in ("PartDefinition", "sysml:PartDefinition")
        ]
        print(
            f"[sysml_reader] {len(part_defs)} PartDefinitions "
            f"out of {len(elements)} total elements"
        )
        return part_defs

    # ------------------------------------------------------------------
    # RDF conversion
    # ------------------------------------------------------------------

    def _element_to_triples(self, element: dict) -> list[tuple]:
        """
        Convert a SysML API element dict to a list of
        ``(subject, predicate, object)`` rdflib triples.

        The subject URI is derived from the element's ``@id`` so that
        later modules can refer to the same node by URI.
        """
        elem_id   = element.get("@id", str(uuid.uuid4()))
        elem_name = (
            element.get("declaredName")
            or element.get("name")
            or "UnnamedPart"
        )

        subject = URIRef(f"http://mbse-lca.org/instance/sysml#{elem_id}")

        triples: list[tuple] = [
            (subject, RDF.type,   SYSML.PartDefinition),
            (subject, RDF.type,   LCA.UnitProcess),
            (subject, RDFS.label, Literal(elem_name, datatype=XSD.string)),
        ]

        # Walk any owned attributes looking for LCA-relevant quantities
        for attr in element.get("ownedAttribute", []):
            aname = (attr.get("name") or "").lower()
            raw   = (attr.get("defaultValue") or {}).get("value")
            if raw is None:
                continue
            try:
                val = float(raw)
            except (TypeError, ValueError):
                continue

            if "mass" in aname or "weight" in aname:
                node = BNode()
                triples += [
                    (subject, LCA.hasMass,        node),
                    (node,    RDF.type,            QUDT.QuantityValue),
                    (node,    QUDT.numericValue,   Literal(val, datatype=XSD.double)),
                    (node,    QUDT.unit,           UNIT.KiloGM),
                ]
            elif "voltage" in aname:
                node = BNode()
                triples += [
                    (subject, LCA.hasNominalVoltage, node),
                    (node,    RDF.type,               QUDT.QuantityValue),
                    (node,    QUDT.numericValue,      Literal(val, datatype=XSD.double)),
                    (node,    QUDT.unit,              UNIT.V),
                ]
            elif "capacit" in aname:
                node = BNode()
                triples += [
                    (subject, LCA.hasCapacity,   node),
                    (node,    RDF.type,           QUDT.QuantityValue),
                    (node,    QUDT.numericValue,  Literal(val, datatype=XSD.double)),
                    (node,    QUDT.unit,          UNIT["A-HR"]),
                ]

        # Surface-level LCA metadata if present on the element dict
        if geography := element.get("geography"):
            triples.append(
                (subject, LCA.hasGeography, Literal(geography, datatype=XSD.string))
            )
        if ec_uuid := element.get("ecoinventUUID"):
            triples.append(
                (subject, LCA.hasEcoinventUUID, Literal(ec_uuid, datatype=XSD.string))
            )

        return triples
