"""main.py — MBSE-LCA knowledge graph pipeline orchestrator.

Pipeline steps:
  1.  Initialise the in-memory RDF knowledge graph (rdflib).
  2.  Load the OWL alignment ontology (ontology/lca_sysml_alignment.ttl).
  3.  Load SysML elements:
        a. Try the SysML v2 REST API at localhost:9000.
        b. Fall back to data/battery.ttl if the API is unreachable.
  4.  Run the SPARQL bridge to extract LCA-significant parts.
  5.  Convert each part to an openLCA JSON-LD process dict.
  6.  Import each process into openLCA via IPC (localhost:8080).
  7.  Run a ReCiPe 2016 Midpoint H calculation, retrieve GWP100.
  8.  Write the GWP100 result back into the graph as a triple.
  9.  Print a result summary and serialise the final graph to
      output_graph.ttl.

The pipeline runs fully standalone (no SysML server, no openLCA) and
produces a simulated GWP100 result so developers can validate the
data flow without any external services.

Usage:
    python main.py
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

# Make src/ importable when running from the project root
sys.path.insert(0, str(Path(__file__).parent))

from src.graph       import LCAKnowledgeGraph
from src.sysml_reader import SysMLReader
from src.bridge      import LCABridge
from src.lca_client  import OLCAClient


def main() -> None:
    _banner("MBSE-LCA Knowledge Graph Pipeline")

    # ── 1. Initialise graph ───────────────────────────────────────────
    kg = LCAKnowledgeGraph()

    # ── 2. Load ontology ──────────────────────────────────────────────
    kg.load_ontology()

    # ── 3. Load SysML data (API or fallback) ─────────────────────────
    reader   = SysMLReader()
    used_api = reader.load(kg)
    source   = "SysML v2 REST API (localhost:9000)" if used_api else "battery.ttl (offline fallback)"
    print(f"[main] Data source: {source}")

    # ── 4. Extract LCA-significant parts via SPARQL ───────────────────
    bridge = LCABridge()
    parts  = bridge.extract_lca_parts(kg)

    if not parts:
        print("\n[main] No PartDefinitions found — check graph content:")
        _dump_triples(kg, limit=20)
        return

    # ── 5–8. Process each part ────────────────────────────────────────
    olca    = OLCAClient()
    summary = []

    for part in parts:
        print(f"\n[main] Processing: {part['name']}")

        # 5. Build openLCA JSON-LD process dict
        process_dict = bridge.to_olca_process(part)

        # (Optional) dump process JSON for inspection
        _write_json(process_dict, f"process_{_slug(part['name'])}.json")

        # 6. Import into openLCA
        process_id = olca.import_process(process_dict)

        # 7. Calculate GWP100
        gwp = olca.run_calculation(process_id) if process_id else None

        # 8. Write GWP triple back into graph
        if gwp is not None:
            olca.write_gwp_triple(kg, part["uri"], gwp)

        summary.append({
            "name":            part["name"],
            "mass_kg":         part["mass_kg"],
            "voltage_V":       part["voltage_V"],
            "capacity_Ah":     part["capacity_Ah"],
            "geography":       part["geography"],
            "elcd_flow":       part["elcd_flow"],
            "gwp100_kg_co2_eq": gwp,
        })

    # ── 9. Summary + serialise graph ─────────────────────────────────
    _banner("Result Summary")
    print(f"  Data source  : {source}")
    print(f"  Graph size   : {len(kg)} triples")
    print()

    for r in summary:
        gwp_str = (
            f"{r['gwp100_kg_co2_eq']:.2f} kg CO\u2082-eq"
            if r["gwp100_kg_co2_eq"] is not None
            else "n/a"
        )
        print(f"  {r['name']}")
        print(f"    Mass         : {r['mass_kg']} kg")
        print(f"    Voltage      : {r['voltage_V']} V")
        print(f"    Capacity     : {r['capacity_Ah']} Ah")
        print(f"    Geography    : {r['geography']}")
        print(f"    ELCD flow    : {r['elcd_flow']}")
        print(f"    GWP100       : {gwp_str}")
        print()

    # Save final graph
    out_ttl = Path(__file__).parent / "output_graph.ttl"
    out_ttl.write_text(kg.serialize("turtle"), encoding="utf-8")
    print(f"  Graph saved  : {out_ttl}")

    # Save summary JSON
    out_json = Path(__file__).parent / "output_summary.json"
    out_json.write_text(json.dumps(summary, indent=2, ensure_ascii=False), encoding="utf-8")
    print(f"  Summary saved: {out_json}")
    _banner("Done")


# ─────────────────────────────────────────────────────────────────
#  Helpers
# ─────────────────────────────────────────────────────────────────

def _banner(title: str) -> None:
    width = 60
    print()
    print("=" * width)
    print(f"  {title}")
    print("=" * width)


def _slug(name: str) -> str:
    """Convert a display name to a filesystem-safe slug."""
    return "".join(c if c.isalnum() else "_" for c in name).lower()


def _dump_triples(kg: LCAKnowledgeGraph, limit: int = 20) -> None:
    print(f"\n[debug] First {limit} triples in graph:")
    for i, (s, p, o) in enumerate(kg.g):
        if i >= limit:
            break
        print(f"  {str(s):<55} {str(p):<45} {str(o)}")


def _write_json(data: dict, filename: str) -> None:
    """Write a dict to a JSON file in the project root (for inspection)."""
    out = Path(__file__).parent / filename
    out.write_text(json.dumps(data, indent=2, ensure_ascii=False), encoding="utf-8")
    print(f"[main] Written: {filename}")


if __name__ == "__main__":
    main()
