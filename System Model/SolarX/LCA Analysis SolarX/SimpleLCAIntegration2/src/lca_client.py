"""lca_client.py — openLCA IPC client.

Responsibilities:
  1. Import a JSON-LD process dict into openLCA via the IPC server.
  2. Run an impact assessment calculation (ReCiPe 2016 Midpoint H).
  3. Extract the GWP100 result from the impact results.
  4. Write the result back into the RDF knowledge graph as a triple.

Requires olca-ipc >= 2.0 and olca-schema >= 2.0 (both optional).
If either package is missing or the IPC server is not running the
client falls back to a simulated result so the pipeline can complete.

The simulated GWP100 value (45.3 kg CO₂-eq) is a plausible order-of-
magnitude estimate for a 4.2 kg NMC battery module manufactured in DE,
based on published ecoinvent / literature values (~10–12 kg CO₂-eq /
kg NMC cell × 4.2 kg ≈ 42–50 kg CO₂-eq).
"""

from __future__ import annotations

import uuid
from typing import Optional

from rdflib import URIRef, Literal
from rdflib.namespace import XSD

from .graph import LCAKnowledgeGraph, LCA

OLCA_IPC_PORT       = 8080
RECIPE_METHOD_NAME  = "ReCiPe 2016 Midpoint (H)"
GWP100_CATEGORY_KEY = "global warming"   # ReCiPe 2016 Midpoint (H) category name

# Offline simulation value — replace with real calculation when openLCA is live
_SIMULATED_GWP100 = 45.3  # kg CO₂-eq


class OLCAClient:
    """
    Thin wrapper around olca-ipc that handles library availability and
    server connectivity gracefully.

    If ``olca_ipc`` / ``olca_schema`` are not installed, or if the
    IPC server at ``localhost:{port}`` is not running, every method
    returns a plausible simulated value so the rest of the pipeline
    continues to execute.
    """

    def __init__(self, port: int = OLCA_IPC_PORT) -> None:
        self.port       = port
        self._client    = None
        self._available = False
        self._method_id: Optional[str] = None
        self._connect()

    # ------------------------------------------------------------------
    # Connection
    # ------------------------------------------------------------------

    def _connect(self) -> None:
        try:
            import olca_ipc as ipc  # type: ignore[import]
            self._client    = ipc.Client(self.port)
            self._available = True
            print(f"[lca_client] Connected to openLCA IPC  port={self.port}")
        except ImportError:
            print(
                "[lca_client] olca-ipc not installed — "
                "install with: pip install olca-ipc olca-schema"
            )
        except Exception as exc:
            print(f"[lca_client] openLCA IPC not available: {exc}")

    # ------------------------------------------------------------------
    # Public interface
    # ------------------------------------------------------------------

    def import_process(self, process_dict: dict) -> str:
        """
        Import a JSON-LD process dict into openLCA.

        Returns the process UUID (real or simulated).
        """
        process_id = process_dict.get("@id") or str(uuid.uuid4())

        if not self._available:
            print(
                f"[lca_client] (offline) Simulated import: "
                f"'{process_dict['name']}' → {process_id}"
            )
            return process_id

        try:
            import olca_schema as o  # type: ignore[import]

            p          = o.new_process(process_dict["name"])
            p.id       = process_id
            p.description = process_dict.get("description", "")

            # Try to attach the location if it already exists in the database
            loc_name = (process_dict.get("location") or {}).get("name", "GLO")
            for loc_ref in self._client.get_all(o.Location):
                if loc_ref.name and loc_name.lower() in loc_ref.name.lower():
                    p.location = o.as_ref(loc_ref)
                    break

            self._client.put(p)
            print(f"[lca_client] Imported: '{p.name}' ({p.id})")
        except Exception as exc:
            print(f"[lca_client] Import failed ({exc}) — continuing with UUID {process_id}")

        return process_id

    def run_calculation(self, process_id: str) -> Optional[float]:
        """
        Run ReCiPe 2016 Midpoint H and return the GWP100 value in
        kg CO₂-eq.  Returns ``None`` if the calculation cannot run.
        """
        if not self._available:
            print(f"[lca_client] (offline) Simulated GWP100 = {_SIMULATED_GWP100} kg CO₂-eq")
            return _SIMULATED_GWP100

        try:
            import olca_schema as o  # type: ignore[import]

            method_id = self._find_recipe_method()
            if method_id is None:
                print(f"[lca_client] Method '{RECIPE_METHOD_NAME}' not found in database")
                return None

            setup = o.CalculationSetup(
                target        = o.Ref(ref_type=o.RefType.Process, id=process_id),
                impact_method = o.Ref(ref_type=o.RefType.ImpactMethod, id=method_id),
                allocation    = o.AllocationType.NO_ALLOCATION,
                amount        = 1.0,
            )

            result = self._client.calculate(setup)
            result.wait_until_ready()
            try:
                for impact in result.get_total_impacts():
                    cat_name = (
                        impact.impact_category.name
                        if impact.impact_category else ""
                    )
                    if GWP100_CATEGORY_KEY in cat_name.lower():
                        gwp = impact.amount
                        print(f"[lca_client] GWP100 = {gwp:.4f} kg CO₂-eq  [{cat_name}]")
                        return gwp
                print("[lca_client] GWP100 category not found in results")
            finally:
                result.dispose()

        except Exception as exc:
            print(f"[lca_client] Calculation failed: {exc}")

        return None

    def write_gwp_triple(
        self,
        graph: LCAKnowledgeGraph,
        subject_uri: str,
        gwp_value: float,
        method: str = RECIPE_METHOD_NAME,
    ) -> None:
        """
        Write the GWP100 result back into the knowledge graph as two triples:

          <subject>  lca:hasGWP100  <gwp_value>  .
          <subject>  lca:gwpMethod  <method>     .
        """
        subject = URIRef(subject_uri)
        graph.add_triples([
            (subject, LCA.hasGWP100,  Literal(gwp_value, datatype=XSD.double)),
            (subject, LCA.gwpMethod,  Literal(method,    datatype=XSD.string)),
        ])
        print(
            f"[lca_client] Wrote triple: "
            f"<{subject_uri}> lca:hasGWP100 {gwp_value} ."
        )

    # ------------------------------------------------------------------
    # Private helpers
    # ------------------------------------------------------------------

    def _find_recipe_method(self) -> Optional[str]:
        """Look up the ReCiPe 2016 Midpoint H method UUID in the database."""
        if self._method_id:
            return self._method_id
        try:
            import olca_schema as o  # type: ignore[import]
            for ref in self._client.get_all(o.ImpactMethod):
                if ref.name and RECIPE_METHOD_NAME.lower() in ref.name.lower():
                    self._method_id = ref.id
                    print(f"[lca_client] Method found: '{ref.name}' ({ref.id})")
                    return ref.id
        except Exception as exc:
            print(f"[lca_client] Method lookup failed: {exc}")
        return None
