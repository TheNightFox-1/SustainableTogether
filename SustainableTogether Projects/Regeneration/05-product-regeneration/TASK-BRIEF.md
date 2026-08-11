# Task Brief — Group 2, Product Regeneration

**Group:** Group 2 — Product Regeneration
**Part of:** INCOSE / GfSE Sustainability WG · Regeneration Task-Force · SustainableTogether
**Reads from:** the top-level [`README.md`](../README.md), the [RQ decomposition](../RQ-DECOMPOSITION.md), the [Desired-Outcomes Interface](../03-methodology/01-desired-outcomes-interface.md) (the spine), and the [Glossary](../GLOSSARY.md)
**Owns research questions:** RQ1.2 · RQ2.5 · RQ3.3

---

## 1. Purpose

Define what it means for a product to be **regenerative in engineering terms**, and formalise it in SysML v2 — from requirements, through system architecture, to the ecological and social flows the conventional model does not represent at all.

The SolarX model already describes how a photovoltaic (PV) system converts sunlight into electricity. It says nothing about how the system regenerates soil, supports biodiversity, or builds community wealth. This group extends the model so that it does.

## 2. The problem this group solves

Regeneration is currently argued in prose and priced in spreadsheets. Neither is engineering. If a desired outcome such as "soil organic carbon stable or increasing" cannot be written as a requirement, allocated to a system element, and traced to a flow the system actually produces, then it is an aspiration, not a design.

> **Can the eight desired outcomes be expressed as formal, verifiable properties of an engineered system — or do they dissolve when you try to specify them?**

The group also supplies the physical reality behind the business case. Group 1's financial model needs a costed component list that traces to real architecture, not to an assumption in a cell.

## 3. Research questions & success criteria owned

| Sub-RQ | Question | Answering artefact | Acceptance test | Criteria |
|---|---|---|---|---|
| **RQ1.2** | What does the regenerative system physically consist of, and what does it cost to build, operate and decommission? | Costed component list derived from the architecture: CAPEX, OPEX, EOL cost inputs | Every cost input traces to a named element in the SysML model, not to a spreadsheet assumption | C1 |
| **RQ2.5** | Which architectural choices are condition-dependent, and what does the system look like when a condition fails? | Design-option analysis: which requirements and elements are contingent | Every contingent element names the enabling-system condition it depends on, cross-referenced to Group 6's RQ2.1 map | C3 |
| **RQ3.3** | Can DO-1…DO-8 be formalised as SysML v2 `requirement def` elements and traced through architecture to ports and flows? | DO → `requirement def` → `part def` → `port def` / flow traceability | The model validates in SysIDE; every DO has a requirement; every requirement has at least one satisfying architecture element | C6 |

