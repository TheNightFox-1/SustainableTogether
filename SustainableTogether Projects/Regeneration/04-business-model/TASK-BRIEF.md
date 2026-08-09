# Task Brief — Business Model Group

**Group:** Business Model (BM)
**Part of:** INCOSE / GfSE Sustainability WG · Regeneration Task-Force · SustainableTogether
**Reads from:** the top-level [`README.md`](../README.md) and the [Desired-Outcomes Interface](../03-methodology/01-desired-outcomes-interface.md) (the spine)
**Owns research questions:** RQ1 (viability — the gate) · RQ2 (conditions) · success criteria C1–C3

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

| RQ / criterion | What this group must show |
|---|---|
| **RQ1 — Viability (gate)** | NPV > 0 and IRR ≥ 8% over 30 years, **without subsidy dependency** (C1, C2) |
| **RQ2 — Conditions** | The structural / regulatory / market conditions under which regenerative PVaaS out-performs conventional PV, risk-adjusted — "better when…", not "always better" (C3) |

## 4. Scope

**In scope**
- Design the SustainaSun PVaaS business model (build on v0.1 or new), organised around the 8 desired outcomes (DO-1…DO-8).
- Define the **revenue architecture**: every value line sorted by bankability (bankable today / optionality / cost).
- Build/recast the **financial model** for PVaaS: 30-year horizon, capital structure, ≥ 3 scenarios, all revenue lines → NPV, IRR, payback, sensitivity.
- Produce the **risk-adjusted comparison** against a clearly-defined conventional-PV baseline → the RQ2 conditions.

**Out of scope** (owned by other groups — do not do here)
- Simulating the model's behaviour *over time* / feedback loops → **System Dynamics group**.
- The lifecycle environmental analysis → **LCA group**.
- Formalising outcomes as SysML requirements/architecture → **Product / MBSE group**.
- Investment-grade due diligence, real field data (see top-level "Scope & boundaries").

## 5. Starting assets (do not redo — build on these)

| Asset | Location | Use |
|---|---|---|
| SustainaSun BM v0.1 (reference doc) | `business-model/SustainaSun-Regenerative-PV-Business-Model.md` | Baseline to adopt/extend or supersede |
| Built financial model (7 sheets, 3 scenarios, equity IRR ~8–10.5%, WACC 4.9–6.5%) | `business-model/SustainaSun_PV_Financial_Model.xlsx` | Ownership-based — reuse the structure, recast for PVaaS |
| Circular PV leasing BM write-up | `business-model/…Circular Photovoltaic Leasing Business Model.docx` | Directly relevant — PVaaS is a leasing/service structure |
| Leasing CLD v2 / v3 | `system-dynamics/…CLD…` | The causal structure — hand to the SD group |
| FBMC↔CLD concept registry + validation pipeline | `system-dynamics/` | Formalise the BM in FBMC so it connects to SD |
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

- The BM document and the financial model describe the **same PVaaS business** — no ownership/leasing contradiction remains.
- **RQ1 gate answered explicitly:** NPV > 0 **and** IRR ≥ 8% over 30 years **with subsidies removed from the cash flows**, and every material assumption is documented.
- **Triple Top Line preserved:** no capital is traded off against another — ecological/social value is additive, never funded by harm.
- **RQ2 delivered:** the sensitivity analysis names the conditions under which regenerative PVaaS wins, matches, or loses vs. the baseline.
- The **feasibility column** of the desired-outcomes interface is populated and consistent with the financial model.

## 9. Interfaces & sequence

This group is the **front of the pipeline**:

```
Business Model (viable?) ──▶ LCA (environmentally sustainable?) ──▶ System Dynamics (how does it behave over 30 yr?)
```

- **Consumes:** the numeric DO targets from [#26] (needed to price ecological/social lines); the LCA group's verified lifecycle-GHG figure (feeds the low-carbon premium, DO-5).
- **Provides:** the confirmed BM + revenue architecture to the **System Dynamics group** — this unblocks CLD reconciliation ([#28]) and the SD model ([#29]); and a priority signal to the **Product/MBSE group** (which DOs are bankable → which requirements matter most).

## 10. GitHub issues

| Issue | Title | Note |
|---|---|---|
| [#27](https://github.com/TheNightFox-1/SustainableTogether/issues/27) | Confirm revenue architecture of the regenerative-dynamics BM | **Start here** — now scoped to PVaaS |
| [#30](https://github.com/TheNightFox-1/SustainableTogether/issues/30) | Risk-adjusted comparison vs. conventional baseline (RQ1/RQ2) | Deliverable 4 |
| [#28](https://github.com/TheNightFox-1/SustainableTogether/issues/28) | Reconcile the CLD with the confirmed BM | Shared with SD group — BM provides the model, SD owns the CLD |

**Blocked-by:** pricing the ecological/social revenue lines depends on the numeric DO targets in [#26](https://github.com/TheNightFox-1/SustainableTogether/issues/26) — so #26 should be resolved at the first Task-Force meeting.

---

*Template shared across all group briefs: Purpose · Problem · RQs · Scope · Starting assets · Deliverables · Acceptance · Interfaces · Issues.*
