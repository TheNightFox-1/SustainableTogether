# Task Brief — Group 5, Digital Engineering

**Group:** Group 5 — Digital Engineering
**Part of:** INCOSE / GfSE Sustainability WG · Regeneration Task-Force · SustainableTogether
**Reads from:** the top-level [`README.md`](../README.md), the [RQ decomposition](../RQ-DECOMPOSITION.md), the [Desired-Outcomes Interface](../03-methodology/01-desired-outcomes-interface.md), and the [Glossary](../GLOSSARY.md)
**Owns research questions:** RQ3.1 ★ (leads RQ3) · RQ1.6 · success criterion C6

---

## 1. Purpose

Provide and **validate** the formal bridge between the project's modelling domains — business model canvas, Causal Loop Diagram (CLD), SysML v2, and lifecycle assessment — so that consistency between artefacts is a machine-checkable fact rather than an assurance.

## 2. The problem this group solves

Five groups are modelling the same system in four incompatible notations. A "community equity" concept appears as a canvas block in the Flourishing Business Model Canvas (FBMC), a variable in the CLD, a capital-structure line in the financial model, and a requirement in SysML. Nothing currently guarantees these are the same thing, and nothing detects it when they drift apart.

That is not a documentation problem, it is the **methodological claim itself**. RQ3 asks whether ecological, social, and economic outcomes can be co-optimised through an integrated method. Integration that cannot be verified is not integration; it is a diagram of one.

> **Can artefacts spanning business model, System Dynamics and MBSE be formally aligned from a single shared vocabulary — and can a machine prove they still agree after someone edits one of them?**

This is why this group leads RQ3 despite being described earlier as "tooling, not a research group". The pipeline is the evidence.

## 3. Research questions & success criteria owned

| Sub-RQ | Question | Answering artefact | Acceptance test | Criteria |
|---|---|---|---|---|
| **RQ3.1** ★ | Can artefacts spanning business model, System Dynamics and MBSE be formally aligned from a single shared vocabulary and **machine-validated** for consistency? | Concept registry, OWL ontology, SHACL shapes, validation pipeline, regression suite | Validation runs automatically; injected defects are caught by the regression fixtures; alignment is never asserted by hand | C6 |
| **RQ1.6** | Do the business model, CLD, financial model and SysML model describe the **same** system? | Semantic consistency report | Registry invariants I1–I7 pass; every concept used in the financial model resolves to a registry entry | C6 → C1 |

