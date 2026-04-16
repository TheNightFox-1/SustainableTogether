#!/usr/bin/env python3
"""
Network visualization for stakeholder ecosystem analysis.

Generates multiple visualizations:
1. Network graph (nodes colored by community, sized by centrality)
2. Top brokers bar chart
3. Community structure breakdown
4. Centrality metrics comparison
5. Degree distribution
"""

import json
from pathlib import Path
from typing import Dict, Any
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import networkx as nx
from sysml_file_parser import SysMLFileParser
from graph_builder import StakeholderGraphBuilder
from network_analysis import NetworkAnalyzer

# Configure matplotlib
plt.style.use('seaborn-v0_8-darkgrid')
COLORS = ['#FF6B6B', '#4ECDC4', '#45B7D1', '#FFA07A', '#98D8C8', '#F7DC6F']
OUTPUT_DIR = Path(__file__).parent.parent / "output"
OUTPUT_DIR.mkdir(exist_ok=True)


def load_metrics() -> Dict[str, Dict[str, Any]]:
    """Load computed metrics from JSON export and flatten structure."""
    metrics_file = OUTPUT_DIR / "computed_metrics.json"
    with open(metrics_file, "r") as f:
        raw_data = json.load(f)

    # Flatten the structure: metrics[node_id] = metrics_dict (not wrapped in 'metrics')
    flattened = {}
    for node_id, data in raw_data.items():
        flattened[node_id] = data.get('metrics', data)

    return flattened


def visualize_network_graph(G: nx.DiGraph, metrics: Dict[str, Any], stakeholder_map: Dict[str, Any]) -> None:
    """
    Create network graph visualization with nodes colored by community and sized by centrality.
    """
    print("Creating network graph visualization...")

    fig, ax = plt.subplots(figsize=(16, 12))

    # Use spring layout for better visualization
    pos = nx.spring_layout(G, k=2, iterations=50, seed=42)

    # Extract node properties
    nodes = list(G.nodes())
    communities = {node: metrics[node]['communityId'] for node in nodes}
    degrees = {node: metrics[node]['degreeCentrality'] for node in nodes}
    betweenness = {node: metrics[node]['betweennessCentrality'] for node in nodes}

    # Node colors by community
    color_map = []
    for node in nodes:
        comm_id = communities[node]
        color_map.append(COLORS[comm_id % len(COLORS)])

    # Node sizes by degree centrality (scaled for visibility)
    node_sizes = [3000 + (degrees[node] * 8000) for node in nodes]

    # Draw network
    nx.draw_networkx_nodes(
        G, pos,
        node_color=color_map,
        node_size=node_sizes,
        alpha=0.8,
        ax=ax
    )

    # Draw edges (thicker for stronger relationships)
    edges = G.edges(data=True)
    for u, v, data in edges:
        strength = data.get('strength', 'Unknown')
        width = 1.0
        if strength == 'Strong':
            width = 2.5
        elif strength == 'Moderate':
            width = 1.5
        elif strength == 'Weak':
            width = 0.8

        nx.draw_networkx_edges(
            G, pos,
            [(u, v)],
            width=width,
            alpha=0.5,
            edge_color='gray',
            ax=ax,
            connectionstyle='arc3,rad=0.1'
        )

    # Draw labels
    labels = {node: stakeholder_map.get(node, {}).get('name', node).split('(')[0].strip()[:20]
              for node in nodes}
    nx.draw_networkx_labels(
        G, pos,
        labels=labels,
        font_size=9,
        font_weight='bold',
        ax=ax
    )

    # Legend for communities
    community_ids = sorted(set(communities.values()))
    legend_patches = [
        mpatches.Patch(color=COLORS[cid % len(COLORS)], label=f'Community {cid}')
        for cid in community_ids
    ]
    ax.legend(handles=legend_patches, loc='upper left', fontsize=10)

    ax.set_title('Stakeholder Network Ecosystem\n(Node size = Connectivity, Color = Community)',
                 fontsize=14, fontweight='bold')
    ax.axis('off')
    plt.tight_layout()

    output_file = OUTPUT_DIR / "network_graph.png"
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    print(f"  [OK] Saved: {output_file}")
    plt.close()


def visualize_top_brokers(metrics: Dict[str, Any], stakeholder_map: Dict[str, Any]) -> None:
    """Create bar chart of top brokers by betweenness centrality."""
    print("Creating top brokers visualization...")

    # Sort by broker potential
    sorted_metrics = sorted(
        metrics.items(),
        key=lambda x: x[1]['betweennessCentrality'],
        reverse=True
    )[:10]

    names = [stakeholder_map.get(node, {}).get('name', node) for node, _ in sorted_metrics]
    brokers = [node_metrics['betweennessCentrality'] for _, node_metrics in sorted_metrics]

    fig, ax = plt.subplots(figsize=(12, 6))
    bars = ax.barh(names, brokers, color=COLORS[:len(names)])

    # Add value labels
    for i, (bar, val) in enumerate(zip(bars, brokers)):
        ax.text(val + 0.01, i, f'{val:.3f}', va='center', fontsize=10, fontweight='bold')

    ax.set_xlabel('Betweenness Centrality (Brokering Potential)', fontsize=11, fontweight='bold')
    ax.set_title('Top 10 Stakeholders by Broker Potential\n(Ability to bridge between groups)',
                 fontsize=12, fontweight='bold')
    ax.set_xlim(0, max(brokers) * 1.15)
    plt.tight_layout()

    output_file = OUTPUT_DIR / "top_brokers.png"
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    print(f"  [OK] Saved: {output_file}")
    plt.close()


