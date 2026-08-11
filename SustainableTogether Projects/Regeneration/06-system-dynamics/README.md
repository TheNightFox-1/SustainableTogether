# Group 4 — System Dynamics

**Owns research questions:** RQ1.5 (dynamic stability of the financial assumptions) · RQ2.3 (which feedback structures create or destroy the advantage) · RQ3.4 (the compounding proof, success criterion C7)
**Task brief:** [`TASK-BRIEF.md`](./TASK-BRIEF.md) · **Decomposition:** [`../RQ-DECOMPOSITION.md`](../RQ-DECOMPOSITION.md) · **Abbreviations:** [`../GLOSSARY.md`](../GLOSSARY.md)

> **New mandate (2026-08-09):** Analyze the dynamics of the Photovoltaics-as-a-Service (PVaaS) business model across economic, social, and environmental perspectives. Uncover interdependencies, negative reinforcing loops (rebound effects), and positive reinforcing loops.
>
> *Renumbered 2026-08-11: this group was briefly labelled "Group 2", which collided with Product Regeneration. It is **Group 4**.*

---

## Goal

The System Dynamics group studies **how the business model behaves over time** — not as a single static snapshot, but as a living system where economic, social, and environmental factors interact, reinforce, or undermine each other.

**The method: separate → integrate → analyze**

1. **Represent each perspective separately** — build a perspective-specific model of the key variables, causal relationships, and feedback structures for:
   - **Economic** (revenues, costs, investment, returns, market dynamics)
   - **Social** (community wealth, trust, employment, energy access, governance)
   - **Environmental** (soil carbon, biodiversity, water, lifecycle emissions, material flows)

2. **Integrate into a unified model** — map the interdependencies between perspectives. Where does an economic decision ripple into social or environmental outcomes? Where does an ecological change feed back into economics?

3. **Study the interdependencies** — identify:
   - **Reinforcing loops with negative impact** (rebound effects, lock-in dynamics, perverse incentives)
   - **Reinforcing loops with positive impact** (the "upward helix" — self-reinforcing regeneration)
   - **Balancing loops** (limits to growth, stabilizing forces)
   - **Critical leverage points** (where intervention has the highest systemic impact)

---

## Input from Group 1 (Business Model)

Group 1 provides:
- The confirmed PVaaS business model with revenue architecture and cost structure
- The financial model parameters (CAPEX, OPEX, cost of capital, scenarios)
- The desired-outcomes interface (DO-1…DO-8) with numeric targets (when set)

## Output to other groups

- **To Group 1 (Business Model):** which assumptions in the financial model are dynamically unstable or create hidden risks — this is the RQ1.5 answer
- **To Group 2 (Product Regeneration):** which system-level feedbacks need to be designed into the product architecture
- **To Group 3 (LCA & Financial):** which dynamic scenarios need environmental quantification
- **To Group 6 (Enabling Systems):** which enabling systems sit on reinforcing loops, and therefore compound

---

## Existing assets

| Asset | Location |
|---|---|
| CLD v2 (ownership) | `../07-digital-engineering/2026-07-02 SustainSun CLD v2.docx` |
| CLD v3 (leasing) | `../07-digital-engineering/SustainaSun_CLD_v3_leasing.drawio` |
| Concept registry (21 generic + 21 PV instance) | `../07-digital-engineering/SustainaSun_Concept_Registry.xlsx` |
| FBMC↔CLD alignment ontology | `../07-digital-engineering/FBMC-CLD-Alignment-Ontology.drawio` |

**Note:** The semantic integration pipeline lives in `07-digital-engineering/` (Group 5 — Digital Engineering) and provides the formal mapping infrastructure. This group uses its outputs (concept registry, CLD) as a starting point but focuses on **behavioral analysis**, not semantic correctness.

---

## Method

**Phase 1 — Three perspective models:**
- Economic SD model: financial flows, investment decisions, market dynamics, cost escalation
- Social SD model: community engagement, trust, participation, wealth distribution
- Environmental SD model: soil, biodiversity, emissions, water, material recovery

**Phase 2 — Integration:**
- Map cross-perspective variables (which economic variable maps to which social/environmental variable?)
- Merge into a unified CLD

**Phase 3 — Analysis:**
- Identify all reinforcing loops (positive and negative)
- Classify rebound effects (energy efficiency → consumption increase, etc.)
- Identify positive reinforcing loops (the "upward helix" from Fischer et al.)
- Find critical leverage points
- Sensitivity analysis: which parameters drive the system behavior the most?

---

## Deliverables

1. **Three perspective CLDs** (economic, social, environmental)
2. **Integrated CLD** with cross-perspective links mapped
3. **Loop analysis report** — catalog of all feedback loops, classified by polarity and impact
4. **Leverage point analysis** — where to intervene for maximum positive effect
5. **Behavior-over-time sketches** — for key scenarios (baseline, optimistic, stress)
