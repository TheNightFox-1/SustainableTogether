# Task Brief — Group 4, System Dynamics

**Group:** Group 4 — System Dynamics
**Part of:** INCOSE / GfSE Sustainability WG · Regeneration Task-Force · SustainableTogether
**Reads from:** the top-level [`README.md`](../README.md), the [RQ decomposition](../RQ-DECOMPOSITION.md), the [Desired-Outcomes Interface](../03-methodology/01-desired-outcomes-interface.md), and the [Glossary](../GLOSSARY.md)
**Owns research questions:** RQ1.5 · RQ2.3 · RQ3.4 · success criterion C7

---

## 1. Purpose

Model how the Photovoltaics-as-a-Service (PVaaS) business behaves **over time** — as a living system where economic, social, and environmental factors reinforce or undermine each other — and prove or disprove that the regenerative loops actually compound over 30 years.

## 2. The problem this group solves

Regeneration is defined in this project as an **upward helix**: an outcome that rises repeatedly and is partly self-perpetuating. That is a claim about *behaviour over time*. A financial model is an accounting snapshot projected forward; it cannot test the claim, because it assumes its own parameters stay put.

Two failure modes hide in that gap:

- A business case that looks strong in year 1 and is **eroded by feedback** the spreadsheet never represents.
- **Rebound effects** — where an efficiency gain increases consumption, or a revenue success attracts competition that erases the margin — which no static model will surface.

> **Do the reinforcing loops compound over 30 years, or does the structure of the system quietly cancel them?**

If they do not compound, the upward-helix claim is unsupported and success criterion **C7 fails** — regardless of what the financial model says.

## 3. Research questions & success criteria owned

| Sub-RQ | Question | Answering artefact | Acceptance test | Criteria |
|---|---|---|---|---|
| **RQ1.5** | Do the revenue and cost assumptions survive 30 years of feedback, or does the system structure erode them? | Dynamic-stability assessment of the financial model's assumptions | Each load-bearing assumption is confirmed stable, or flagged with the specific loop that undermines it | C7 → C1 |
| **RQ2.3** | Which feedback structures create or destroy the advantage over 30 years, and where are the leverage points? | Loop catalogue (reinforcing / balancing, positive / negative impact) + leverage-point analysis | Each loop traces to variables present in the business model; rebound effects are searched for explicitly, not assumed absent | C3, C7 |
| **RQ3.4** | Can DO-1…DO-8 be modelled dynamically across economic, social and environmental perspectives and integrated into one model that shows **compounding**? | Three perspective CLDs, one integrated CLD, behaviour-over-time sketches | Cross-perspective links are explicit; at least one reinforcing loop is shown to compound over 30 years | **C7** |

