# Task Brief — Group 1, Business Model

**Group:** Group 1 — Business Model
**Part of:** INCOSE / GfSE Sustainability WG · Regeneration Task-Force · SustainableTogether
**Reads from:** the top-level [`README.md`](../README.md), the [RQ decomposition](../RQ-DECOMPOSITION.md), the [Desired-Outcomes Interface](../03-methodology/01-desired-outcomes-interface.md) (the spine), and the [Glossary](../GLOSSARY.md)
**Owns research questions:** RQ1.1 ★ (leads the viability gate) · RQ2.2 · RQ3.2 · success criteria C1–C3

---

## The chosen direction (decided)

**The business model is Photovoltaics-as-a-Service (PVaaS).** SustainaSun does not sell panels; it sells the *outcome* — clean energy (and the ecological/social value that comes with it) as an ongoing service, while retaining ownership of the physical assets.

This is a locked decision, and it settles a contradiction in the existing assets: the built financial model was ownership-based, while the CLD was leasing-based. Under PVaaS the **leasing/performance-economy structure is the target**, so the CLD now aligns with the direction and the ownership financial model becomes a *reference input*, not a competing design.

The group is free to **build on the existing SustainaSun BM v0.1 or design a new one** — whichever produces the stronger, more honest PVaaS model. What is not optional is that the final BM is a service model and that it clears the financial gate.

---

## 1. Purpose

Design the regenerative **PVaaS business model** for SustainaSun and prove, with a financial model, that it is **viable without subsidy dependency** — then identify the conditions under which it beats a conventional PV baseline.

## 2. The problem this group solves

Conventional PV is sold as a product: linear material flow, single revenue stream (electricity), and most lifetime value leaving the host community. The open question is commercial, not moral:

> Can a PV-as-a-Service business that *internalises* ecological and social value (soil, biodiversity, community wealth, circularity) still reach positive NPV and an acceptable return **on its own economics** — or does regeneration only work on subsidy?

If it cannot clear that gate, the whole regeneration thesis collapses (see top-level README, "The thesis"). This group answers that gate question first.

## 3. Research questions & success criteria owned

| Sub-RQ | Question | Answering artefact | Acceptance test | Criteria |
|---|---|---|---|---|
| **RQ1.1** ★ | What revenue and cost architecture does a regenerative PVaaS business have, and what NPV, IRR and payback does it produce over 30 years **with subsidies removed from the cash flows**? | Financial model recast for PVaaS: 30 yr, ≥ 3 scenarios, full capital structure | Every material assumption documented and sourced; the unsubsidised case is run explicitly, not derived by adjustment | C1, C2 |
| **RQ2.2** | Which parameters move the risk-adjusted outcome against a clearly defined conventional baseline, and by how much? | Sensitivity analysis + risk-adjusted comparison vs. the SolarX baseline | The baseline is defined explicitly; each financially expressible condition from Group 6 has a quantified sensitivity | C3 |
| **RQ3.2** | Can a business model be derived from DO-1…DO-8 and mapped into a CLD and a financial model **without loss of information**? | FBMC ↔ CLD ↔ financial-model trace, per desired outcome | Every DO reaches a canvas block and a financial line, or is explicitly recorded as non-bankable with a reason | C6 |

