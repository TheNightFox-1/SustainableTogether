#!/usr/bin/env python3
"""
Main orchestration script for stakeholder network analysis.

Pipeline:
1. Parse stakeholders and relationships from local SysML files
2. Build NetworkX graph
3. Compute network metrics (9 ComputedMetrics fields)
4. Output results (console + optional CSV/JSON)

Usage:
    python run_analysis.py [--instances <path>] [--export-metrics]

No external API required — reads local .sysml files directly.
"""

import sys
import json
from pathlib import Path
from typing import Dict, Any
import argparse

try:
    from sysml_file_parser import SysMLFileParser
    from graph_builder import StakeholderGraphBuilder
    from network_analysis import NetworkAnalyzer
except ImportError as e:
    print(f"Error importing modules: {e}")
    print("Make sure to run 'pip install -r requirements.txt' first")
    sys.exit(1)


def main():
    """Main pipeline orchestration."""
    parser = argparse.ArgumentParser(
        description="Stakeholder network analysis pipeline (local file-based)"
    )
    parser.add_argument(
        "--instances",
        type=Path,
        default=None,
        help="Path to StakeholderMapping_Instances.sysml (auto-detected if not provided)",
    )
    parser.add_argument(
        "--export-metrics",
        action="store_true",
        help="Export computed metrics as JSON and CSV",
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Verbose output",
    )
    args = parser.parse_args()

    print("=" * 70)
    print("STAKEHOLDER NETWORK ANALYSIS PIPELINE")
    print("=" * 70)
    print("Reading from local SysML files (no REST API required)")
    print()

    try:
        # Auto-detect instances file if not provided
        if args.instances is None:
            # Look in parent directory for StakeholderMapping_Instances.sysml
            tools_dir = Path(__file__).parent
            instances_file = tools_dir.parent / "StakeholderMapping_Instances.sysml"
            if not instances_file.exists():
                print(f"[ERROR] StakeholderMapping_Instances.sysml not found")
                print(f"  Searched: {instances_file}")
                print(f"  Use --instances to specify the path")
                sys.exit(1)
            args.instances = instances_file
        else:
            args.instances = args.instances.resolve()
            if not args.instances.exists():
                print(f"[ERROR] File not found: {args.instances}")
                sys.exit(1)

        print(f"Instances file: {args.instances}")
        print()

        # Step 1: Parse SysML files
        print("Step 1: Parsing SysML instances file...")
        parser_obj = SysMLFileParser(args.instances)
        parsed_stakeholders, parsed_relationships = parser_obj.extract_part_usages()
        print(f"  [OK] Parsed {len(parsed_stakeholders)} stakeholders")
        print(f"  [OK] Parsed {len(parsed_relationships)} relationships")
        print()

        # Step 2: Validate relationships
        print("Step 2: Validating relationships...")
        errors = parser_obj.validate_relationships(parsed_stakeholders, parsed_relationships)
        if errors:
            print("  [WARN] Validation warnings:")
            for error in errors:
                print(f"    - {error}")
        else:
            print("  [OK] All relationships valid")
        print()

        # Step 3: Build graph
        print("Step 3: Building stakeholder network graph...")
        builder = StakeholderGraphBuilder()
        G = builder.build_graph(parsed_stakeholders, parsed_relationships)
        summary = builder.get_graph_summary()
        print(f"  [OK] Graph built:")
        print(f"    - Nodes: {summary['num_nodes']}")
        print(f"    - Edges: {summary['num_edges']}")
        print(f"    - Density: {summary['density']:.3f}")
        print(f"    - Average degree: {summary['average_degree']:.2f}")
        print(f"    - Weakly connected components: {summary['num_weakly_connected_components']}")
        print()

        # Step 4: Compute network metrics
        print("Step 4: Computing network analysis metrics...")
        analyzer = NetworkAnalyzer(G, builder.stakeholder_map)
        metrics = analyzer.compute_all_metrics()
        print(f"  [OK] Computed 9 metrics for {len(metrics)} nodes")
        print()

        # Step 6: Display results
        print("=" * 70)
        print("NETWORK ANALYSIS RESULTS")
        print("=" * 70)
        print()

        # Top brokers
        print("TOP 5 BROKERS (by betweenness centrality):")
        top_brokers = analyzer.get_top_brokers(5)
        for i, (node_id, node_metrics) in enumerate(top_brokers, 1):
            stakeholder = builder.stakeholder_map.get(node_id, {})
            name = stakeholder.get("name", node_id)
            broker_score = node_metrics.get("brokerPotential", 0.0)
            print(f"  {i}. {name}")
            print(f"     Broker Potential: {broker_score:.3f}")
            print(f"     Betweenness Centrality: {node_metrics.get('betweennessCentrality', 0.0):.3f}")
            print()

        # Community detection
        print("DETECTED COMMUNITIES:")
        clusters = analyzer.get_emerging_clusters()
        for comm_id, nodes in sorted(clusters.items()):
            if comm_id == -1:
                continue
            print(f"  Community {comm_id}: {len(nodes)} nodes")
            for node_id in nodes[:3]:  # Show first 3
                stakeholder = builder.stakeholder_map.get(node_id, {})
                name = stakeholder.get("name", node_id)
                print(f"    - {name}")
            if len(nodes) > 3:
                print(f"    ... and {len(nodes) - 3} more")
            print()

        # Isolated nodes (low degree centrality)
        print("ISOLATED/LOW-CONNECTIVITY NODES:")
        sorted_nodes = sorted(
            metrics.items(),
            key=lambda x: x[1].get("degreeCentrality", 0.0)
        )
        for node_id, node_metrics in sorted_nodes[:5]:
            stakeholder = builder.stakeholder_map.get(node_id, {})
            name = stakeholder.get("name", node_id)
            degree = node_metrics.get("degreeCentrality", 0.0)
            print(f"  - {name}: degree centrality {degree:.3f}")
        print()

        # Step 5: Export if requested
        if args.export_metrics:
            print("Step 5: Exporting metrics...")
            export_metrics(metrics, builder.stakeholder_map)
            print()

        print("=" * 70)
        print("[OK] Analysis complete!")
        print("=" * 70)

    except Exception as e:
        print(f"[ERROR] Error during analysis: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        sys.exit(1)


def export_metrics(metrics: Dict[str, Dict[str, float]], stakeholder_map: Dict[str, Any]) -> None:
    """
    Export computed metrics to JSON file.

    Args:
        metrics: Metrics dictionary from analyzer
        stakeholder_map: Stakeholder mapping
    """
    output_dir = Path(__file__).parent.parent / "output"
    output_dir.mkdir(exist_ok=True)

    # Build exportable metrics with stakeholder names
    export_data = {}
    for node_id, node_metrics in metrics.items():
        stakeholder = stakeholder_map.get(node_id, {})
        export_data[node_id] = {
            "name": stakeholder.get("name", "Unknown"),
            "metrics": node_metrics,
        }

    # Write JSON
    output_file = output_dir / "computed_metrics.json"
    with open(output_file, "w") as f:
        json.dump(export_data, f, indent=2)
    print(f"  [OK] Exported metrics to {output_file}")

    # Write summary CSV
    import csv
    csv_file = output_dir / "metrics_summary.csv"
    with open(csv_file, "w", newline="") as f:
        fieldnames = [
            "stakeholder_id",
            "name",
            "degree_centrality",
            "betweenness_centrality",
            "closeness_centrality",
            "clustering_coefficient",
            "community_id",
            "structural_hole_score",
            "network_growth_rate",
            "dormancy_score",
            "broker_potential",
        ]
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()

        for node_id, node_metrics in metrics.items():
            stakeholder = stakeholder_map.get(node_id, {})
            writer.writerow({
                "stakeholder_id": node_id,
                "name": stakeholder.get("name", "Unknown"),
                "degree_centrality": node_metrics.get("degreeCentrality", 0.0),
                "betweenness_centrality": node_metrics.get("betweennessCentrality", 0.0),
                "closeness_centrality": node_metrics.get("closenessCentrality", 0.0),
                "clustering_coefficient": node_metrics.get("clusteringCoefficient", 0.0),
                "community_id": node_metrics.get("communityId", -1),
                "structural_hole_score": node_metrics.get("structuralHoleScore", 0.0),
                "network_growth_rate": node_metrics.get("networkGrowthRate", 0.0),
                "dormancy_score": node_metrics.get("dormancyScore", 0.0),
                "broker_potential": node_metrics.get("brokerPotential", 0.0),
            })

    print(f"  [OK] Exported CSV summary to {csv_file}")


if __name__ == "__main__":
    main()
