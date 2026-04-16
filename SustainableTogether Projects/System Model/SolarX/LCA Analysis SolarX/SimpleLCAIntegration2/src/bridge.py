"""bridge.py — SPARQL-based transformation bridge.

Queries the knowledge graph for every sysml:PartDefinition that carries
LCA-relevant properties (mass, geography, ecoinvent UUID) and converts
each result into an openLCA-compatible JSON-LD process dict.

The JSON-LD schema follows the openLCA data exchange format
(https://github.com/GreenDelta/olca-schema).  The dict can be:
  - passed directly to OLCAClient.import_process(), or
  - serialised to JSON for offline inspection.
"""

from __future__ import annotations

import uuid
from typing import Any

from .graph import LCAKnowledgeGraph

# ─────────────────────────────────────────────────────────────────
#  SPARQL prefix block (shared by all queries in this module)
# ─────────────────────────────────────────────────────────────────
_PREFIXES = """\
PREFIX rdf:   <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs:  <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd:   <http://www.w3.org/2001/XMLSchema#>
PREFIX sysml: <http://www.omg.org/spec/SysML/20230201/SysML#>
PREFIX lca:   <http://mbse-lca.org/ontology#>
PREFIX qudt:  <http://qudt.org/schema/qudt/>
PREFIX unit:  <http://qudt.org/vocab/unit/>
"""

# Extract every PartDefinition together with its LCA-relevant properties.
# All OPTIONAL clauses: a part without mass / geography still appears
# in the result so nothing is silently dropped.
EXTRACT_PARTS_QUERY = _PREFIXES + """\
SELECT DISTINCT
    ?part ?name
    ?mass ?massUnit
    ?voltage ?voltageUnit
    ?capacity ?capacityUnit
    ?geography ?elcdFlowName
WHERE {
    ?part a sysml:PartDefinition .

    OPTIONAL { ?part rdfs:label ?name . }

    OPTIONAL {
        ?part lca:hasMass ?massNode .
        ?massNode qudt:numericValue ?mass .
        OPTIONAL { ?massNode qudt:unit ?massUnit . }
    }

    OPTIONAL {
        ?part lca:hasNominalVoltage ?vNode .
        ?vNode qudt:numericValue ?voltage .
        OPTIONAL { ?vNode qudt:unit ?voltageUnit . }
    }

    OPTIONAL {
        ?part lca:hasCapacity ?cNode .
        ?cNode qudt:numericValue ?capacity .
        OPTIONAL { ?cNode qudt:unit ?capacityUnit . }
    }

    OPTIONAL { ?part lca:hasGeography   ?geography . }
    OPTIONAL { ?part lca:hasElcdFlowName ?elcdFlowName . }

    # Only surface parts that carry a mass — structural-only parents are excluded
    FILTER (BOUND(?mass))
}
ORDER BY ?name
"""

# openLCA JSON-LD context URL (canonical, used by openLCA >= 2.0)
_OLCA_CONTEXT = "http://greendelta.github.io/olca-schema/context.jsonld"

# Well-known UUID for the openLCA "Items" unit group (unit: "Item(s)")
_ITEMS_UNIT_GROUP_UUID = "5df51745-0b40-43a9-aa59-cdaf0faf9601"
_ITEMS_UNIT_UUID       = "c394f489-8a69-44b0-b815-c83e2d53b966"