**RQ1.1 is the gate.** It is answered first, and it is answered with **only** the revenue lines Group 6 classifies as bankable today. Lines needing a future enabling system may appear in an upside scenario; they may never appear in the gate case. See the roll-up rule in [`../RQ-DECOMPOSITION.md`](../RQ-DECOMPOSITION.md#roll-up-rule-for-rq1).

RQ3.2 fills the **③ Feasibility column** of the DO × Use matrix.

## 4. Scope

**In scope**
- Design the SustainaSun PVaaS business model (build on v0.1 or new), organised around the 8 desired outcomes (DO-1…DO-8).
- Define the **revenue architecture**: every value line sorted by bankability (bankable today / optionality / cost).
- Build/recast the **financial model** for PVaaS: 30-year horizon, capital structure, ≥ 3 scenarios, all revenue lines → NPV, IRR, payback, sensitivity.
- Produce the **risk-adjusted comparison** against a clearly-defined conventional-PV baseline → the RQ2 conditions.

**Out of scope** (owned by other groups — do not do here)
- Formalising outcomes as SysML requirements and architecture → **Group 2, Product Regeneration**.
- The lifecycle environmental analysis → **Group 3, LCA & Financial**.
- Simulating the model's behaviour *over time* and its feedback loops → **Group 4, System Dynamics**.
- Validating semantic consistency between artefacts → **Group 5, Digital Engineering**.
- Assessing whether a revenue line is transactable in the real market → **Group 6, Enabling Systems**.
- Investment-grade due diligence, real field data (see top-level "Scope & boundaries").

## 5. Starting assets (do not redo — build on these)

| Asset | Location | Use |
|---|---|---|
| SustainaSun BM v0.1 (reference doc) | `business-model/SustainaSun-Regenerative-PV-Business-Model.md` | Baseline to adopt/extend or supersede |
| Built financial model (7 sheets, 3 scenarios, equity IRR ~8–10.5%, WACC 4.9–6.5%) | `business-model/SustainaSun_PV_Financial_Model.xlsx` | Ownership-based — reuse the structure, recast for PVaaS |
| Circular PV leasing BM write-up | `business-model/…Circular Photovoltaic Leasing Business Model.docx` | Directly relevant — PVaaS is a leasing/service structure |
| Leasing CLD v2 / v3 | `../07-digital-engineering/…CLD…` | The causal structure — hand to Group 4 (System Dynamics) |
| FBMC↔CLD concept registry + validation pipeline | `../07-digital-engineering/` | Formalise the business model in FBMC so it connects to the CLD |
| DO interface — feasibility column | `../03-methodology/01-desired-outcomes-interface.md` | The revenue mechanisms and their figures (below) |

## 6. The revenue architecture to confirm (starting point)

Organise the BM around the 8 outcomes, each value line sorted by bankability. Figures below come from the interface's feasibility column — confirm, correct, and complete them:

| Value line | Drives | Bankable now? | Rough magnitude |
|---|---|---|---|
| Energy-service fee (the PVaaS core) | base | Yes | market + service margin |
| Low-carbon premium | DO-5 GHG | **Yes** | 2–5 €/MWh |
| Community-equity WACC reduction | DO-6 wealth | **Yes / structural** | ~50–100 bps ≈ 3 €/MWh |
| Biodiversity credits | DO-2 | Optionality (~2028–30) | Scenario C only |
| End-of-life material recovery | DO-4 circularity | Long-dated, small | 8–12 k€/MW |
| Social tariff / grant | DO-7 access | Grant-dependent | 1–3% NPV |
| Soil carbon, water retention | DO-1, DO-3 | Non-bankable | permitting de-risk, lease-term lever |

**Suggested core thesis:** the business stands on **energy-service fee + low-carbon premium + community-equity WACC reduction** (all bankable today); everything else is optionality that strengthens the case but is not load-bearing. This is what makes RQ1 answerable without hand-waving.

## 7. Deliverables

1. **Confirmed regenerative PVaaS business model (v1.0)** — structured in the Flourishing Business Model Canvas (FBMC), organised by DO-1…DO-8. States explicitly whether it builds on v0.1 or replaces it.
2. **Revenue-architecture table** — populated with real figures: each line → which DO → bankability → magnitude → which scenario.
3. **Financial model, recast for PVaaS** — 30-year, ≥ 3 scenarios, capital structure, all revenue lines; outputs NPV, IRR, payback, and a sensitivity analysis.
4. **Risk-adjusted comparison vs. a defined conventional baseline** — the RQ2 "better when…" conditions, with the sensitivity parameters that decide them.

## 8. Acceptance criteria (done = all true)

- The business-model document and the financial model describe the **same PVaaS business** — no ownership/leasing contradiction remains.
- **RQ1.1 answered explicitly:** NPV > 0 **and** IRR ≥ 8% over 30 years **with subsidies removed from the cash flows**, and every material assumption documented.
- The gate case uses **only revenue lines Group 6 classifies as bankable today.** Speculative lines live in upside scenarios, never in the gate.
- **Triple Top Line preserved:** no capital is traded off against another — ecological and social value is additive, never funded by harm.
- **RQ2.2 delivered:** the sensitivity analysis names the conditions under which regenerative PVaaS wins, matches, or loses against a baseline that is defined explicitly.
- The **feasibility column** of the desired-outcomes interface is populated and consistent with the financial model (RQ3.2).
- Where an input from another group has not arrived, the model says so. **A gate answered on placeholder inputs is not an answer** — see the roll-up rule.

## 9. Interfaces & sequence

This group is the **front of the pipeline**:

```
Group 1 Business Model (viable?) ──▶ Group 3 LCA (environmentally sound?) ──▶ Group 4 System Dynamics (how does it behave over 30 yr?)
```

**Consumes**
- Numeric DO targets from [#26](https://github.com/TheNightFox-1/SustainableTogether/issues/26) — needed to price the ecological and social lines.
- From **Group 2 (Product Regeneration)** — the costed component list behind CAPEX and OPEX (RQ1.2).
- From **Group 3 (LCA & Financial)** — the verified lifecycle-GHG figure that validates the low-carbon premium, DO-5 (RQ1.3).
- From **Group 6 (Enabling Systems)** — the bankability classification per revenue line (RQ1.4). Without it the gate case cannot be assembled honestly.
- From **Group 4 (System Dynamics)** — flags on assumptions that are dynamically unstable (RQ1.5).

**Provides**
- To **Group 4 (System Dynamics)** — the confirmed business model and revenue architecture, unblocking CLD reconciliation ([#28](https://github.com/TheNightFox-1/SustainableTogether/issues/28)) and the SD model ([#29](https://github.com/TheNightFox-1/SustainableTogether/issues/29)).
- To **Group 2 (Product Regeneration)** — a priority signal: which desired outcomes are bankable, and therefore which requirements matter most.
- To **Group 6 (Enabling Systems)** — the revenue and cost architecture that determines which enabling systems are worth studying.

## 10. GitHub issues

| Issue | Title | Note |
|---|---|---|
| [#27](https://github.com/TheNightFox-1/SustainableTogether/issues/27) | Confirm revenue architecture of the regenerative-dynamics BM | **Start here** — now scoped to PVaaS |
| [#30](https://github.com/TheNightFox-1/SustainableTogether/issues/30) | Risk-adjusted comparison vs. conventional baseline (RQ1/RQ2) | Deliverable 4 |
| [#28](https://github.com/TheNightFox-1/SustainableTogether/issues/28) | Reconcile the CLD with the confirmed BM | Shared with SD group — BM provides the model, SD owns the CLD |

**Blocked-by:** pricing the ecological/social revenue lines depends on the numeric DO targets in [#26](https://github.com/TheNightFox-1/SustainableTogether/issues/26) — so #26 should be resolved at the first Task-Force meeting.

---

*Template shared across all group briefs: Purpose · Problem · RQs · Scope · Starting assets · Deliverables · Acceptance · Interfaces · Issues.*
