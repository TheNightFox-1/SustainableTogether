#!/usr/bin/env python3
"""
stage4_integration.py

Stage 4 of the SysML v2 <-> LCA integration pipeline.

Pipeline:
  motor_lca_ontology.ttl  }
  motor_instance.ttl      }  -> rdflib graph
  semantic_matching.sparql}
                             + openLCA IPC -> ELCD flows -> 4th named graph
                             -> SPARQL semantic match -> matched flow UUID
                             -> GWP characterization factor x mass -> result

Requirements:
    pip install rdflib olca-ipc
    openLCA 2.x running locally with ELCD database loaded and IPC server
    enabled on port 8080 (File > IPC Server > Start).
"""

from __future__ import annotations

import sys
from pathlib import Path

from rdflib import Graph, Literal, Namespace, URIRef
from rdflib.namespace import RDF

try:
    import olca_ipc as ipc
    import olca_schema as schema
except ImportError:
    print("ERROR: olca-ipc not installed.  Run: pip install olca-ipc")
    sys.exit(1)

# ── Paths ──────────────────────────────────────────────────────────────────

HERE          = Path(__file__).parent
ONTOLOGY_FILE = HERE / "motor_lca_ontology.ttl"
INSTANCE_FILE = HERE / "motor_instance.ttl"
SPARQL_FILE   = HERE / "semantic_matching.sparql"

# ── Namespaces ─────────────────────────────────────────────────────────────

LCA = Namespace("http://lca.org/ontology#")

OLCA_PORT = 8080


# ─────────────────────────────────────────────────────────────────────────────
# STAGE 1 — Load RDF files
# ─────────────────────────────────────────────────────────────────────────────

def load_rdf() -> tuple[Graph, str]:
    """Parse ontology + instance TTL files; read SPARQL query text."""
    print("STAGE 1 — Loading RDF files...")

    g = Graph()
    g.parse(ONTOLOGY_FILE, format="turtle")
    g.parse(INSTANCE_FILE, format="turtle")

    sparql_query = SPARQL_FILE.read_text(encoding="utf-8")

    print(f"  {len(g)} triples loaded from ontology + instance files.")
    return g, sparql_query


# ─────────────────────────────────────────────────────────────────────────────
# STAGE 2 — Fetch ELCD flows from openLCA via IPC
# ─────────────────────────────────────────────────────────────────────────────

def fetch_elcd_flows(client: ipc.Client) -> list[dict]:
    """Retrieve all flows from the active openLCA database."""
    print("STAGE 2 — Fetching flows from openLCA IPC...")

    flows_data: list[dict] = []
    for flow in client.get_all(schema.Flow):
        name     = flow.name or ""
        uuid     = flow.id   or ""
        cat = flow.category
        category = cat if isinstance(cat, str) else (cat.name if cat else "")
        if name and uuid:
            flows_data.append({"name": name, "uuid": uuid, "category": category})

    print(f"  {len(flows_data)} flows fetched from openLCA.")
    return flows_data


# ─────────────────────────────────────────────────────────────────────────────
# STAGE 3 — Serialize ELCD flows as RDF (4th named graph)
# ─────────────────────────────────────────────────────────────────────────────

def add_flows_to_graph(g: Graph, flows_data: list[dict]) -> None:
    """Mint one lca:Flow individual per openLCA flow and add it directly to g."""
    print("STAGE 3 — Serializing ELCD flows into RDF graph...")

    for flow in flows_data:
        flow_uri = URIRef(f"http://elcd.org/flow/{flow['uuid']}")
        g.add((flow_uri, RDF.type,         LCA.Flow))
        g.add((flow_uri, LCA.flowName,     Literal(flow["name"])))
        g.add((flow_uri, LCA.flowCategory, Literal(flow["category"])))
        g.add((flow_uri, LCA.elcdUUID,     Literal(flow["uuid"])))

    print(f"  {len(flows_data)} lca:Flow individuals added to graph.")


# ─────────────────────────────────────────────────────────────────────────────
# STAGE 4 — Run SPARQL semantic match
# ─────────────────────────────────────────────────────────────────────────────

def run_sparql_match(g: Graph, sparql_query: str) -> list:
    """
    Execute the semantic_matching.sparql query over the combined graph.
    Returns all matching rows (partName, materialName, massValue,
    matchedFlowName, flowCategory, elcdUUID).
    """
    print("STAGE 4 — Running SPARQL semantic match...")

    results = list(g.query(sparql_query))

    if not results:
        # Query the graph to surface the actual material name in the hint
        hint_q = ("PREFIX sysml: <http://sysmlv2.org/ontology#> "
                  "SELECT ?n WHERE { ?m a sysml:MaterialAttribute ; sysml:materialName ?n }")
        hint_r = list(g.query(hint_q))
        mat_name = str(hint_r[0].n) if hint_r else "unknown"
        print("  No semantic matches found.")
        print(f"  Hint: check that the database contains a flow whose name "
              f"contains '{mat_name}' (case-insensitive substring match).")
        return []

    print(f"  {len(results)} match(es) found:")
    for row in results:
        print(f"    Part={row.partName}  Material={row.materialName}  "
              f"Flow='{row.matchedFlowName}'  UUID={row.elcdUUID}")

    return results