RQ3.4 fills the **① Dynamics column** of the DO × Use matrix in [`../RQ-DECOMPOSITION.md`](../RQ-DECOMPOSITION.md#the-do--use-matrix--the-evidence-for-rq3).

## 4. Scope

**In scope**

The method is **separate → integrate → analyse**:

1. **Three perspective models** — build a Causal Loop Diagram (CLD) per perspective, each with its own variables, causal links, and feedback structures:
   - *Economic* — revenues, costs, investment, returns, market dynamics
   - *Social* — community wealth, trust, employment, energy access, governance
   - *Environmental* — soil carbon, biodiversity, water, lifecycle emissions, material flows
2. **Integration** — map the cross-perspective links. Where does an economic decision ripple into a social or environmental outcome, and where does an ecological change feed back into economics?
3. **Analysis** — catalogue every loop and classify it:
   - Reinforcing loops with **positive** impact (the upward helix)
   - Reinforcing loops with **negative** impact (rebound effects, lock-in, perverse incentives)
   - Balancing loops (limits to growth, natural ceilings, compliance overhead)
   - Critical **leverage points**
   - Sensitivity: which parameters drive behaviour most?

**Out of scope** (owned by other groups — do not do here)
- Designing the business model or building the financial model → **Group 1, Business Model**.
- Semantic correctness of the concept registry and CLD generation → **Group 5, Digital Engineering** (this group consumes its output and focuses on *behaviour*, not formal alignment).
- Lifecycle environmental quantification → **Group 3, LCA & Financial**.
- Formalising outcomes in SysML → **Group 2, Product Regeneration**.
- Mapping external policy and market conditions → **Group 6, Enabling Systems** (this group models what happens *given* those conditions).

## 5. Starting assets (do not redo — build on these)

| Asset | Location | Use |
|---|---|---|
| CLD v2 (ownership-based) | `../07-digital-engineering/2026-07-02 SustainSun CLD v2.docx` | Earlier causal structure; superseded by v3 but useful for contrast |
| CLD v3 (leasing) | `../07-digital-engineering/SustainaSun_CLD_v3_leasing.drawio` | The structure aligned with the PVaaS direction — the starting point |
| Concept registry (21 generic + 21 PV instance, 34 links, 9 loops) | `../07-digital-engineering/SustainaSun_Concept_Registry.xlsx` | The formal variable and link definitions. Extend it rather than inventing parallel names |
| FBMC↔CLD alignment ontology and pipeline | `../07-digital-engineering/` | Keeps the CLD and business model describing the same system |
| Desired-Outcomes Interface — dynamics column | `../03-methodology/01-desired-outcomes-interface.md` | The stock and dominant loop proposed per outcome |
| Financial model | `../04-business-model/business-model/SustainaSun_PV_Financial_Model.xlsx` | The assumptions whose dynamic stability RQ1.5 tests |

## 6. Deliverables

1. **Three perspective CLDs** — economic, social, environmental.
2. **Integrated CLD** with cross-perspective links explicitly mapped.
3. **Loop analysis report** — every feedback loop catalogued and classified by polarity and impact, including rebound effects.
4. **Leverage-point analysis** — where intervention has the highest systemic effect.
5. **Behaviour-over-time sketches** — for baseline, optimistic, and stress scenarios.
6. **Dynamic-stability assessment** — the RQ1.5 verdict on each load-bearing financial assumption, written for Group 1 to act on.

## 7. Acceptance criteria (done = all true)

- **At least one reinforcing loop is shown to compound over the 30-year horizon** — this is success criterion C7 and the evidential core of the upward-helix claim. If none compounds, that result is reported plainly; a negative C7 is a finding, not a failure to deliver.
- **Rebound effects were searched for explicitly.** The report names where they were looked for and what was found, including "none identified in this structure". Absence must be demonstrated, not assumed.
- Every variable in the CLDs resolves to a **concept registry entry** — no parallel vocabulary. Where a new variable is needed, it is added to the registry.
- The CLD and the business model describe the **same system** — verified through Group 5's pipeline, not by eye.
- Each of DO-1…DO-8 appears as a **stock or a driver of one**, or is explicitly recorded as not dynamically modelled with a reason.
- The dynamic-stability assessment names **the specific loop** behind each flagged assumption, so Group 1 can act on it.

## 8. Interfaces & sequence

**Consumes**
- From **Group 1 (Business Model)** — the confirmed PVaaS business model, revenue architecture, cost structure, and financial-model parameters. **This is the primary blocker**: the CLD cannot be reconciled with a business model that has not been confirmed.
- From **Group 3 (LCA & Financial)** — environmental parameters for the environmental perspective.
- From **Group 5 (Digital Engineering)** — the concept registry and generated CLD.
- From **Group 6 (Enabling Systems)** — which external conditions to treat as exogenous inputs versus modelled variables.
- Numeric DO targets from [#26](https://github.com/TheNightFox-1/SustainableTogether/issues/26) — needed to parameterise, not to build structure.

**Provides**
- To **Group 1 (Business Model)** — which assumptions are dynamically unstable (RQ1.5), and which loops tip the risk-adjusted comparison (RQ2.3).
- To **Group 2 (Product Regeneration)** — which system-level feedbacks need designing into the architecture.
- To **Group 3 (LCA & Financial)** — which dynamic scenarios need environmental quantification.
- To **Group 6 (Enabling Systems)** — which enabling systems sit on reinforcing loops and therefore compound.

**Sequence note:** the System Dynamics model is the **highest-priority missing artefact** in the whole Task-Force. Structural work (perspective CLDs, loop identification) can start before the numeric targets land; only parameterisation is blocked.

## 9. GitHub issues

| Issue | Title | Note |
|---|---|---|
| [#28](https://github.com/TheNightFox-1/SustainableTogether/issues/28) | Reconcile the CLD with the confirmed business model | Shared with Group 1 — Group 1 provides the model, this group owns the CLD |
| [#29](https://github.com/TheNightFox-1/SustainableTogether/issues/29) | Parameterize the System Dynamics model | **The core deliverable** — highest-priority missing artefact |

**Blocked-by:** [#28](https://github.com/TheNightFox-1/SustainableTogether/issues/28) depends on Group 1 confirming the revenue architecture ([#27](https://github.com/TheNightFox-1/SustainableTogether/issues/27)); parameterisation depends on the numeric DO targets ([#26](https://github.com/TheNightFox-1/SustainableTogether/issues/26)).

---

*Template shared across all group briefs: Purpose · Problem · RQs · Scope · Starting assets · Deliverables · Acceptance · Interfaces · Issues.*