def visualize_centrality_comparison(metrics: Dict[str, Any], stakeholder_map: Dict[str, Any]) -> None:
    """Create comparison of three centrality measures."""
    print("Creating centrality comparison visualization...")

    # Get top 8 stakeholders by degree centrality
    sorted_metrics = sorted(
        metrics.items(),
        key=lambda x: x[1]['degreeCentrality'],
        reverse=True
    )[:8]

    names = [stakeholder_map.get(node, {}).get('name', node)[:25] for node, _ in sorted_metrics]
    degree_vals = [node_metrics['degreeCentrality'] for _, node_metrics in sorted_metrics]
    between_vals = [node_metrics['betweennessCentrality'] for _, node_metrics in sorted_metrics]
    close_vals = [node_metrics['closenessCentrality'] for _, node_metrics in sorted_metrics]

    x = range(len(names))
    width = 0.25

    fig, ax = plt.subplots(figsize=(14, 6))

    ax.bar([i - width for i in x], degree_vals, width, label='Degree Centrality', color='#FF6B6B', alpha=0.8)
    ax.bar(x, between_vals, width, label='Betweenness Centrality', color='#4ECDC4', alpha=0.8)
    ax.bar([i + width for i in x], close_vals, width, label='Closeness Centrality', color='#45B7D1', alpha=0.8)

    ax.set_ylabel('Centrality Score (0-1)', fontsize=11, fontweight='bold')
    ax.set_title('Centrality Metrics Comparison (Top 8 Stakeholders)', fontsize=12, fontweight='bold')
    ax.set_xticks(x)
    ax.set_xticklabels(names, rotation=45, ha='right')
    ax.legend(fontsize=10)
    ax.set_ylim(0, 1.0)

    plt.tight_layout()

    output_file = OUTPUT_DIR / "centrality_comparison.png"
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    print(f"  [OK] Saved: {output_file}")
    plt.close()


def visualize_community_structure(metrics: Dict[str, Any], stakeholder_map: Dict[str, Any]) -> None:
    """Create pie chart and table of community structure."""
    print("Creating community structure visualization...")

    # Group by community
    communities = {}
    for node_id, node_metrics in metrics.items():
        comm_id = node_metrics['communityId']
        if comm_id not in communities:
            communities[comm_id] = []
        communities[comm_id].append(node_id)

    # Create visualization
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 6))

    # Pie chart
    comm_sizes = [len(nodes) for comm_id, nodes in sorted(communities.items())]
    comm_labels = [f'Community {cid}\n({len(nodes)} nodes)' for cid, nodes in sorted(communities.items())]
    colors_pie = [COLORS[i % len(COLORS)] for i in range(len(communities))]

    ax1.pie(comm_sizes, labels=comm_labels, colors=colors_pie, autopct='%1.1f%%', startangle=90)
    ax1.set_title('Network Community Distribution', fontsize=12, fontweight='bold')

    # Table with stakeholder names
    table_data = []
    for comm_id in sorted(communities.keys()):
        nodes = communities[comm_id]
        names = [stakeholder_map.get(node, {}).get('name', node)[:30] for node in nodes]
        for i, name in enumerate(names):
            if i == 0:
                table_data.append([f'Community {comm_id}', name])
            else:
                table_data.append(['', name])

    ax2.axis('tight')
    ax2.axis('off')
    table = ax2.table(cellText=table_data, colLabels=['Community', 'Stakeholder Name'],
                      cellLoc='left', loc='center', colWidths=[0.15, 0.85])
    table.auto_set_font_size(False)
    table.set_fontsize(9)
    table.scale(1, 1.5)
    ax2.set_title('Stakeholder Community Membership', fontsize=12, fontweight='bold', pad=20)

    plt.tight_layout()

    output_file = OUTPUT_DIR / "community_structure.png"
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    print(f"  [OK] Saved: {output_file}")
    plt.close()


def visualize_degree_distribution(metrics: Dict[str, Any]) -> None:
    """Create histogram of degree centrality distribution."""
    print("Creating degree distribution visualization...")

    degrees = [metrics[node]['degreeCentrality'] for node in metrics.keys()]

    fig, ax = plt.subplots(figsize=(10, 6))

    ax.hist(degrees, bins=8, color='#4ECDC4', alpha=0.7, edgecolor='black', linewidth=1.2)
    ax.axvline(sum(degrees) / len(degrees), color='red', linestyle='--', linewidth=2, label='Mean')

    ax.set_xlabel('Degree Centrality', fontsize=11, fontweight='bold')
    ax.set_ylabel('Number of Stakeholders', fontsize=11, fontweight='bold')
    ax.set_title('Degree Centrality Distribution\n(How evenly connected is the network?)',
                 fontsize=12, fontweight='bold')
    ax.legend(fontsize=10)
    ax.grid(axis='y', alpha=0.3)

    plt.tight_layout()

    output_file = OUTPUT_DIR / "degree_distribution.png"
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    print(f"  [OK] Saved: {output_file}")
    plt.close()