# ─────────────────────────────────────────────────────────────────────────────
# STAGE 5 — Calculate GWP via openLCA IPC
# ─────────────────────────────────────────────────────────────────────────────

def calculate_gwp(client: ipc.Client, flow_uuid: str, mass_kg: float,
                  part_name: str, flow_name: str) -> None:
    """
    Walk through impact methods on the active database, find the first
    climate-change / GWP category that has a characterization factor for
    flow_uuid, then compute total GWP = factor * mass_kg.

    openLCA stores factors on ImpactCategory objects (not on ImpactMethod
    directly), so we fetch each category individually once we find a
    candidate method.
    """
    print("STAGE 5 — Calculating GWP via openLCA IPC...")

    gwp_factor  : float | None = None
    gwp_unit    : str          = "kg CO₂-eq"
    method_name : str          = ""
    cat_name    : str          = ""

    for method in client.get_all(schema.ImpactMethod):
        for cat_ref in (method.impact_categories or []):
            label = (cat_ref.name or "").lower()
            if not ("climate" in label or "gwp" in label or "global warming" in label):
                continue

            full_cat = client.get(schema.ImpactCategory, cat_ref.id)
            if full_cat is None:
                continue

            for factor in (full_cat.impact_factors or []):
                if factor.flow and factor.flow.id == flow_uuid:
                    gwp_factor  = factor.value
                    gwp_unit    = factor.unit.name if factor.unit else gwp_unit
                    method_name = method.name or ""
                    cat_name    = cat_ref.name or ""
                    break

            if gwp_factor is not None:
                break
        if gwp_factor is not None:
            break

    print()
    print("=" * 62)
    print("  RESULT")
    print("=" * 62)
    print(f"  Part              : {part_name}")
    print(f"  Matched ELCD flow : {flow_name}")
    print(f"  Flow UUID         : {flow_uuid}")
    print(f"  Mass              : {mass_kg} kg")

    if gwp_factor is None:
        print()
        print("  GWP               : not calculated")
        print("  Reason: no characterization factor found for this flow.")
        print("  Hint: ensure an impact method with a GWP / climate-change")
        print("        category is imported into the active openLCA database.")
    else:
        gwp_total = gwp_factor * mass_kg
        print(f"  Impact method     : {method_name}")
        print(f"  Impact category   : {cat_name}")
        print(f"  GWP factor        : {gwp_factor:.6f} {gwp_unit} / kg")
        print(f"  Total GWP         : {gwp_total:.4f} {gwp_unit}")

    print("=" * 62)


# ─────────────────────────────────────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────────────────────────────────────

def main() -> None:
    # Stage 1 — load RDF
    g, sparql_query = load_rdf()

    # Connect to openLCA
    print(f"\nConnecting to openLCA IPC server at localhost:{OLCA_PORT}...")
    try:
        client = ipc.Client(OLCA_PORT)
    except Exception as exc:
        print(f"ERROR: Cannot connect to openLCA: {exc}")
        print("Check that openLCA is running and the IPC server is started "
              "(File > IPC Server > Start).")
        sys.exit(1)

    # Stage 2 — fetch ELCD flows
    flows_data = fetch_elcd_flows(client)
    if not flows_data:
        print("ERROR: No flows returned from openLCA. "
              "Is the ELCD database loaded?")
        sys.exit(1)

    # Stage 3 — serialize flows as RDF
    add_flows_to_graph(g, flows_data)

    # Stage 4 — SPARQL semantic match
    matches = run_sparql_match(g, sparql_query)
    if not matches:
        sys.exit(0)

    # Use the first (best-ranked by ORDER BY) match for GWP calculation
    best          = matches[0]
    flow_uuid     = str(best.elcdUUID)
    mass_kg       = float(best.massValue)
    part_name     = str(best.partName)
    matched_flow  = str(best.matchedFlowName)

    print(f"\n  >> Using best match: '{matched_flow}' for part '{part_name}' ({mass_kg} kg)")

    # Stage 5 — calculate GWP
    calculate_gwp(client, flow_uuid, mass_kg, part_name, matched_flow)


if __name__ == "__main__":
    main()