RQ3.3 fills the **② Product column** of the DO × Use matrix in [`../RQ-DECOMPOSITION.md`](../RQ-DECOMPOSITION.md#the-do--use-matrix--the-evidence-for-rq3). That matrix is the evidence for RQ3, so this group's traceability work is a third of the methodological contribution, not a modelling exercise on the side.

## 4. Scope

**In scope**
- Define the ~5 **regenerative system functions** a regenerative PV system performs that SolarX does not.
- Write `requirement def` elements for DO-1…DO-8, with the numeric targets Group 1 and the Task-Force set (not invented here).
- Extend the SolarX architecture with the `part def`, `port def`, and flow definitions those requirements need: biological capital, water, end-of-life material recovery, social flows.
- Represent the **lifecycle states** (installation → operation → end-of-life) where system behaviour differs.
- Derive the costed component list that Group 1's financial model consumes.

**Out of scope** (owned by other groups — do not do here)
- Setting the numeric outcome targets → **Task-Force decision** ([#26](https://github.com/TheNightFox-1/SustainableTogether/issues/26)), informed by Group 1.
- Pricing, revenue architecture, financial modelling → **Group 1, Business Model**.
- Running the lifecycle assessment → **Group 3, LCA & Financial**.
- Simulating behaviour over time → **Group 4, System Dynamics**.
- Rebuilding the SolarX as-is model — it is complete. This group **extends** it.

## 5. Starting assets (do not redo — build on these)

| Asset | Location | Use |
|---|---|---|
| SolarX SysML v2 model (physical architecture complete) | `../../System Model/SolarX/Solar X System Model/SolarXModel.sysml` | The baseline to extend, never overwrite |
| SolarX model conventions and step status | `../../System Model/SolarX/Solar X System Model/CLAUDE.md` | The SysML v2 syntax rules already validated in SysIDE |
| Desired-Outcomes Interface | `../03-methodology/01-desired-outcomes-interface.md` | The eight outcomes and their proposed requirement names |
| 144-solution taxonomy + five-mechanisms catalogue | `../00-foundations/` | Candidate regenerative functions with maturity (TRL) ratings |
| openLCA integration proof-of-concept | `../../System Model/SolarX/LCA Analysis SolarX/SimpleLCAIntegration/` | The SysML → RDF → LCA pipeline this model must feed |

## 6. Deliverables

1. **Scope definition** — one page listing the ~5 regenerative system functions a regenerative PV system has that SolarX does not. Prevents scope creep and gives the other groups a concrete interface.
2. **Regenerative requirements set** — `requirement def` elements for DO-1…DO-8, each with a subject, a measurable attribute, and a constraint. Targets marked TBD until the Task-Force sets them, never invented.
3. **Extended SysML v2 model** — new `part def`, `port def`, and flow definitions for ecological, water, material-recovery and social flows, plus lifecycle-state representation.
4. **Traceability report** — the DO → requirement → architecture → flow chain for all eight outcomes: the ② Product column of the RQ3 matrix.
5. **Costed component list** — the CAPEX/OPEX/EOL inputs Group 1's financial model consumes, each traced to a model element.
6. **Design-option analysis** — which elements are contingent on which enabling-system conditions.

## 7. Acceptance criteria (done = all true)

- The extended model **validates in SysIDE** with no errors. Model output is raw SysML v2 textual notation only.
- **Every DO-1…DO-8 has a `requirement def`**, and every one of those has at least one satisfying architecture element. No orphan requirements.
- **No invented targets.** Every numeric value is either sourced (with the source named) or explicitly marked TBD.
- The costed component list **traces element by element** to the model — Group 1 can audit any figure back to a `part def`.
- The earlier SYSMOD steps are **extended, never overwritten** — the model file grows in order.
- Contingent design choices name their condition, so Group 6 can pick them up for RQ2.

## 8. Interfaces & sequence

**Consumes**
- Numeric DO targets from [#26](https://github.com/TheNightFox-1/SustainableTogether/issues/26) — blocks the requirement constraints, though the requirement *structure* can be built before they land.
- Group 1's bankability signal — which outcomes are load-bearing tells this group which requirements matter most.
- Group 6's enabling-system constraints — which supply-chain options actually exist.

**Provides**
- To **Group 1 (Business Model)** — the costed component list (RQ1.2).
- To **Group 3 (LCA & Financial)** — material definitions, lifecycle stages, and system functions the LCA pipeline needs.
- To **Group 4 (System Dynamics)** — the system functions that become variables in the environmental perspective model.
- To **Group 5 (Digital Engineering)** — the SysML side of the semantic bridge, so SysML ↔ CLD ↔ FBMC alignment can be validated.

**Sequence note:** the ~5 system functions (deliverable 1) are the unblocking artefact. Produce them before anything else — several groups are waiting on a concrete answer to "what does this system actually do that the conventional one doesn't?"

## 9. GitHub issues

| Issue | Title | Note |
|---|---|---|
| [#31](https://github.com/TheNightFox-1/SustainableTogether/issues/31) | Define the ~5 regenerative system functions | **Start here** — deliverable 1, unblocks other groups |
| [#32](https://github.com/TheNightFox-1/SustainableTogether/issues/32) | Extend the model with regenerative requirements and ecological flows | Deliverables 2–4 |

**Blocked-by:** the requirement *constraints* need the numeric DO targets from [#26](https://github.com/TheNightFox-1/SustainableTogether/issues/26). The requirement *structure* is not blocked — build it now with TBD attributes.

---

*Template shared across all group briefs: Purpose · Problem · RQs · Scope · Starting assets · Deliverables · Acceptance · Interfaces · Issues.*