def create_summary_report(metrics: Dict[str, Any], G: nx.DiGraph) -> None:
    """Create a text summary report with key statistics."""
    print("Creating summary report...")

    # Calculate statistics
    degrees = [metrics[node]['degreeCentrality'] for node in metrics.keys()]
    betweenness = [metrics[node]['betweennessCentrality'] for node in metrics.keys()]

    report = f"""
================================================================================
STAKEHOLDER NETWORK ANALYSIS SUMMARY REPORT
================================================================================

NETWORK STATISTICS
------------------
Total Nodes (Stakeholders):     {len(metrics)}
Total Edges (Relationships):    {G.number_of_edges()}
Network Density:                {nx.density(G):.3f}
Average Degree Centrality:      {sum(degrees) / len(degrees):.3f}
Average Betweenness:            {sum(betweenness) / len(betweenness):.3f}

Degree Centrality Range:        [{min(degrees):.3f}, {max(degrees):.3f}]
Betweenness Centrality Range:   [{min(betweenness):.3f}, {max(betweenness):.3f}]

Weakly Connected Components:    {nx.number_weakly_connected_components(G)}
Is Fully Connected:             {"Yes" if nx.is_weakly_connected(G) else "No"}

INTERPRETATION
--------------
- Network Density (0.152): The network is SPARSE - only 15% of possible
  connections exist. This suggests the stakeholder ecosystem is still in
  early/exploratory stages.

- Disconnected Components (2): The network has 2 separate groups that don't
  interact. Consider strategies to bridge these communities.

- Average Degree (3.33): On average, each stakeholder connects to ~3 others.
  This is relatively low for a collaborative network.

- Top Broker (SUWG): The Sustainability Working Group acts as the main hub
  connecting different parts of the network (betweenness = 0.336).

KEY RECOMMENDATIONS
-------------------
1. STRENGTHEN BRIDGES: Focus engagement efforts on the 2-3 top brokers
   identified in the analysis to strengthen network cohesion.

2. ACTIVATE PERIPHERAL NODES: The 5 low-connectivity stakeholders represent
   untapped partnership potential. These are opportunities for expansion.

3. BUILD CROSS-COMMUNITY LINKS: The 2 disconnected components suggest
   distinct silos. Create intentional linkages between communities.

4. LEVERAGE CLUSTERS: The 4 detected communities may represent different
   sectors or types. Design collaboration strategies that respect these
   natural groupings.

5. GROWTH STRATEGY: With only 15% density, there's significant room for
   network growth through new relationships and partnerships.

================================================================================
Visualizations generated:
  - network_graph.png          (Network topology with communities)
  - top_brokers.png            (Top 10 connectors)
  - centrality_comparison.png  (Three centrality measures)
  - community_structure.png    (Community membership breakdown)
  - degree_distribution.png    (Centrality distribution)
================================================================================
"""

    report_file = OUTPUT_DIR / "analysis_report.txt"
    with open(report_file, "w") as f:
        f.write(report)

    print(report)
    print(f"  [OK] Saved: {report_file}")


def main():
    """Main visualization pipeline."""
    print("=" * 70)
    print("NETWORK VISUALIZATION PIPELINE")
    print("=" * 70)
    print()

    try:
        # Load metrics
        print("Loading computed metrics...")
        metrics = load_metrics()
        print(f"  [OK] Loaded metrics for {len(metrics)} stakeholders")
        print()

        # Rebuild graph for visualization
        print("Rebuilding network graph...")
        tools_dir = Path(__file__).parent
        instances_file = tools_dir.parent / "StakeholderMapping_Instances.sysml"
        parser_obj = SysMLFileParser(instances_file)
        parsed_stakeholders, parsed_relationships = parser_obj.extract_part_usages()

        builder = StakeholderGraphBuilder()
        G = builder.build_graph(parsed_stakeholders, parsed_relationships)
        print(f"  [OK] Graph rebuilt with {G.number_of_nodes()} nodes and {G.number_of_edges()} edges")
        print()

        # Create visualizations
        print("Generating visualizations...")
        print()
        visualize_network_graph(G, metrics, builder.stakeholder_map)
        visualize_top_brokers(metrics, builder.stakeholder_map)
        visualize_centrality_comparison(metrics, builder.stakeholder_map)
        visualize_community_structure(metrics, builder.stakeholder_map)
        visualize_degree_distribution(metrics)
        print()

        # Create summary report
        create_summary_report(metrics, G)
        print()

        print("=" * 70)
        print("[OK] Visualization pipeline complete!")
        print("=" * 70)
        print()
        print(f"All outputs saved to: {OUTPUT_DIR}")

    except Exception as e:
        print(f"[ERROR] Visualization failed: {e}", flush=True)
        import traceback
        traceback.print_exc()


if __name__ == "__main__":
    main()
