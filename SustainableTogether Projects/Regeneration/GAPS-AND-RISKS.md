# Gaps and Risks — Devil's Advocate

**Date:** 2026-07-01
**Purpose:** Honest assessment of what the current picture is missing. Read before the first Task-Force meeting.

---

## The picture as it stands

The existing material is rich in two areas: **theory** (definitions, ontology, taxonomy, academic papers, strategic framework) and **a specific PV case** (SustainaSun BM, regenerative PV methodology). What's almost entirely missing is the **connective tissue** — the engineering and governance that turns the theory into a working Task-Force output.

---

## 1. The Business Model is static. There is no System Dynamics model.

The SustainaSun BM is a well-specified parametric financial model. It gives ranges and scenarios. It does not model how the system behaves *over time* — how regenerative outcomes compound, how feedback loops between ecological health, community trust, and financial return actually play out across a 30-year project lifecycle.

SD was listed as Group 1's next step. There is currently:
- No Vensim, Stella, or InsightMaker model
- No causal loop diagram (CLD)
- No stock-and-flow specification

The key feedback loops that SD should model, and that no one has written down yet:
- **Soil health → agricultural yield → land-use premium → reinvestment in regeneration** (positive reinforcing)
- **Community trust → permitting speed → project scale → community benefit → community trust** (positive reinforcing)
- **Regulatory compliance cost → project overhead → minimum viable scale threshold** (this is a balancing loop — gets harder at small scale)
- **Low-carbon module premium → sourcing pressure → supplier development → lower module carbon intensity over time** (slow positive loop)
- **Biodiversity credit market formation → ecological monitoring investment → verification quality → credit price** (emerging, uncertain)

Without the CLD, Group 1 has no starting point. This is the highest-priority missing artifact.

---

## 2. "Regeneration in the product" is undefined.

Group 2's mandate is to integrate regeneration into the product. But:
- What product? SolarX/SustainaSun PV system? Or generic?
- What does "integrate regeneration" mean in SysML v2 terms?

Current SolarX MBSE model covers: PV array, inverter, battery, energy management controller, monitoring unit, grid connection, commissioning and maintenance interfaces. It models energy flow and physical architecture.

What's missing:
- **Regenerative system functions** — what does the system *do* to regenerate? (manage biodiversity under arrays, retain soil moisture, monitor soil carbon, distribute energy locally)
- **Regenerative requirements** — what are the measurable targets that a regenerative design must satisfy? Currently there are none.
- **Ecological flows in the SysML model** — the existing model has ports for energy and data. There is no representation of water flow, biological capital, or material cycles.
- **A link from Group 1's capitals model to Group 2's requirements** — who writes the requirement that says "soil organic carbon must be stable or increasing over 10 years"? It must come from Group 1's BM, but the connection doesn't exist.

Without a concrete scope definition for Group 2, the group will talk past Group 1 and produce a SysML model that doesn't connect to the financial or ecological model.

---

## 3. The two groups have no defined interface.

The README describes the integration point in principle. But there is no:
- Defined data exchange format between groups
- Agreed set of KPIs that both groups must satisfy (Group 1 produces them; Group 2 must satisfy them in the model)
- Decision about who owns the shared reference architecture
- Meeting cadence or milestone structure

Without this, the groups will develop in parallel and produce artifacts that don't interlock.

---

## 4. LCA is named but not connected to anything.

The methodology says: integrate with LCA. The SolarX model has an openLCA PoC. The BM mentions LCA for lifecycle GHG accounting.

But:
- The openLCA PoC (4-stage pipeline: SysML → TTL → OWL → SPARQL) covers only the motor component of SolarX, not the regenerative PV system
- There is no LCA dataset for a regenerative PV scenario (agrivoltaic + biodiversity + regenerative land management) in openLCA
- The BM uses IEA PVPS Task 12 baseline LCA, not a regenerative-specific LCA
- The methodology's Phase 3 calls for a "baseline LCA of conventional PV" before even beginning the regenerative design — this hasn't been done

Group `06-lca-and-financial` is currently an empty folder. This is fine at the start, but someone needs to own the LCA integration plan.

---

## 5. Monitoring, Reporting, Verification (MRV) — the weakest link everywhere.

The ontology built from Fischer et al. (2024) makes this explicit: regenerative dynamics are only partly self-perpetuating — they still need ongoing energy, labour and materials to be sustained. You cannot manage what you cannot measure.

The BM has 8 goals with metrics. The methodology mentions "citizen-science-grade MRV". The "From Extraction to Regeneration" doc lists EOV (Ecological Outcome Verification) and ICVCM-CCP as emerging frameworks.

