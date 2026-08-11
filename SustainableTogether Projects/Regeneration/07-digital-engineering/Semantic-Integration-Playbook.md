# Semantic Integration Playbook

**From conceptual alignment to a machine-readable knowledge graph — a reusable method for integrating any two (or more) modelling domains**

Version 0.1 · SustainableTogether / INCOSE Sustainability WG · 2026-07-02
Worked example throughout: FBMC ⇄ CLD ⇄ System Dynamics ⇄ financial model.
Companion artifacts: `FBMC-CLD-Alignment-Ontology.drawio`, `FBMC-CLD-Semantic-Alignment.docx`, `SustainaSun_Concept_Registry.xlsx`.

---

## 0. When to use this playbook

Use it whenever two modelling languages must describe the same reality and stay consistent while both evolve. Symptoms that you need it: the same concept has different names in different artifacts; nobody can prove artifact B still represents artifact A; changes in one artifact silently invalidate the other; reviews find classification errors that a machine could have caught.

The method is domain-agnostic. It has been applied here to business-model canvas → causal loop diagram, but works equally for requirements → architecture, architecture → simulation, LCA model → financial model, etc.

---

## 1. The core principle

> **Never map artifacts to each other. Map every artifact once to a shared set of concepts, and make each artifact a projection of that set.**

Pairwise artifact-to-artifact mapping needs n·(n−1)/2 mappings that all drift independently. Hub-and-spoke needs n mappings, and adding a new domain later reuses the existing hub. The hub is called the **Concept Registry**; its entries are the only things allowed to carry meaning.

The second principle, which makes the first one work:

> **Find the bridge concept — the one thing both domains recognize as their own.**

For FBMC ⇄ CLD the bridge is the **MeasurableAttribute**: canvas elements are *things* and never vary; CLD variables are *quantities* and are nothing but variation. The attribute of an element is simultaneously a property of a canvas thing and exactly what a CLD variable measures. Every integration has such a pivot — finding it is the single most important design act. (For requirements ⇄ simulation it is typically the *quantified condition*; for architecture ⇄ cost model, the *costed element*.)

---

## 2. The maturity ladder

Move up only when the previous level is stable. Each level keeps everything from the level below — nothing conceptual ever changes, only the encoding gets stricter.

| Level | Form | What it gives you | Tooling |
|---|---|---|---|
| **L0 Conceptual** | Metamodels + bridge + invariants (diagrams, prose) | Shared understanding, review-ability | draw.io, docs |
| **L1 Registry** | Controlled vocabulary in a spreadsheet with stable IDs | Traceability, change discipline, human workflow | Excel/CSV |
| **L2 Formal schema** | Metamodel encoded as an ontology (OWL/RDFS) | Machine-checkable *kinds* and *allowed relations* | Turtle, Protégé |
| **L3 Knowledge graph** | Registry rows as RDF triples in a triple store | Queryability (SPARQL), automated validation (SHACL), reasoning | rdflib, Fuseki |
| **L4 Linked knowledge** | Other artifacts, evidence, provenance linked into the graph | One graph answers cross-artifact questions | PROV-O, SysML v2 refs |

---

## 3. Phase A — Conceptual level (L0)

### A1. Metamodel each domain separately

Before mapping anything, write down what *kinds* of things each language talks about, as a small class diagram. Do them separately and honestly — resist harmonizing at this stage; the mismatch you find IS the design input.

*Example:* FBMC talks about Actor, StakeholderRole, Need, ValueProposition (co-creation/co-destruction), Activity, Resource, Goal/Indicator, BiophysicalStock — relations, no time. CLD talks about SystemVariable, CausalLink (+/−, delay), FeedbackLoop (R/B) — time behaviour, no actors. (drawio pages 1–2.)

### A2. Define the bridge concept

One class, referenced by both metamodels, with the attributes every downstream stage will need. Design rule: each bridge instance must anchor to **exactly one** element in the source domain and be realized by **at most one** element in the target domain.

