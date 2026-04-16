"""
Graph builder for stakeholder network.

Constructs a NetworkX directed graph from SysML stakeholder and relationship data.
Handles bidirectional relationships as two directed edges.
"""

import networkx as nx
from typing import List, Dict, Any, Tuple


class StakeholderGraphBuilder:
    """Builds a directed graph from stakeholder and relationship data."""

    def __init__(self):
        self.G = nx.DiGraph()
        self.stakeholder_map = {}  # Maps stakeholder ID to stakeholder data

    def add_stakeholders(self, stakeholders: List[Dict[str, Any]]) -> None:
        """
        Add stakeholder nodes to the graph.

        Args:
            stakeholders: List of parsed stakeholder dictionaries
        """
        for stakeholder in stakeholders:
            stakeholder_id = stakeholder.get("id")
            if not stakeholder_id:
                continue

            # Store mapping for relationship resolution
            self.stakeholder_map[stakeholder_id] = stakeholder

            # Add node with stakeholder attributes
            self.G.add_node(
                stakeholder_id,
                name=stakeholder.get("name"),
                declaredName=stakeholder.get("declaredName"),
                engagementStatus=stakeholder.get("engagementStatus"),
                priorityLevel=stakeholder.get("priorityLevel"),
                engagementScore=stakeholder.get("engagementScore"),
                orgType=stakeholder.get("orgType"),
                primaryDomainFocus=stakeholder.get("primaryDomainFocus"),
                audienceServed=stakeholder.get("audienceServed"),
                fundingModel=stakeholder.get("fundingModel"),
            )

        print(f"Added {len(stakeholders)} stakeholder nodes to graph")

    def add_relationships(self, relationships: List[Dict[str, Any]]) -> None:
        """
        Add relationship edges to the graph.

        Bidirectional relationships are stored as two directed edges.
        Unidirectional relationships are stored as a single directed edge.

        Args:
            relationships: List of parsed relationship dictionaries
        """
        added_edges = 0

        for rel in relationships:
            source_id = rel.get("sourceStakeholderId")
            target_id = rel.get("targetStakeholderId")

            # Validate that both stakeholders exist
            if source_id not in self.stakeholder_map:
                print(f"Warning: Source stakeholder {source_id} not found")
                continue
            if target_id not in self.stakeholder_map:
                print(f"Warning: Target stakeholder {target_id} not found")
                continue

            direction = rel.get("direction", "Unidirectional")
            rel_type = rel.get("relationshipType")
            strength = rel.get("strengthFrequency")
            flow_types = rel.get("flowTypes", [])
            collab_score = rel.get("collaborationPotentialScore", 0)

            # Build edge attributes
            edge_attrs = {
                "relationshipId": rel.get("id"),
                "relationshipType": rel_type,
                "strength": strength,
                "flowTypes": flow_types,
                "collaborationScore": collab_score,
                "dateEstablished": rel.get("dateEstablished"),
            }

            # Add edge(s) based on directionality
            if direction == "Bidirectional" or direction == 2:
                # Add two directed edges
                self.G.add_edge(source_id, target_id, **edge_attrs)
                self.G.add_edge(target_id, source_id, **edge_attrs)
                added_edges += 2
            else:
                # Add single directed edge
                self.G.add_edge(source_id, target_id, **edge_attrs)
                added_edges += 1

        print(f"Added {added_edges} edges to graph ({len(relationships)} relationships)")

    def build_graph(
        self,
        stakeholders: List[Dict[str, Any]],
        relationships: List[Dict[str, Any]],
    ) -> nx.DiGraph:
        """
        Build the complete graph from stakeholders and relationships.

        Args:
            stakeholders: List of parsed stakeholder dictionaries
            relationships: List of parsed relationship dictionaries

        Returns:
            NetworkX DiGraph
        """
        self.add_stakeholders(stakeholders)
        self.add_relationships(relationships)
        return self.G

    def get_graph_summary(self) -> Dict[str, Any]:
        """
        Get summary statistics of the graph.

        Returns:
            Dictionary with node count, edge count, density, etc.
        """
        return {
            "num_nodes": self.G.number_of_nodes(),
            "num_edges": self.G.number_of_edges(),
            "density": nx.density(self.G),
            "is_connected": nx.is_weakly_connected(self.G),
            "num_weakly_connected_components": nx.number_weakly_connected_components(self.G),
            "average_degree": (
                sum(dict(self.G.degree()).values()) / self.G.number_of_nodes()
                if self.G.number_of_nodes() > 0
                else 0
            ),
        }
