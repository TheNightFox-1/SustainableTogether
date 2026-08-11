# Task Brief — Group 3, LCA & Financial Integration

**Group:** Group 3 — LCA & Financial Integration
**Part of:** INCOSE / GfSE Sustainability WG · Regeneration Task-Force · SustainableTogether
**Reads from:** the top-level [`README.md`](../README.md), the [RQ decomposition](../RQ-DECOMPOSITION.md), the [Desired-Outcomes Interface](../03-methodology/01-desired-outcomes-interface.md), and the [Glossary](../GLOSSARY.md)
**Owns research questions:** RQ1.3 · RQ2.4 · RQ3.5 · success criteria C4, C8

---

## 1. Purpose

Quantify the environmental performance of the regenerative system with a Life Cycle Assessment (LCA), feed the verified result back into the financial model, and define the Monitoring, Reporting and Verification (MRV) protocol that stops every other claimed outcome from being an assertion.

This group is where "regeneration is more profitable than extraction" stops being an argument and becomes a number.

## 2. The problem this group solves

The business case prices a **low-carbon premium** at 2–5 €/MWh. That premium only exists if the lifecycle emissions figure is real, verified, and low enough to qualify — which requires an LCA that does not yet exist. The current baseline uses IEA-PVPS Task 12 figures for conventional crystalline-silicon modules at EU average. A regenerative scenario changes module sourcing, construction, operation, and end-of-life recovery, and nobody has quantified the delta.

Worse, seven of the eight desired outcomes have **no independent measurement path at all** yet. Soil carbon, biodiversity and community wealth are claimed in the model and priced in the spreadsheet, but nothing verifies them.

> **Can a regenerative outcome be measured independently of the people claiming it, and does the measurement survive contact with a real site?**

If the answer is no, the thesis rests on self-reported outcomes, which is exactly the failure mode the regenerative-finance critiques in `00-foundations/` warn about.

## 3. Research questions & success criteria owned

| Sub-RQ | Question | Answering artefact | Acceptance test | Criteria |
|---|---|---|---|---|
| **RQ1.3** | What is the verified lifecycle greenhouse-gas (GHG) intensity of the regenerative system, and does it clear the threshold that makes the low-carbon premium claimable? | Verified gCO₂eq/kWh figure with its Environmental Product Declaration (EPD) and methodological basis | Figure is EPD-backed and IEA-PVPS Task 12-conformant, full Balance of System; the DO-5 threshold (< 15 gCO₂eq/kWh) is either met or explicitly missed | C4 → C1 |
| **RQ2.4** | How does the environmental delta versus the conventional baseline change under different supply-chain and end-of-life conditions? | Conditional LCA results per scenario | Module sourcing and end-of-life recovery are quantified as separate conditions, not bundled | C4 |
| **RQ3.5** | Can a desired outcome be quantified **independently** of the business model and fed back into it, closing the loop? | LCA → verified figure → financial model → recalculated IRR; plus a field-testable MRV protocol | The loop closes end-to-end at least once (DO-5 is the demonstrator); the MRV protocol survives a feasibility check | C8 |