But there is no MRV protocol, no measurement plan, no data collection architecture. For a Task-Force that wants to claim regenerative outcomes are measurable and auditable, this is a critical gap.

Specifically missing:
- Soil organic carbon measurement protocol (frequency, method, who does it)
- Biodiversity monitoring standard (TNFD-aligned, but how specifically?)
- Social wellbeing indicators and data source (community surveys? energy access records?)
- Financial-to-ecological KPI reconciliation (who checks that the model's IRR assumptions are consistent with the ecological outcomes being claimed?)

---

## 6. Indigenous knowledge — named but absent.

The methodology's CLAUDE.md says "Indigenous practices are first-class engineering knowledge, not appendix material." The definitions compendium has Robin Wall Kimmerer and Tyson Yunkaporta. The strategic framework cites them.

But there is no actual Indigenous knowledge content, no collaboration protocol, no consent framework. This is particularly important if the Task-Force wants to work in North Africa / MENA (Morocco context from the strategic framework) where Traditional Ecological Knowledge (TEK) in oasis agriculture and transhumance is genuinely relevant and genuinely at risk of appropriation.

---

## 7. The PhD research track is undefined in relation to the Task-Force.

The `02-strategic-framework/From xtraction To Reeneration.md` is a substantial document that is clearly also doctoral research material. The `_review/phd_proposal.docx` and `_review/Doctoral Research Brief.docx` confirm this.

The risk: if the PhD and the WG work are entangled without clear lines, the WG outputs may be constrained by what serves the PhD (or vice versa). Two specific failure modes:
1. Task-Force outputs shaped by academic publication requirements rather than WG utility
2. WG members feeling they're contributing to Hamza's personal research without knowing it

This doesn't need to be a problem — action research in a WG is legitimate and powerful. But it needs to be declared and agreed by the WG.

---

## 8. The Task-Force has no governance structure.

Who are the members? What are their roles? Who decides? How are group outputs reviewed before they become Task-Force outputs?

Currently there is no:
- Member list with roles
- Meeting structure (cadence, format)
- Output ownership model
- Review and approval process
- Conflict resolution mechanism

The SustainableTogether repo has contribution guidelines and issue templates, but nothing specific to the Regeneration Task-Force governance.

---

## 9. The Fischer et al. (2024) ontology is not integrated into the design work.

The ontology HTML is a beautiful artifact. But it's currently just a viewer — it's not connected to:
- The definitions compendium (which doesn't use the Fischer terminology)
- The BM (which doesn't distinguish "regeneration" from "restoration" in Fischer's sense)
- The methodology (which doesn't name "regenerative momentum" or "degenerative dynamics" as design concepts)
- The SysML model (which has no formal representation of regenerative dynamics)

The Fischer framework should be the conceptual backbone across all layers. Right now it's a PDF and an HTML file sitting in a folder.

---

## 10. "Make regeneration more profitable than extraction" — the thesis is asserted, not proven.

This is Hamza's core claim and the Task-Force's reason for existing. The BM shows that under specific conditions, a regenerative PV project can reach equity IRR parity with a conventional one (8% in the base case, 10%+ in the optimistic case).

IRR *parity* is not *superiority*. The thesis requires demonstrating that regeneration *outperforms* extraction on a risk-adjusted basis over a relevant time horizon.

The "From Extraction to Regeneration" doc makes the case with seven evidence tracks (Interface, Patagonia, Bullitt Center, Danone supply chain, etc.) but these are case studies from different sectors and time periods, not a controlled comparison. For a WG that wants to be scientifically credible, the profitability case needs:
- A defined comparison baseline (conventional PV at this scale, in this regulatory context, over this horizon)
- A defined metric (risk-adjusted IRR? NPV? lifetime value per unit of land?)
- A sensitivity analysis showing under what conditions regenerative outperforms, matches, or underperforms
- An honest acknowledgment that the answer may be "not always, and here are the conditions that determine it"

The BM document does this well for the financial model. The Task-Force needs to apply the same rigor to the ecological and social capital dimensions.

---

## Priority actions for the first Task-Force meeting

1. **Agree: is PV the pilot case for this Task-Force cycle, or generic?** (shapes everything else)
2. **Group 1: draw the CLD** — even a whiteboard sketch of the key feedback loops, before any SD model is built
3. **Group 2: define the scope of "regeneration in the product"** — list 5 system functions that a regenerative PV system has that a conventional one doesn't
4. **Both groups: agree on the shared KPI set** — the 8–10 metrics that Group 1's BM must optimize and Group 2's model must satisfy
5. **Declare the PhD relationship** — so WG members know the research context
