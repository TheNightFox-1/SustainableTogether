"""graph.py — rdflib-backed in-memory knowledge graph for MBSE-LCA integration.

Responsibilities:
- Load the OWL alignment ontology and instance data (Turtle files).
- Provide an add_triples() hook so other modules can inject RDF triples.
- Wrap SPARQL SELECT queries for convenient use throughout the pipeline.
- Expose all shared namespace objects so other modules import from here.
"""

from __future__ import annotations

from pathlib import Path
from typing import Iterator

from rdflib import ConjunctiveGraph, Namespace, URIRef, Literal, BNode  # noqa: F401
from rdflib.namespace import RDF, RDFS, OWL, XSD, SKOS  # noqa: F401

# ─────────────────────────────────────────────────────────────────
#  Shared namespace objects (imported by other src modules)
# ─────────────────────────────────────────────────────────────────
SYSML = Namespace("http://www.omg.org/spec/SysML/20230201/SysML#")
LCA   = Namespace("http://mbse-lca.org/ontology#")
QUDT  = Namespace("http://qudt.org/schema/qudt/")
UNIT  = Namespace("http://qudt.org/vocab/unit/")
EX    = Namespace("http://mbse-lca.org/instance/solarx#")

# ─────────────────────────────────────────────────────────────────
#  Canonical file paths (resolved relative to the project root)
# ─────────────────────────────────────────────────────────────────
_PROJECT_ROOT = Path(__file__).parent.parent
ONTOLOGY_PATH = _PROJECT_ROOT / "ontology" / "lca_sysml_alignment.ttl"
BATTERY_PATH  = _PROJECT_ROOT / "data"     / "battery.ttl"


class LCAKnowledgeGraph:
    """
    In-memory RDF knowledge graph built on rdflib.ConjunctiveGraph.

    Usage::

        kg = LCAKnowledgeGraph()
        kg.load_ontology()
        kg.load_instance_data()          # or rely on SysMLReader fallback
        rows = kg.query(SPARQL_STRING)
    """

    def __init__(self) -> None:
        self.g = ConjunctiveGraph()
        self._bind_namespaces()

    # ------------------------------------------------------------------
    # Setup
    # ------------------------------------------------------------------

    def _bind_namespaces(self) -> None:
        self.g.bind("sysml",   SYSML)
        self.g.bind("lca",     LCA)
        self.g.bind("qudt",    QUDT)
        self.g.bind("unit",    UNIT)
        self.g.bind("ex",      EX)
        self.g.bind("owl",     OWL)
        self.g.bind("skos",    SKOS)
        self.g.bind("rdfs",    RDFS)

    # ------------------------------------------------------------------
    # Loading
    # ------------------------------------------------------------------

    def load_ontology(self, path: Path = ONTOLOGY_PATH) -> None:
        """Parse the alignment ontology (Turtle) into the graph."""
        self.g.parse(str(path), format="turtle")
        print(f"[graph] Loaded ontology      : {path.name}  ({len(self.g)} triples total)")

    def load_instance_data(self, path: Path = BATTERY_PATH) -> None:
        """Parse instance data (Turtle) into the graph."""
        self.g.parse(str(path), format="turtle")
        print(f"[graph] Loaded instance data : {path.name}  ({len(self.g)} triples total)")

    # ------------------------------------------------------------------
    # Mutation
    # ------------------------------------------------------------------

    def add_triples(self, triples: list[tuple]) -> None:
        """
        Add a list of ``(subject, predicate, object)`` tuples.
        All three elements must be rdflib terms (URIRef / Literal / BNode).
        """
        for s, p, o in triples:
            self.g.add((s, p, o))

    # ------------------------------------------------------------------
    # Query
    # ------------------------------------------------------------------

    def query(self, sparql: str):
        """
        Execute a SPARQL SELECT query and return the rdflib result set.
        Iterate over it like::

            for row in kg.query(SPARQL):
                print(row.name, row.mass)
        """
        return self.g.query(sparql)

    # ------------------------------------------------------------------
    # Serialisation / inspection
    # ------------------------------------------------------------------

    def serialize(self, fmt: str = "turtle") -> str:
        """Serialise the full graph to a string in the requested format."""
        return self.g.serialize(format=fmt)

    def triples(self, pattern: tuple = (None, None, None)) -> Iterator:
        """Iterate over triples matching the given (s, p, o) pattern."""
        return self.g.triples(pattern)

    def __len__(self) -> int:
        return len(self.g)

    def __repr__(self) -> str:
        return f"LCAKnowledgeGraph({len(self)} triples)"
