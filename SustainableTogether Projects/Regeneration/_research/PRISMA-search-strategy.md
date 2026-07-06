# PRISMA Search Strategy — Regenerative PV (2026-07-05)

## Concept Blocks

**A — Regenerative framing** (expect this to be sparse, so lean on adjacents)
`"regenerative" OR "regenerative business model*" OR "regenerative econom*" OR "net-positive" OR "nature-positive" OR "restorative" OR "circular econom*" OR "sustainable business model*" OR "cradle-to-cradle" OR "doughnut econom*"`

**B — PV / solar**
`"photovoltaic*" OR "solar PV" OR "solar energy" OR "solar power" OR "solar farm*" OR "PV plant*" OR "PV system*" OR "agrivoltaic*" OR "agrophotovoltaic*"`

**C — Financial viability**
`"net present value" OR NPV OR "internal rate of return" OR IRR OR "leveli?ed cost of electricity" OR LCOE OR "financial viability" OR "economic feasibility" OR profitability OR "payback period" OR bankability`

**D — Subsidy independence**
`"subsidy-free" OR unsubsidi?ed OR "feed-in tariff*" OR incentive* OR "grid parity" OR merchant OR "power purchase agreement*" OR PPA`

**E — Lifecycle / temporal**
`"life cycle" OR lifecycle OR "project lifetime" OR "30-year" OR "techno-economic" OR "long-term"`

**F — Conditions / determinants**
`condition* OR determinant* OR driver* OR enabler* OR barrier* OR regulat* OR policy OR "market structure" OR "capital structure" OR WACC OR "cost of capital"`

**G — Risk-adjusted comparison**
`"risk-adjusted" OR "sensitivity analysis" OR "scenario analysis" OR baseline OR conventional OR benchmark* OR comparison`

**H — Systems methodology**
`"model-based systems engineering" OR MBSE OR SysML OR "system dynamics" OR "systems modelling" OR "multi-objective optimi?ation" OR co-optimi?ation OR "design science" OR "product architecture" OR "system architecture" OR "trade-off analysis"`

**I — Regenerative outcomes**
`"triple bottom line" OR ecological OR social OR socio-economic OR "sustainability performance" OR co-benefit*`

---

## Per-RQ Combinations

**RQ1 (viability):** `A AND B AND C AND D`
*Add `AND E` if the result set is too large.*

**RQ2 (conditions):** `A AND B AND F AND G AND C`
*The C block keeps it anchored to economic performance rather than generic comparison.*

**RQ3 (methodology):** `A AND H AND I`
*Keep B optional here, or swap it for `"engineered system*" OR "cyber-physical system*"` since RQ3 is method-general with PV as the case.*

---

## SLR Notes
- Because "regenerative" is thinly indexed, run block A alone first as a scoping search to calibrate how much you must rely on adjacent terms (circular / sustainable / net-positive) — document this decision in the PRISMA rationale.
- For RQ1, subsidy-free viability is an emerging topic, so consider a grey-literature arm (IRENA, IEA, developer techno-economic reports) and pre-register that inclusion.
- "merchant" in block D is the strongest single term for the no-subsidy case — verify it isn't pulling in unrelated "merchant" hits.
