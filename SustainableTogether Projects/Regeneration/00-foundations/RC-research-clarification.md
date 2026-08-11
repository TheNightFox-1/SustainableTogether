# Research Clarification — Regeneration in Solar PV

**Version:** 0.1 (2026-07-04)
**Owner:** INCOSE / GfSE Sustainability WG — Regeneration Task-Force
**Author:** Hamza + TheScientistClaw
**Status:** LOCKED (awaiting DS-I)

---

## 1. Topic of Interest

**Research topic:** Regenerative design in photovoltaic systems — can a PV business model be designed to simultaneously achieve financial viability (positive NPV/IRR), ecological restoration, and social value creation?

**Context:** The conventional solar PV industry (SolarX) operates on a product-sales model with linear material flows, externalised ecological costs, and limited community engagement. The transition to a regenerative model (SustainaSun) proposes Product-as-a-Service, circular material flows, community wealth retention, and integrated ecological management (agrivoltaics, biodiversity credits, etc.).

**Motivation:** 
- *Scientific:* Is regenerative design a viable design approach for engineered energy systems?
- *Practical:* Can SolarX → SustainaSun be financially self-sustaining?
- *Societal:* Can we move from "do no harm" to "actively regenerate"?

---

## 2. Research Questions

The three questions below are **locked**. How each one breaks down into sub-questions owned by the six working groups — and the roll-up rules that determine when a sub-set of answers actually answers the parent — is in [`../RQ-DECOMPOSITION.md`](../RQ-DECOMPOSITION.md). Abbreviations: [`../GLOSSARY.md`](../GLOSSARY.md).

### RQ1 — Viability (Gate Question)
> *To what extent can a regenerative PV business model achieve financial viability (positive NPV, acceptable IRR) over a 30-year project lifecycle without dependency on external subsidy?*

This is the gate question. If regeneration cannot stand on its own financially, the whole thesis collapses. It tests whether the regenerative revenue streams (low-carbon premium, community equity, biodiversity credits, circularity savings) cover the additional costs of regenerative design.

### RQ2 — Conditions (Comparison Question)
> *Under which structural, regulatory, and market conditions does a regenerative PV model outperform a conventional PV baseline in risk-adjusted economic performance?*

This is the conditions analysis. Not "always better" but "better when...". It identifies the sensitivity parameters that determine whether regeneration wins, matches, or underperforms extraction.

### RQ3 — Methodology (Methodological Contribution)
> *How can regenerative outcomes (ecological, social, economic) be co-optimised in engineered systems using an integrated methodology linking business model, product architecture, and dynamic system modelling?*

This is the methodological contribution. The 10-step Regenerative Design Approach is the "design support" being developed.

---

## 3. Success Criteria

| # | Criterion | Measure | Target |
|---|-----------|---------|--------|
| C1 | Financial viability | Positive NPV at 7% discount over 30yr | NPV > 0 (RQ1) |
| C2 | Acceptable return | IRR ≥ industry benchmark (8-12% for PV) | IRR ≥ 8% (RQ1) |
| C3 | Risk-adjusted comparison | Risk-adjusted IRR vs. SolarX baseline | Identify conditions (RQ2) |
| C4 | Ecological improvement | ≥ X% reduction in lifecycle GHG; measurable biodiversity gain | Per DO-1,2,3,5 |
| C5 | Social value | Community wealth retention ≥ Y%; energy access coverage | Per DO-6,7 |
| C6 | Methodological validity | 10-step approach replicated in ≥2 contexts | RQ3 |
| C7 | Dynamic proof | SD model shows compounding reinforcing loops over 30yr | RQ3 |
| C8 | MRV feasibility | Measurement protocol is field-testable | Per mrv-protocol |

---

## 4. Type of Research

| Dimension | Classification | Rationale |
|-----------|---------------|-----------|
| **By aim** | Prescriptive (support) + Descriptive (understanding) | Developing design support (the methodology) while understanding current state |
| **By object** | Product + Process | Product: the regenerative PV system; Process: the 10-step methodology |
| **By scope** | Applied | Solves a real problem in a real context (SolarX → SustainaSun) |
| **By DRM stages** | Full (RC → DS-I → PS → DS-II → Writing) | All stages relevant |

---

## 5. Areas of Relevance and Contribution

| Area | Contribution |
|------|-------------|
| **Scientific** | Evidence on whether regenerative design achieves financial viability in PV; conditions for success |
| **Practical** | Workable methodology for designing regenerative engineered systems |
| **Methodological** | Integrated approach linking BM, MBSE, SD, and LCA |
| **Societal** | Pathway from extraction to regeneration in energy systems |

---

## 6. Research Plan (High-Level)

| Phase | DRM Stage | Activities | Duration |
|-------|-----------|-----------|----------|
| 1 | RC (this doc) | Lock RQs, criteria, plan | Done ✓ |
| 2 | DS-I | Literature review (regenerative BM, LCA baselines, SD in SE), empirical study (existing SolarX/SustainaSun data) | 4-6 weeks |
| 3 | PS | Develop design support: business model (Group 1), SysML model (Group 2), LCA + MRV (Group 3), CLD and System Dynamics (Group 4), semantic bridge (Group 5), enabling-systems map (Group 6) — integrated via the desired-outcomes interface | 8-12 weeks |
| 4 | DS-II | Evaluate: financial model sensitivity, SD model validation, MRV protocol field-test, compare vs. SolarX baseline | 4-6 weeks |
| 5 | Writing | Structure, draft, refine thesis/paper | 4-6 weeks |

---

## 7. Existing Artefacts (DS-I Partial)

The following materials already exist and partially satisfy DS-I requirements:
- 144-solution taxonomy (00-foundations)
- Fischer (2024) regenerative dynamics ontology (01-theory)
- Strategic framework "From Extraction to Regeneration" (02-strategic)
- 10-step Regenerative Design Approach (03-methodology)
- Desired-outcomes interface with 8 PV outcomes (03-methodology)
- SustainaSun business model and financial model (04-business-model)
- MRV protocol draft (06-lca-and-financial)
- PV case study dossier (9 topics) (pv-case-study)
- OpenLCA PoC (motor system, not yet PV)

**Gap:** No System Dynamics model / CLD yet; no SysML v2 model for regeneration; no regenerative LCA (only motor PoC).

---

## 8. General Guidelines

- **Be systematic:** follow the 10-step methodology as the design support development process
- **Be transparent:** document all assumptions, especially financial assumptions
- **Be honest about conditions:** if regeneration doesn't win under current conditions, that's a valid finding
- **Maintain the desired-outcomes interface as the spine** connecting all artefacts
- **Engage stakeholders:** all six groups — see `../RQ-DECOMPOSITION.md` for who owns which sub-question
- **Iterate:** RC can be refined as evidence accumulates

---

## 9. References

- Blessing, L. & Chakrabarti, A. (2009). *Design Research Methodology*. Springer
- Fischer, J., Farny, S., Abson, D. J. et al. (2024). Mainstreaming regenerative dynamics for sustainability. *Nature Sustainability* 7, 964–972
- IEA-PVPS Task 12 (solar PV LCA baselines)
- SustainableTogether project documentation (00-foundations through 06-lca-and-financial)
