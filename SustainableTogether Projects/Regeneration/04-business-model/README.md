# Group 1 — Business Model + System Dynamics

**Group mandate:** Demonstrate that regenerative design is commercially viable and model the feedback dynamics that determine under what conditions it outperforms extraction.

---

## Two workstreams

### `business-model/` — Static reference architecture
Starting point: `SustainaSun-Regenerative-PV-Business-Model.md` (v0.1)

This document specifies the BM structure, revenue streams, cost structure, capital architecture, and viability conditions for a regenerative PV project. It is parametric and honest about the conditions under which the model works and when it breaks.

Current status: Complete as a reference document. Needs to be adopted by the Task-Force (not treated as Hamza's solo work), validated by the group, and extended where gaps exist.

Key decision: The financial model (Excel) is specified in Output 3 of the BM document. It needs to be verified as actually built.

### `system-dynamics/` — Dynamic model
The SD model's job: simulate how the BM's variables interact over time. The BM gives you parameter ranges; the SD model shows how those parameters move and interact dynamically across the 30-year lifecycle.

**Done:** A Causal Loop Diagram (CLD) exists (`SustainSun CLD v2.docx`, `SustainaSun_CLD_v3_leasing.drawio`), along with an FBMC⇄CLD semantic alignment method (ontology, playbook, concept registry) and a validation `pipeline/` that checks the CLD against the registry. Not yet done: parameterizing the CLD into an executable SD model.

The key loops the CLD needs to capture:

**Positive (reinforcing) loops:**
- Soil health → agricultural yield → agrivoltaic revenue → reinvestment in land management → soil health
- Community trust → reduced permitting time → project scale → community benefit → community trust
- Low-carbon module sourcing → supplier development investment → lower module carbon intensity → better EPD score → higher low-carbon premium
- Ecological monitoring quality → biodiversity credit credibility → credit price → monitoring investment

**Balancing loops:**
- Project scale → fixed compliance overhead per MW → minimum viable scale threshold (economies of scale)
- Biodiversity premium market formation → more regenerative projects → supply exceeds early demand → price compression

**Tool choice:** Vensim (standard in SD research), InsightMaker (free, browser-based), or Stella Architect. For MBSE integration, InsightMaker's model-sharing approach is simplest.

---

## Integration with Group 2

Group 1 produces the measurable KPIs that Group 2's SysML model must satisfy. The shared interface is a set of 8–10 requirements. The actual target values are not set yet — that is one of the first jobs for the group (see `GAPS-AND-RISKS.md` §3). The numbers below are illustrative placeholders to show the *shape* of the interface, not agreed targets:
- Soil organic carbon: stable or increasing over the measurement window
- Species richness: positive vs pre-installation baseline at Year 10 (target TBD)
- Community revenue retention: a defined minimum share of lifetime revenue (target TBD)
- Net lifecycle GHG: <15 gCO₂eq/kWh (this one is anchored — it comes from the BM, IEA-PVPS Task 12 baseline)

Group 1 owns the *target values and measurement protocols*. Group 2 owns the *system functions that produce those outcomes*.

---

## Integration with `06-lca-and-financial/`

The BM uses IEA PVPS Task 12 baseline LCA data. The Task-Force needs a regenerative-scenario LCA — how does agrivoltaic + biodiversity management + regenerative land stewardship change the lifecycle impacts vs conventional ground-mount PV?

This LCA work feeds back into the financial model (validated GHG performance → low-carbon premium eligibility → revenue) and into Group 2's model (lifecycle capital flows → SysML behavior specs).