*Example:* `MeasurableAttribute { id, canonicalName, definition, unit, dimension, sdTypeHint, inBoundary, version }` with `isAttributeOf → FBMCElement (1)` and `realizedAs → SystemVariable (0..1)`. (drawio page 3.)

### A3. Write type-level derivation rules

Rules that say which *kind* of source element yields which *kind* of target element. These make the translation repeatable instead of artistic.

*Example:* Resource/BiophysicalStock → Stock; Activity → Flow; perception/quality/service → Auxiliary; governance choice → Parameter; Goal+Indicator → Output that MUST appear in the model.

### A4. Define invariants

The always-true statements that define "aligned". Write them so a machine could check them later (Phase C does exactly that). Aim for 5–10; each should block one observed or foreseeable defect class.

*Example (I1–I7):* full trace variable→attribute→element; coverage or documented exclusion; derived (never asserted) loop polarity; single-concept direction-neutral names; actual ≠ perceived; every goal indicator present; all change via change records.

### A5. Define the change workflow

Change types (add / rename / split / merge / retire), the rule that IDs are never reused, and the rule that artifacts are **regenerated from the registry, never edited independently**.

**Phase A exit criterion:** a colleague can take a new element in domain A and produce the correct domain-B counterpart using only your rules, without asking you anything.

---

## 4. Phase B — Registry level (L1)

Implement the bridge as a spreadsheet — deliberately low-tech, because domain experts must own it.

**Structure (one sheet per box of the metamodel):**

- `Concepts` — one row per bridge instance. Columns = the bridge attributes + anchor + target name + legacy names + status/version.
- One sheet per *relation-heavy* class (e.g. `CausalLinks`, `Loops`) with foreign-key columns referencing Concept IDs. Names resolve via lookup formulas — never retyped.
- `ChangeLog` — date, type, affected IDs, rationale, author, affected artifacts.
- `Lists` — dropdown sources, so enumerations are controlled.
- `README` — the append/maintain workflow, in the file itself.

**Non-negotiable rules:**

1. IDs are stable, prefixed (`GEN-` generic, `PV-` instance…), and never reused. Retire rows; never delete.
2. Anything derivable is a formula, not an entry (e.g. loop type `=IF(ISODD(NegLinkCount),"B","R")`) — asserted redundancy is where errors live.
3. Every change lands in `ChangeLog` **before** any artifact is republished.
4. Colour code: manual-input cells vs. formula/fixed cells.

**Phase B exit criterion:** the registry has survived a few real change cycles, and people reach for it (not for the artifacts) when they argue about a concept.

---

## 5. Phase C — Machine-readable level (L2–L4)

The conceptual model does not change. You re-encode it so machines can validate, query and reason over it.

### C1. Translation table (plain-language)

| You have (L0/L1) | Becomes (L2–L4) | Standard |
|---|---|---|
| Stable ID `GEN-003` | URI `:GEN-003` | RDF |
| Registry row | Set of triples (facts, "ABox") | RDF |
| Metamodel class diagram | Ontology (schema, "TBox") | OWL / RDFS |
| Enumerations (SDType…) | SKOS concept schemes | SKOS |
| Units column | Links to unit ontology | QUDT |
| Invariants I1–I7 | Validation shapes | SHACL |
| Coverage / trace questions | Queries | SPARQL |
| Derivation formulas | Inference rules | SPARQL rules / OWL |
| ChangeLog | Provenance activities | PROV-O |

### C2. URI policy (do this first)

One namespace, e.g. `https://w3id.org/sustainabletogether/fbmc-cld#` (w3id.org gives you free, permanent redirects). Schema terms in `UpperCamelCase` / `lowerCamelCase`; instances keep their registry IDs. URIs are forever — same rule as registry IDs.

### C3. Encode the schema (TBox) — `fbmc-cld.ttl`

Mechanical translation of the drawio metamodel. Illustrative excerpt:

