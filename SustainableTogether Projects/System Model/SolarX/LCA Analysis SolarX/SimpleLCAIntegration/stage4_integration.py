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

# ── LCIA constants (EF 3.0 Method (adapted), confirmed from active database) ──
EF30_METHOD_ID        = "b4571628-4b7b-3e4f-81b1-9a8cca6cb3f8"
CLIMATE_CHANGE_CAT_ID = "3bc1c67f-d3e3-3891-9fea-4512107d88ef"


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
    Calculate GWP using EF 3.0 Method (adapted):
      1. Find the provider process for the matched ELCD product flow.
      2. Auto-build a product system from that process via IPC.
      3. Run a full LCA calculation (EF 3.0).
      4. Extract the 'Climate change' total impact and scale by mass_kg.

    Note: EF 3.0 characterises elementary flows, not product flows directly,
    so a characterisation-factor lookup on the product flow UUID would never
    yield a result — a full LCA calculation is required.
    """
    print("STAGE 5 — Calculating GWP via openLCA IPC (EF 3.0 Method)...")

    # -- Find the provider process for the matched ELCD flow ------------------
    flow_ref  = schema.Ref(id=flow_uuid, ref_type=schema.RefType.Flow)
    providers = client.get_providers(flow_ref)
    if not providers:
        print(f"  ERROR: no provider process found for flow UUID {flow_uuid}.")
        return
    process_ref = providers[0].provider
    print(f"  Provider process : {process_ref.name}")

    # -- Create a product system (auto-link upstream processes) ---------------
    print("  Creating product system (this may take a moment)...")
    ps_ref = client.create_product_system(process_ref)
    if ps_ref is None:
        print("  ERROR: create_product_system returned None.")
        return
    print(f"  Product system   : {ps_ref.id}")

    # -- Run LCA calculation for 1 kg reference flow --------------------------
    print("  Running LCA calculation...")
    setup = schema.CalculationSetup(
        target=ps_ref,
        impact_method=schema.Ref(
            id=EF30_METHOD_ID,
            ref_type=schema.RefType.ImpactMethod,
        ),
        amount=1.0,
    )
    result = client.calculate(setup)
    result.wait_until_ready()

    # -- Extract Climate change total -----------------------------------------
    gwp_per_kg: float | None = None
    for impact in result.get_total_impacts():
        if impact.impact_category.id == CLIMATE_CHANGE_CAT_ID:
            gwp_per_kg = impact.amount
            break
    result.dispose()

    # -- Report ---------------------------------------------------------------
    print()
    print("=" * 62)
    print("  RESULT")
    print("=" * 62)
    print(f"  Part              : {part_name}")
    print(f"  Matched ELCD flow : {flow_name}")
    print(f"  Flow UUID         : {flow_uuid}")
    print(f"  Mass              : {mass_kg} kg")
    print(f"  LCIA method       : EF 3.0 Method (adapted)")
    print(f"  Impact category   : Climate change")

    if gwp_per_kg is None:
        print()
        print("  GWP               : not calculated")
        print("  Reason: Climate change category missing from result.")
    else:
        gwp_total = gwp_per_kg * mass_kg
        print(f"  GWP per kg        : {gwp_per_kg:.6f} kg CO2-eq / kg")
        print(f"  Total GWP         : {gwp_total:.4f} kg CO2-eq")

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