RQ3.1 is what makes the **whole DO × Use matrix** in [`../RQ-DECOMPOSITION.md`](../RQ-DECOMPOSITION.md#the-do--use-matrix--the-evidence-for-rq3) checkable rather than claimed. Every other group fills one column; this group validates the links between them.

## 4. Scope

**In scope**
- Maintain and extend the **concept registry** — the single vocabulary all groups' concepts resolve to.
- Maintain the **ontology stack**: OWL terminology (`fbmc-cld.ttl`), SHACL validation shapes (`shapes.ttl`), RDF instances (`registry_latest.ttl`).
- Maintain the **automation pipeline**: registry validation, CLD generation, RDF conversion, change logging, regression testing.
- **Extend the bridge to SysML v2** — currently the method covers FBMC ↔ CLD; RQ3.1 requires SysML in the same graph.
- Produce the **semantic consistency report** each time a group's artefact changes materially.
- Continue developing the **Integrated Viability & Impact Ontology (IVIO)** and the domain-agnostic form of the Semantic Integration Playbook.

**Out of scope** (owned by other groups — do not do here)
- Deciding *what* the business model says → **Group 1, Business Model**.
- Deciding what the architecture is → **Group 2, Product Regeneration**.
- Interpreting loop behaviour → **Group 4, System Dynamics** (this group guarantees the CLD is *well-formed*, not that it is *right about the world*).
- Running the LCA → **Group 3, LCA & Financial**.

**The boundary that matters:** this group owns **semantic correctness**, never domain truth. A registry that validates cleanly can still describe a bad business model. Say so when it does; do not let a green pipeline be mistaken for a sound design.

## 5. Starting assets (do not redo — build on these)

| Asset | Location | Use |
|---|---|---|
| Semantic Integration Playbook (L0–L4) | `Semantic-Integration-Playbook.md` | The reusable method, written domain-agnostic |
| FBMC↔CLD alignment ontology (4 pages) | `FBMC-CLD-Alignment-Ontology.drawio` | Metamodels plus the bridge concept |
| Concept registry | `SustainaSun_Concept_Registry.xlsx` | 21 generic + 21 PV instance concepts, 34 links, 9 loops — the live vocabulary |
| Validation pipeline | `pipeline/validate_registry.py`, `regression_test.py`, `run_all_checks.sh` | Invariants I1–I7 and 11 defect-injection fixtures |
| Generation and conversion | `pipeline/registry2cld.py`, `xlsx2rdf.py`, `log_change.py` | CLD generation and RDF export |
| Ontology stack | `pipeline/fbmc-cld.ttl`, `shapes.ttl`, `registry_latest.ttl` | Terminology, constraints, instances |
| IVIO scope document | `../04-business-model/ontology/IVIO-Step1-Domain-and-Scope.md` | Domain, scope, and competency questions |
| Build log | `pipeline/PROGRESS.md` | What is done and what remains |

## 6. Deliverables

1. **Extended concept registry** covering all six groups' concepts, not only FBMC and CLD.
2. **SysML v2 bridge** — the mapping and validation extending the graph to the product model, so DO → requirement → architecture links are machine-checkable.
3. **Semantic consistency report** (RQ1.6) — a running artefact stating whether all models currently describe the same system, with named discrepancies.
4. **Validation pipeline maintained and extended** — invariants and regression fixtures covering the new concept types.
5. **IVIO ontology** developed past the scope stage, with competency questions answerable against the graph.
6. **Domain-agnostic playbook** — the method generalised beyond FBMC/CLD, so the contribution is reusable outside this project.

## 7. Acceptance criteria (done = all true)

- **Validation is automated and reproducible.** `run_all_checks.sh` executes end to end and the result is a report, not a judgement call.
- **Injected defects are caught.** The regression fixtures pass — a broken chain, a dangling link, a wrong loop polarity all fail the build. A pipeline that never fails proves nothing.
- **Every concept used by any group resolves to a registry entry.** Concepts that do not are reported as gaps, with the owning group named.
- **The SysML bridge exists and validates** — this is the extension that turns RQ3.1 from "demonstrated between two domains" into "demonstrated across the method".
- The consistency report **names discrepancies plainly**, including ones that are inconvenient for another group's deliverable.
- The playbook is **written so a different project could apply it** to a different domain pair — otherwise C6's replication claim has no basis.

## 8. Interfaces & sequence

**Consumes:** concept definitions from every group. This group cannot invent domain content; it formalises what the others decide.

**Provides**
- To **Group 1 (Business Model)** — the registry ensuring business model and CLD describe one system.
- To **Group 2 (Product Regeneration)** — the SysML ↔ CLD mapping, reusable for other domain pairs.
- To **Group 3 (LCA & Financial)** — the RDF pipeline carrying LCA results back into the model.
- To **Group 4 (System Dynamics)** — the generated CLD and the variable vocabulary.
- To **Group 6 (Enabling Systems)** — a place to record enabling-system dependencies against registry concepts rather than free text.
- To the **Task-Force** — the RQ1.6 consistency verdict, which is an input to the RQ1 gate.

**Sequence note:** this group runs continuously rather than in phases. Every time another group lands a material change, the pipeline runs and the consistency report updates. The one time-boxed piece of work is the **SysML v2 bridge**, which should start as soon as Group 2 produces its first `requirement def` elements.

## 9. GitHub issues

No dedicated issues yet; this group's work currently appears inside [#28](https://github.com/TheNightFox-1/SustainableTogether/issues/28) (CLD reconciliation) and the infrastructure label. **Recommend opening two issues:** one for the SysML v2 bridge, one for the standing consistency report. Flag at the first Task-Force meeting.

---

*Template shared across all group briefs: Purpose · Problem · RQs · Scope · Starting assets · Deliverables · Acceptance · Interfaces · Issues.*