```turtle
@prefix :     <https://w3id.org/sustainabletogether/fbmc-cld#> .
@prefix owl:  <http://www.w3.org/2002/07/owl#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

:FBMCElement        a owl:Class ; rdfs:comment "Any block entry of the canvas (SSBMO)." .
:MeasurableAttribute a owl:Class ; rdfs:comment "Bridge: a time-varying, measurable attribute of exactly one FBMCElement." .
:SystemVariable     a owl:Class .
:CausalLink         a owl:Class .
:FeedbackLoop       a owl:Class .

:isAttributeOf a owl:ObjectProperty ;
    rdfs:domain :MeasurableAttribute ; rdfs:range :FBMCElement .
:realizes a owl:ObjectProperty ;
    rdfs:domain :SystemVariable ; rdfs:range :MeasurableAttribute .
:from a owl:ObjectProperty ; rdfs:domain :CausalLink ; rdfs:range :SystemVariable .
:to   a owl:ObjectProperty ; rdfs:domain :CausalLink ; rdfs:range :SystemVariable .
```

Reuse before inventing: SKOS (labels/definitions), QUDT (units), PROV-O (change history), and cite the source ontology of the domain (here: Upward & Jones SSBMO) with `rdfs:seeAlso`.

### C4. Generate instances (ABox) — `xlsx2rdf.py`

A small converter reads the registry and emits triples; rerun per registry version. Skeleton:

```python
from rdflib import Graph, Namespace, Literal, RDF
from openpyxl import load_workbook

NS = Namespace("https://w3id.org/sustainabletogether/fbmc-cld#")
g = Graph(); g.bind("", NS)
wb = load_workbook("SustainaSun_Concept_Registry.xlsx", data_only=True)

for row in wb["Concepts"].iter_rows(min_row=2, values_only=True):
    cid, name, definition, block, _, unit, dim, sdtype, inb = row[:9]
    if not cid: continue
    c = NS[cid]
    g.add((c, RDF.type, NS.MeasurableAttribute))
    g.add((c, NS.canonicalName, Literal(name)))
    g.add((c, NS.isAttributeOf, NS[block.split(" (")[0].replace(" ", "_")]))
    g.add((c, NS.sdType, NS[sdtype]))

for row in wb["CausalLinks"].iter_rows(min_row=2, values_only=True):
    lid, f, t, _, _, pol = row[:6]
    if not lid: continue
    l = NS[lid]
    g.add((l, RDF.type, NS.CausalLink))
    g.add((l, NS["from"], NS[f])); g.add((l, NS.to, NS[t]))
    g.add((l, NS.polarity, Literal(pol)))

g.serialize("registry.ttl", format="turtle")
```

### C5. Invariants as SHACL — `shapes.ttl`

Each invariant becomes a shape; validation is a command (`pyshacl -s shapes.ttl -d registry.ttl`) that returns the exact violating triples. Example — I1, "every variable realizes exactly one attribute":

```turtle
:SystemVariableShape a sh:NodeShape ;
    sh:targetClass :SystemVariable ;
    sh:property [
        sh:path :realizes ;
        sh:minCount 1 ; sh:maxCount 1 ;
        sh:class :MeasurableAttribute ;
        sh:message "I1 violated: variable must realize exactly one MeasurableAttribute." ;
    ] .
```

I2 (coverage) and I3 (derived loop polarity) are SHACL-SPARQL constraints; I4 (naming) is a regex-based shape; I7 is enforced by requiring a `prov:wasGeneratedBy` on every changed node.

### C6. Load, query, reason (L3)

Load `fbmc-cld.ttl` + `registry.ttl` into Apache Jena Fuseki (or GraphDB Free). Now the alignment questions are queries — e.g. invariant I2 as SPARQL:

