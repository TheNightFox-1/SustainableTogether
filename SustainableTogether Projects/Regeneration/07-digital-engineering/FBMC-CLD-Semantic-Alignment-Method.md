# FBMC ⇄ CLD Semantic Alignment — Method Note

**Companion to:** `FBMC-CLD-Alignment-Ontology.drawio` (3 pages: FBMC metamodel, CLD metamodel, Alignment bridge)
**Status:** v0.1 concept — no project-specific content; general method, applied to FBMC→CLD

## The problem this solves

FBMC and CLD speak different languages. The canvas describes *things* (actors, resources, activities, value propositions) and their relations; a CLD describes *quantities that vary* and their causal influences. When a CLD is authored freehand from a canvas, vocabulary drifts (v1 vs. v2 of the SustainaSun papers), loops get relabelled or misclassified, and there is no way to prove the CLD still represents the business model.

## Core idea

An FBMC element never rises or falls — a **measurable attribute** of it does. "Financier" (Actor) is not a CLD variable; *financier confidence* (an attribute of that Actor) is. The alignment layer makes this explicit:

> FBMCElement 1 ←— *is attribute of* — MeasurableAttribute — *realized as* —→ 0..1 SystemVariable

The set of MeasurableAttributes is the **Concept Registry** — the single source of truth. The canvas and the CLD are both projections of it and are never edited independently.

## General pattern (any two domains)

Hub-and-spoke via a shared registry, not pairwise mapping:

1. **Metamodel each domain separately** — make explicit what kinds of things each language talks about (drawio pages 1 and 2).
2. **Define the bridge class** whose instances both domains reference (MeasurableAttribute, page 3).
3. **Define derivation rules** at the type level: Resource/BiophysicalStock → Stock, Activity → Flow, Relationship/Reputation → Auxiliary, Goal/Indicator → Output, Governance choice → Parameter.
4. **Define invariants** that must hold after every change (I1–I7 on page 3).
5. **Route all change through ChangeRecords** on the registry; regenerate the domain artifacts from it.

Adding a third or fourth domain (Vensim SD, Excel financial model) reuses the same registry — no new pairwise mappings.

## Information flow FBMC → CLD

1. Enumerate FBMC elements zone by zone (FBMC is the starting point).
2. Per element: which measurable attribute varies over time and matters to the problem?
3. Register it: canonical name (single concept, direction-neutral), definition, unit, dimension (Econ/Soc/Eco), sdTypeHint.
4. Decide `inCldBoundary`; record exclusion rationale (this formalizes the SSBMO boundary concept).
5. Generate CLD variables 1:1 from in-boundary attributes.
6. Draw causal links only between registered variables; loop type R/B is *derived* from link polarities, never asserted.
7. Validate invariants; publish as a versioned CLD.

## Invariants (summary)

| # | Rule | Defect it prevents (seen in v1/v2) |
|---|------|-----------------------------------|
| I1 | Variable → exactly 1 attribute → exactly 1 canvas element | CLD not traceable to FBMC |
| I2 | Full coverage or explicit exclusion | Ecological actors, co-destructions missing from CLD |
| I3 | Loop type derived from polarity count | v2 "R7" is actually balancing |
| I4 | One concept, direction-neutral name | "financier confidence and ROI confidence", "reputational gain" |
| I5 | Actual ≠ perceived | v2 collapsed environmental benefit into reputation |
| I6 | Every Goal/Indicator appears in CLD | Tri-profit not reportable by the model |
| I7 | Changes only via ChangeRecord | Silent v1→v2 renames and loop renumbering |

## Next stages (same bridge)

- **Vensim SD:** sdTypeHint → Level/Rate/Auxiliary/Constant; `vensimName` derived from canonical name; units from registry.
- **Excel financial model:** line items bind to Econ-dimension attributes; KPI sheet rows bind to Indicators.
- **Instantiation:** populate the registry for the chosen SustainaSun model, reconciling v1/v2 names, then regenerate CLD v3.
