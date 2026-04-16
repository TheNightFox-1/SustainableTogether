"""
Network analysis module for stakeholder ecosystem.

Computes 9 metrics from graph structure:
- Centrality measures (degree, betweenness, closeness)
- Clustering and community detection
- Structural metrics (holes, dormancy, broker potential)
"""

import networkx as nx
from typing import Dict, Any, List, Tuple
from datetime import datetime, timedelta
from config import NETWORK_ANALYSIS_CONFIG


class NetworkAnalyzer:
    """Computes network analysis metrics on a stakeholder graph."""

    def __init__(self, G: nx.DiGraph, stakeholder_map: Dict[str, Any]):
        """
        Initialize analyzer with a graph.

        Args:
            G: NetworkX directed graph
            stakeholder_map: Mapping of stakeholder ID to stakeholder data
        """
        self.G = G
        self.stakeholder_map = stakeholder_map
        self.metrics = {}

    def compute_degree_centrality(self) -> Dict[str, float]:
        """
        Compute degree centrality (normalized node degree).

        For directed graphs: treats edges as undirected for centrality.

        Returns:
            Dictionary mapping node ID to centrality (0-1)
        """
        # Convert to undirected for degree centrality calculation
        G_undirected = self.G.to_undirected()
        centrality = nx.degree_centrality(G_undirected)
        return centrality

    def compute_betweenness_centrality(self) -> Dict[str, float]:
        """
        Compute betweenness centrality (frequency on shortest paths).

        Identifies brokers and structural bridges.

        Returns:
            Dictionary mapping node ID to centrality (0-1)
        """
        centrality = nx.betweenness_centrality(self.G)
        return centrality

    def compute_closeness_centrality(self) -> Dict[str, float]:
        """
        Compute closeness centrality (average distance to all other nodes).

        Identifies central/influential nodes.

        Returns:
            Dictionary mapping node ID to centrality (0-1)
        """
        # For directed graphs, compute on weakly connected components
        centrality = {}
        for node in self.G.nodes():
            # Use undirected version for closeness calculation
            G_undirected = self.G.to_undirected()
            if nx.has_path(G_undirected, node, list(self.G.nodes())[0]):
                closeness = nx.closeness_centrality(G_undirected, node)
                centrality[node] = closeness
            else:
                centrality[node] = 0.0
        return centrality

    def compute_clustering_coefficient(self) -> Dict[str, float]:
        """
        Compute clustering coefficient (local neighborhood density).

        Identifies tightly knit communities.

        Returns:
            Dictionary mapping node ID to coefficient (0-1)
        """
        # Use undirected version for clustering
        G_undirected = self.G.to_undirected()
        clustering = nx.clustering(G_undirected)
        return clustering

    def compute_community_detection(self) -> Tuple[Dict[str, int], int]:
        """
        Detect community structure using greedy modularity optimization.

        Returns:
            Tuple of (community_map, num_communities)
            where community_map is node -> community_id
        """
        G_undirected = self.G.to_undirected()
        communities = list(nx.algorithms.community.greedy_modularity_communities(G_undirected))

        community_map = {}
        for comm_id, community in enumerate(communities):
            for node in community:
                community_map[node] = comm_id

        return community_map, len(communities)

    def compute_structural_hole_score(self) -> Dict[str, float]:
        """
        Compute structural hole score (opportunity to broker between clusters).

        Uses constraint measure: 1 - avg(correlation to neighbors).
        High score = high opportunity to broker.

        Returns:
            Dictionary mapping node ID to score (0-1)
        """
        scores = {}
        G_undirected = self.G.to_undirected()

        for node in self.G.nodes():
            neighbors = list(G_undirected.neighbors(node))
            if not neighbors or len(neighbors) < 2:
                scores[node] = 0.0
                continue

            # Compute correlation between neighbors (normalized)
            total_edges_between_neighbors = 0
            for i, n1 in enumerate(neighbors):
                for n2 in neighbors[i + 1 :]:
                    if G_undirected.has_edge(n1, n2):
                        total_edges_between_neighbors += 1

            max_possible_edges = len(neighbors) * (len(neighbors) - 1) / 2
            if max_possible_edges > 0:
                correlation = total_edges_between_neighbors / max_possible_edges
                score = 1.0 - correlation
            else:
                score = 0.0

            scores[node] = score

        return scores

    def compute_dormancy_score(self) -> Dict[str, float]:
        """
        Compute dormancy score based on last interaction dates.

        Requires lastInteractionDate in edge attributes.
        Returns 0 (active) to 1 (dormant).

        Returns:
            Dictionary mapping node ID to dormancy (0-1)
        """
        scores = {}
        today = datetime.now()
        temporal_window = NETWORK_ANALYSIS_CONFIG.get("temporal_window_days", 365)

        for node in self.G.nodes():
            # Get all edges connected to this node
            edges = list(self.G.in_edges(node, data=True)) + list(self.G.out_edges(node, data=True))

            if not edges:
                scores[node] = 1.0  # Isolated nodes are dormant
                continue

            # Find most recent interaction date
            most_recent = None
            for u, v, attrs in edges:
                date_str = attrs.get("dateEstablished")
                if date_str:
                    try:
                        date = datetime.fromisoformat(date_str.replace("Z", "+00:00"))
                        if most_recent is None or date > most_recent:
                            most_recent = date
                    except ValueError:
                        continue

            if most_recent is None:
                scores[node] = 0.5  # Unknown interaction date
            else:
                days_since = (today - most_recent.replace(tzinfo=None)).days
                dormancy = min(days_since / temporal_window, 1.0)
                scores[node] = dormancy

        return scores

    def compute_broker_potential(self, betweenness: Dict[str, float]) -> Dict[str, float]:
        """
        Compute broker potential score.

        Derived from betweenness centrality (higher = more brokering opportunity).

        Args:
            betweenness: Betweenness centrality scores

        Returns:
            Dictionary mapping node ID to broker potential (0-1)
        """
        # Broker potential is simply betweenness centrality
        # Could be refined by combining with structural hole score
        return betweenness

    def compute_network_growth_rate(self) -> Dict[str, float]:
        """
        Compute network growth rate per node.

        Estimated as the density of edges created recently (last 90 days).
        Returns edges per month as a normalized score.

        Returns:
            Dictionary mapping node ID to growth rate
        """
        scores = {}
        today = datetime.now()
        growth_window = 90  # days

        for node in self.G.nodes():
            edges = list(self.G.in_edges(node, data=True)) + list(self.G.out_edges(node, data=True))
            recent_edges = 0

            for u, v, attrs in edges:
                date_str = attrs.get("dateEstablished")
                if date_str:
                    try:
                        date = datetime.fromisoformat(date_str.replace("Z", "+00:00"))
                        days_old = (today - date.replace(tzinfo=None)).days
                        if days_old <= growth_window:
                            recent_edges += 1
                    except ValueError:
                        continue

            # Normalize to edges per month
            months_in_window = growth_window / 30.0
            growth_rate = recent_edges / months_in_window if months_in_window > 0 else 0.0
            scores[node] = growth_rate

        return scores

    def compute_all_metrics(self) -> Dict[str, Dict[str, float]]:
        """
        Compute all 9 metrics for all nodes.

        Returns:
            Dictionary mapping node ID to dict of metrics
        """
        print("Computing network metrics...")

        degree = self.compute_degree_centrality()
        betweenness = self.compute_betweenness_centrality()
        closeness = self.compute_closeness_centrality()
        clustering = self.compute_clustering_coefficient()
        communities, num_communities = self.compute_community_detection()
        structural_holes = self.compute_structural_hole_score()
        dormancy = self.compute_dormancy_score()
        growth_rate = self.compute_network_growth_rate()
        broker_potential = self.compute_broker_potential(betweenness)

        print(f"Detected {num_communities} communities")

        # Assemble metrics per node
        metrics = {}
        for node in self.G.nodes():
            metrics[node] = {
                "degreeCentrality": degree.get(node, 0.0),
                "betweennessCentrality": betweenness.get(node, 0.0),
                "closenessCentrality": closeness.get(node, 0.0),
                "clusteringCoefficient": clustering.get(node, 0.0),
                "communityId": communities.get(node, -1),
                "structuralHoleScore": structural_holes.get(node, 0.0),
                "networkGrowthRate": growth_rate.get(node, 0.0),
                "dormancyScore": dormancy.get(node, 0.0),
                "brokerPotential": broker_potential.get(node, 0.0),
            }

        self.metrics = metrics
        print(f"Computed metrics for {len(metrics)} nodes")
        return metrics

    def get_top_brokers(self, n: int = 5) -> List[Tuple[str, Dict[str, float]]]:
        """
        Get top N brokers by betweenness centrality.

        Args:
            n: Number of top brokers to return

        Returns:
            List of (node_id, metrics) tuples sorted by broker potential
        """
        if not self.metrics:
            return []

        sorted_nodes = sorted(
            self.metrics.items(),
            key=lambda x: x[1].get("brokerPotential", 0.0),
            reverse=True,
        )
        return sorted_nodes[:n]

    def get_emerging_clusters(self) -> Dict[int, List[str]]:
        """
        Get nodes grouped by community.

        Returns:
            Dictionary mapping community_id to list of node IDs
        """
        if not self.metrics:
            return {}

        clusters = {}
        for node_id, node_metrics in self.metrics.items():
            comm_id = node_metrics.get("communityId", -1)
            if comm_id not in clusters:
                clusters[comm_id] = []
            clusters[comm_id].append(node_id)

        return clusters