```sparql
# FBMC elements with no in-boundary attribute and no exclusion rationale
SELECT ?el WHERE {
  ?el a :FBMCElement .
  FILTER NOT EXISTS { ?a :isAttributeOf ?el ; :inCldBoundary true }
  FILTER NOT EXISTS { ?a :isAttributeOf ?el ; :exclusionRationale ?r }
}
```

Or the trace question no spreadsheet answers well: *"every CLD variable causally downstream of an Eco-dimension attribute anchored to an ecosystem actor"* — a three-hop graph pattern.

### C7. Grow the knowledge graph (L4)

Link everything else through the same URIs: Vensim variables (`:vensimName`, or export the .mdl and generate `:sdImplements` triples), Excel KPI cells (`:boundToCell "KPIs!B7"`), papers and workshop notes as `prov:Entity` evidence for each `CausalLink :rationale`, LCA datasets, and — in the INCOSE context — SysML v2 model elements referencing the same URIs, which bridges the business-model graph to the system model. The graph becomes the project's memory: any artifact can be regenerated from it, and any claim can be traced to its evidence.

---

## 6. Toolchain (all free) and repo layout

| Purpose | Tool |
|---|---|
| Authoring (humans) | Excel registry (unchanged) |
| Triples generation | Python + rdflib |
| Validation | pySHACL (run in CI on every commit) |
| Store + SPARQL endpoint | Apache Jena Fuseki / GraphDB Free |
| Schema inspection | Protégé; WebVOWL for visualization |
| Versioning | git — all .ttl files are text; diffs are meaningful |

```
/ontology/fbmc-cld.ttl        # TBox — changes rarely, reviewed like code
/ontology/shapes.ttl          # invariants as SHACL
/registry/SustainaSun_Concept_Registry.xlsx   # human source
/registry/registry-v0.1.ttl   # generated ABox, one file per version
/scripts/xlsx2rdf.py          # converter
/scripts/validate.sh          # pyshacl + coverage queries; exit non-zero on violation
```

Property-graph note: Neo4j is easier to demo, but you lose OWL/SHACL/SPARQL standards, reasoning and interoperability. For an open reference architecture, use RDF/OWL as the master and generate a property graph from it if a team wants one.

---

## 7. Reusable checklist for ANY new integration

**Phase A — Conceptual**
1. Metamodel domain A and domain B separately (class diagrams).
2. Find the bridge concept (the pivot both domains own). Cardinalities: anchor exactly-1, realize at-most-1.
3. Write type-level derivation rules A→B.
4. Write 5–10 invariants, phrased machine-checkably.
5. Define change types + "regenerate, never hand-edit" rule.

**Phase B — Registry**
6. Build the spreadsheet: Concepts + relation sheets + ChangeLog + Lists + README.
7. Stable prefixed IDs, never reused. Derivables as formulas. Dropdown validations.
8. Pre-fill the generic template; instances only rename/extend it.

**Phase C — Machine-readable**
9. Fix the URI namespace (w3id.org).
10. Encode the metamodel as OWL; reuse SKOS/QUDT/PROV-O.
11. Write the xlsx→RDF converter; one .ttl per registry version.
12. Encode invariants as SHACL; wire into CI.
13. Stand up the triple store; save the standard queries (coverage, trace, orphans).
14. Link downstream artifacts and evidence into the graph (PROV-O).

**Exit tests**
- A stranger can derive a correct B-element from a new A-element using only the rules (A).
- The registry survives real change cycles as the reference people argue from (B).
- `validate.sh` fails the build when any invariant breaks, and the coverage query returns empty (C).

---

## 8. References

- Upward, A. & Jones, P. (2015). *An Ontology for Strongly Sustainable Business Models.* Organization & Environment.
- W3C: RDF 1.1, OWL 2, SKOS, SHACL, SPARQL 1.1, PROV-O. QUDT for units.
- Sterman, J. (2000). *Business Dynamics.* — CLD/SD well-formedness.
- This folder: drawio ontology (4 pages), Word method doc, Excel registry, WG deck.
