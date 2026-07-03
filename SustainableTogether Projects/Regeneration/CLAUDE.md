# CLAUDE.md — Regeneration Task-Force Context

*Updated: 2026-07-01 — Expanded from PV-methodology solo project to WG Task-Force*

---

## Project identity

**Initiative:** INCOSE / GfSE Sustainability Working Group · SustainableTogether project
**Owner:** Hamza Bassam (oose eG, Hamburg)
**Goal:** Demonstrate — in a real MBSE model with a working business model and LCA — that designing engineered systems for regenerative outcomes is more commercially viable than extractive design. Pilot case: SolarX → SustainaSun (regenerative PV).

**Two working groups:**
- **Group 1 — Business Model + SD:** Commercial viability; System Dynamics feedback loops; financial model; LCA integration
- **Group 2 — Product Regeneration:** What regeneration means in SysML v2; regenerative requirements; ecological functions in the system model

**Theoretical anchor:** Fischer et al. (2024), "Mainstreaming regenerative dynamics for sustainability", *Nature Sustainability* 7, 964–972. Open `01-theory-and-ontology/regenerative-dynamics-ontology.html` for the interactive ontology.

---

## Folder structure

```
Regeneration/
├── README.md                 Task-Force overview
├── CLAUDE.md                 This file
├── STATUS.md                 Session state
├── GAPS-AND-RISKS.md         Devil's advocate — critical gaps
├── 00-foundations/           Solution taxonomy, definitions compendium
├── 01-theory-and-ontology/   Ontology HTML + general regeneration literature
├── 02-strategic-framework/   "From Extraction to Regeneration" framework doc
├── 03-methodology/           Aligned approach + interface + PV case study
│   ├── 00-regenerative-design-approach.md   10-step process (generic → PV)
│   ├── 01-desired-outcomes-interface.md     the spine (CLD/SysML/finance/MRV)
│   ├── diagrams/             5 draw.io files
│   └── pv-case-study/        PV framework (Phases 1–5) + 9-topic research dossier
├── 04-business-model/        BM + SD (Group 1)
│   ├── business-model/       SustainaSun BM, built financial model, leasing model doc, BM visual
│   └── system-dynamics/      CLD (v2 docx + v3 drawio), FBMC-CLD alignment ontology/playbook, concept registry, validation pipeline
├── 05-product-regeneration/  SysML v2 integration (Group 2)
├── 06-lca-and-financial/     LCA + financial integration + mrv-protocol.md (cross-group)
├── PhD/                      Hamza's doctoral materials (Schaltegger corpus, Fischer, proposal)
├── _research/                Survey instruments (Danish templates → repurposed for MRV)
└── _archive/                 Superseded docs (handoff brief, resolved review notes)
```

---

## Style rules (apply in every response)

- **SysML v2 textual notation only** — never v1 syntax, never graphical pseudocode
- **Citations must be real and verifiable** — DOIs preferred; never invent references
- **Copyright:** ≤15 words per direct quote, one quote per source per document
- **MBSE is the final formalization layer** — never the front-end framing
- **Fischer et al. (2024) ontology is the conceptual backbone** — use its vocabulary: regenerative dynamics, desired outcome, regenerative momentum, degenerative dynamics, restoration vs regeneration
- **Indigenous practices are first-class engineering knowledge** — not appendix material
- **Apply ReFi / holistic-grazing / Bastin / Rodale critiques** — flag overclaiming wherever it appears
- **Maintain the Triple Top Line** — Economy + Ecology + Equity, all positive; never trade off one capital against another
- **The five capitals framework** — natural, human, social, manufactured, financial; model flows across all five
- **Breadth before depth; generic before MBSE-specific**
- **Language:** English for all Task-Force outputs; German where Hamza switches for oose-internal work

---

## What has been produced (do not redo)

### Complete
- **144-solution regeneration taxonomy** — `00-foundations/compass_artifact_wf-...md` — 10 domains, full citations, TRL ratings, critical rebuttals
- **Definitions compendium** — `00-foundations/Reeneration Definitionen.md` — 15 domain survey with primary sources
- **Regenerative dynamics ontology** — `01-theory-and-ontology/regenerative-dynamics-ontology.html` — based on Fischer et al. (2024)
- **Strategic framework** — `02-strategic-framework/From xtraction To Reeneration.md` — 14-section framework, 11 tools, 4 time horizons
- **PV research dossier** — `03-methodology/pv-case-study/pv-research-dossier.md` — 9 PV-specific topics, complete (pending scope decision)
- **5 draw.io diagrams** — `03-methodology/diagrams/` — methodology overview, lifecycle-capital matrix, mechanisms, capitals, deliverable flow
- **SustainaSun BM v0.1** — `04-business-model/business-model/SustainaSun-Regenerative-PV-Business-Model.md` — complete reference BM document
- **Financial model** — `04-business-model/business-model/SustainaSun_PV_Financial_Model.xlsx` — **built** (7 sheets, real formulas, 3 scenarios; equity IRR ~8–10.5% regenerative case, WACC 4.9–6.5%)
- **The aligned approach (2026-07-02)** — `03-methodology/00-regenerative-design-approach.md` (10-step process), `03-methodology/01-desired-outcomes-interface.md` (the spine), `06-lca-and-financial/mrv-protocol.md` (measurement)

### In progress
- **Generic methodology** — generalized and drafted (`03-methodology/00-...`); PV write-up (Phases 1–5) retained as `pv-case-study/`. Phases 6–8 content folds into Steps 7–10.
- **Desired-outcomes interface + MRV protocol** — drafted; awaiting the group's numeric targets and baselines.
- **SolarX MBSE model** — in SustainableTogether git repo — physical architecture complete; regenerative layer not started.

### Not started
- New regenerative-dynamics business model (Group 1) — ownership + leasing models are the inputs
- System Dynamics model, parameterized from the reconciled CLD (Group 1)
- Regenerative requirements and system functions in SysML v2 (Group 2)
- Regenerative-scenario LCA (06-lca-and-financial)
- Task-Force governance structure

---

## Key references to carry forward

**Foundational:**
- Fischer et al. (2024) — *Nature Sustainability* — regenerative dynamics ontology
- Schaltegger et al. (2015) — business models for sustainability
- Das & Bocken (2024) — regenerative business strategies
- Lyle (1994) — *Regenerative Design for Sustainable Development*
- McDonough & Braungart (2002) — *Cradle to Cradle*
- Raworth (2017) — *Doughnut Economics*
- Reed / Regenesis — Story of Place methodology
- EMF (2013) — *Towards the Circular Economy*

**PV-specific:**
- IEA PVPS Task 12 — lifecycle assessment of PV
- Fraunhofer ISE Photovoltaics Report
- IRENA / IEA-PVPS — End-of-Life Management
- EU Taxonomy, CSRD/ESRS, ESPR, RED III, WEEE Directive

---

## Session resumption

To resume Task-Force work in a new session, read:
1. This file (`CLAUDE.md`)
2. `README.md` — overall structure and mission
3. `GAPS-AND-RISKS.md` — what's missing
4. The relevant group README (`04-business-model/README.md` or `05-product-regeneration/README.md`)
5. `STATUS.md` — session-level progress

Then continue from the open task.