class LCABridge:
    """
    Transformation bridge between the RDF knowledge graph and openLCA.

    Typical usage::

        bridge  = LCABridge()
        parts   = bridge.extract_lca_parts(kg)
        for part in parts:
            process_dict = bridge.to_olca_process(part)
    """

    # ------------------------------------------------------------------
    # Step 1 — extract from graph
    # ------------------------------------------------------------------

    def extract_lca_parts(self, graph: LCAKnowledgeGraph) -> list[dict[str, Any]]:
        """
        Run the extraction SPARQL query against the graph and return a
        list of plain Python dicts, one per PartDefinition found.

        Keys guaranteed to be present in every dict:
          uri, name, geography, uuid
          mass_kg, voltage_V, capacity_Ah  (may be None if not in graph)
        """
        results = graph.query(EXTRACT_PARTS_QUERY)
        parts: list[dict[str, Any]] = []

        for row in results:
            part: dict[str, Any] = {
                "uri":           str(row.part),
                "name":          str(row.name)        if row.name        else "UnnamedPart",
                "mass_kg":       float(row.mass)       if row.mass        else None,
                "mass_unit":     str(row.massUnit)     if row.massUnit    else None,
                "voltage_V":     float(row.voltage)    if row.voltage     else None,
                "capacity_Ah":   float(row.capacity)   if row.capacity    else None,
                "geography":     str(row.geography)    if row.geography   else "GLO",
                "elcd_flow":     str(row.elcdFlowName) if row.elcdFlowName else "Lithium, ion",
            }
            parts.append(part)
            _summary = (
                f"{part['name']} | "
                f"{part['mass_kg']} kg | "
                f"{part['voltage_V']} V | "
                f"{part['capacity_Ah']} Ah | "
                f"{part['geography']}"
            )
            print(f"[bridge] Extracted: {_summary}")

        return parts

    # ------------------------------------------------------------------
    # Step 2 — convert to openLCA JSON-LD
    # ------------------------------------------------------------------

    def to_olca_process(self, part: dict[str, Any]) -> dict[str, Any]:
        """
        Convert a part dict (from ``extract_lca_parts``) into an
        openLCA-compatible JSON-LD process dict.

        The process has:
          - one quantitative reference output  (1 × "Item(s)" of the part)
          - one material/mass input            (mass_kg × kg of NMC cells)
            only added when mass is available
        """
        process_id = str(uuid.uuid4())
        elcd_flow  = part.get("elcd_flow", "Lithium, ion")

        exchanges: list[dict[str, Any]] = []

        # ── Reference product output (1 module) ──────────────────────
        exchanges.append({
            "@type":                    "Exchange",
            "avoidedProduct":           False,
            "isInput":                  False,
            "isQuantitativeReference":  True,
            "amount":                   1.0,
            "flow": {
                "@type":    "Flow",
                "@id":      str(uuid.uuid4()),
                "name":     part["name"],
                "flowType": "PRODUCT_FLOW",
            },
            "unit": {
                "@type": "Unit",
                "@id":   _ITEMS_UNIT_UUID,
                "name":  "Item(s)",
            },
        })

        # ── Material input: mass of NMC battery material ──────────────
        if part["mass_kg"] is not None:
            exchanges.append({
                "@type":                    "Exchange",
                "avoidedProduct":           False,
                "isInput":                  True,
                "isQuantitativeReference":  False,
                "amount":                   part["mass_kg"],
                "description": (
                    f"Mass-based material input mapped to ELCD flow '{elcd_flow}'. "
                    f"Geography: {part['geography']}."
                ),
                "flow": {
                    "@type":    "Flow",
                    "@id":      str(uuid.uuid4()),
                    "name":     elcd_flow,
                    "flowType": "PRODUCT_FLOW",
                },
                "unit": {
                    "@type": "Unit",
                    "name":  "kg",
                },
            })

        # ── Build the process dict ───────────────────────────────────
        description_parts = [
            "Auto-generated from MBSE-LCA knowledge graph.",
            f"SysML URI: {part['uri']}.",
            f"ELCD material flow: {elcd_flow}.",
        ]
        if part["voltage_V"] is not None:
            description_parts.append(f"Nominal voltage: {part['voltage_V']} V.")
        if part["capacity_Ah"] is not None:
            description_parts.append(f"Capacity: {part['capacity_Ah']} Ah.")

        process: dict[str, Any] = {
            "@context":    _OLCA_CONTEXT,
            "@type":       "Process",
            "@id":         process_id,
            "name":        part["name"],
            "description": "  ".join(description_parts),
            "processType": "UNIT_PROCESS",
            "location": {
                "@type": "Location",
                "name":  part["geography"],
            },
            "exchanges": exchanges,
        }

        return process


# ─────────────────────────────────────────────────────────────────
#  Helpers
# ─────────────────────────────────────────────────────────────────

def _looks_like_uuid(s: str) -> bool:
    """Return True if ``s`` is a valid UUID4-style string."""
    try:
        uuid.UUID(s, version=4)
        return True
    except ValueError:
        return False