RQ3.5 fills the **④ Measurement column** of the DO × Use matrix in [`../RQ-DECOMPOSITION.md`](../RQ-DECOMPOSITION.md#the-do--use-matrix--the-evidence-for-rq3).

## 4. Scope

**In scope**
- Define the **LCA system boundary** for the regenerative PV system: where the analysis starts and ends (grid connection? land? community energy access?).
- Assemble the **LCA dataset** — openLCA entries and EPDs for low-carbon modules and Balance-of-System components.
- Run the **regenerative-scenario delta analysis** against the SolarX conventional baseline across the lifecycle stages.
- Extend the **openLCA connection pipeline** from the motor proof-of-concept to the PV system, so results flow back into the model rather than being pasted in.
- Complete the **MRV protocol**: baseline → repeat measurement → attribution, verification tiers, and the reconciliation between ecological measurement and financial reporting.
- **Verify the financial model** against the business-model specification — confirm what is actually built and that key formulas match the spec.

**Out of scope** (owned by other groups — do not do here)
- Designing the business model or setting prices → **Group 1, Business Model**.
- Defining the system architecture or material composition → **Group 2, Product Regeneration**.
- Simulating behaviour over time → **Group 4, System Dynamics**.
- Building the semantic bridge itself → **Group 5, Digital Engineering** (this group *uses* it).
- Multi-year primary field measurement — this cycle delivers a **protocol and a field-test plan**, not longitudinal soil or biodiversity data (see the top-level scope table).
- Issuing or certifying credits — the effect on the business case is modelled; nothing is transacted or certified.

## 5. Starting assets (do not redo — build on these)

| Asset | Location | Use |
|---|---|---|
| MRV protocol draft | `mrv-protocol.md` | Baseline → repeat → attribution logic, verification tiers. Complete it; don't restart |
| openLCA integration proof-of-concept (motor system) | `../../System Model/SolarX/LCA Analysis SolarX/SimpleLCAIntegration/` | The four-layer pipeline pattern to extend to PV. Confirm its exact scope before building on it |
| Financial model (7 sheets, 3 scenarios) | `../04-business-model/business-model/SustainaSun_PV_Financial_Model.xlsx` | The model whose GHG performance line this group validates |
| IEA-PVPS Task 12 methodology and baselines | Public domain | The conformance standard for the emissions figure |
| Desired-Outcomes Interface — measurement column | `../03-methodology/01-desired-outcomes-interface.md` | The MRV method proposed per outcome |
| Survey instruments (repurposed) | `../_research/` | Basis for the social-outcome measurement instruments |

## 6. Deliverables

1. **LCA scope definition** — the system boundary, functional unit, and impact categories, with the exclusions stated and justified.
2. **Regenerative-scenario LCA** — the verified gCO₂eq/kWh figure with its EPD and methodological basis. This is the RQ1.3 answer.
3. **Delta analysis vs. the SolarX baseline** — stage by stage, so it is visible *where* the improvement comes from.
4. **Conditional LCA results** — how the delta changes under different module sourcing and end-of-life recovery conditions (RQ2.4).
5. **Extended openLCA pipeline** — SysML → RDF → LCA → financial model, running end to end for the PV system.
6. **Completed MRV protocol** — field-testable, with verification tiers and a named external standard per outcome.
7. **Financial-model verification note** — what is built, what is spec, which formulas were checked.

## 7. Acceptance criteria (done = all true)

- The emissions figure is **EPD-backed and Task 12-conformant**, covering the full Balance of System — not a modelled estimate presented as verified.
- The DO-5 threshold is **explicitly met or explicitly missed**. A missed threshold is reported plainly; it invalidates a revenue line, and Group 1 needs to know immediately.
- The **loop closes end to end at least once**: a change in the model produces a changed LCA result that produces a changed IRR, without manual re-entry.
- The **MRV protocol is field-testable** — a named person at a named site could execute it. Every outcome has a baseline requirement and an attribution method.
- Every measurement method names its **external verification standard** (EPD, TNFD, SBTN, EOV, ICVCM as applicable). Self-reported outcomes are marked as such.
- Where an outcome **cannot** be independently measured at acceptable cost, that is stated rather than papered over.

## 8. Interfaces & sequence

**Consumes**
- From **Group 2 (Product Regeneration)** — material definitions, lifecycle stages, system functions. The LCA cannot start without a defined system.
- From **Group 1 (Business Model)** — the revenue lines whose environmental claims need validating.
- From **Group 5 (Digital Engineering)** — the RDF bridge carrying results between SysML and openLCA.

**Provides**
- To **Group 1 (Business Model)** — the verified emissions figure that validates or kills the low-carbon premium (RQ1.3). This is a gate input: Group 1 cannot price DO-5 without it.
- To **Group 4 (System Dynamics)** — environmental parameters for the environmental-perspective model.
- To **Group 6 (Enabling Systems)** — which certification and verification infrastructure the claims actually depend on.
- To **all groups** — the MRV protocol, which is the evidence standard behind every outcome claim in the project.

**Sequence note:** this group sits mid-pipeline — Business Model → LCA → System Dynamics. But the **financial-model verification** and the **MRV protocol** are not blocked by anything and can start immediately.

## 9. GitHub issues

| Issue | Title | Note |
|---|---|---|
| [#34](https://github.com/TheNightFox-1/SustainableTogether/issues/34) | Regenerative-scenario LCA | Deliverables 1–4 |
| [#35](https://github.com/TheNightFox-1/SustainableTogether/issues/35) | MRV protocol | Deliverable 6 — **not blocked, start now** |

**Blocked-by:** the LCA needs Group 2's material definitions and lifecycle stages. MRV thresholds need the numeric DO targets from [#26](https://github.com/TheNightFox-1/SustainableTogether/issues/26), but the protocol *structure* is not blocked.

---

*Template shared across all group briefs: Purpose · Problem · RQs · Scope · Starting assets · Deliverables · Acceptance · Interfaces · Issues.*
