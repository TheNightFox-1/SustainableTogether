# CLAUDE.md — Regeneration Task-Force Context

*Updated: 2026-08-11 — Six-group structure, RQ decomposition, glossary*

---

## Project identity

**Initiative:** INCOSE / GfSE Sustainability Working Group · SustainableTogether project
**Owner:** Hamza Bassam (oose eG, Hamburg)
**Goal:** Demonstrate — in a real MBSE model with a working business model and LCA — that designing engineered systems for regenerative outcomes is more commercially viable than extractive design. Pilot case: SolarX → SustainaSun (regenerative PV).

**Six working groups** (restructured 2026-08-09; numbers are unique and authoritative — folder prefixes are not):

| Group | Name | Folder | Owns |
|---|---|---|---|
| Group 1 | Business Model | `04-business-model/` | RQ1.1 ★ · RQ2.2 · RQ3.2 |
| Group 2 | Product Regeneration | `05-product-regeneration/` | RQ1.2 · RQ2.5 · RQ3.3 |
| Group 3 | LCA & Financial Integration | `06-lca-and-financial/` | RQ1.3 · RQ2.4 · RQ3.5 |
| Group 4 | System Dynamics | `06-system-dynamics/` | RQ1.5 · RQ2.3 · RQ3.4 |
| Group 5 | Digital Engineering | `07-digital-engineering/` | RQ1.6 · RQ3.1 ★ |
| Group 6 | Enabling Systems | `08-enabling-systems/` | RQ1.4 · RQ2.1 ★ · RQ3.6 |

**Theoretical anchor:** Fischer et al. (2024), "Mainstreaming regenerative dynamics for sustainability", *Nature Sustainability* 7, 964–972. Open `01-theory-and-ontology/regenerative-dynamics-ontology.html` for the interactive ontology.

**Two documents to read before writing anything in this folder:**
- `GLOSSARY.md` — every abbreviation. **Expand each abbreviation on first use in each document**, then use the short form. Add any new abbreviation to the glossary in the same commit.
- `RQ-DECOMPOSITION.md` — the RQ tree, roll-up rules, evidence ledger. When you edit a group's task brief, keep its sub-RQs consistent with this file.

---

## Folder structure

```
Regeneration/
├── README.md                 Task-Force overview and map
├── GLOSSARY.md               Every abbreviation used in this workspace
├── RQ-DECOMPOSITION.md       RQ tree, roll-up rules, evidence ledger, DO × Use matrix
├── CLAUDE.md                 This file
├── STATUS.md                 Session state
├── GAPS-AND-RISKS.md         Devil's advocate — critical gaps
├── 00-foundations/           Research clarification (RQs), REFERENCE/IMPACT, solution taxonomy, definitions
├── 01-theory-and-ontology/   Ontology HTML + general regeneration literature
├── 02-strategic-framework/   "From Extraction to Regeneration" framework doc
├── 03-methodology/           Aligned approach + interface + PV case study
│   ├── 00-regenerative-design-approach.md   10-step process (generic → PV)
│   ├── 01-desired-outcomes-interface.md     the spine (CLD/SysML/finance/MRV)
│   ├── diagrams/             5 draw.io files
│   └── pv-case-study/        PV framework (Phases 1–5) + 9-topic research dossier
├── 04-business-model/        Group 1 — SustainaSun BM, financial model, IVIO ontology work
├── 05-product-regeneration/  Group 2 — SysML v2 integration
├── 06-lca-and-financial/     Group 3 — LCA integration + mrv-protocol.md
├── 06-system-dynamics/       Group 4 — perspective CLDs, integrated CLD, loop analysis
├── 07-digital-engineering/   Group 5 — semantic integration method, concept registry, validation pipeline, ontology
├── 08-enabling-systems/      Group 6 — policy, market, supply chain, grid, standards, governance
├── _research/                PRISMA strategy, literature-review logs, survey instruments (repurposed for MRV)
└── _archive/                 Superseded docs (handoff brief, resolved review notes)
```

Each group folder holds a `README.md` (what the group is) and a `TASK-BRIEF.md` (what it delivers and which sub-RQs it owns).

**Note:** `PhD/` was removed from this repository (commit 7e7aafe) — doctoral materials are kept out of the public repo.

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
- New regenerative PVaaS business model (Group 1) — ownership + leasing models are the inputs
- System Dynamics model, parameterized from the reconciled CLD (Group 4) — highest-priority missing artefact
- Regenerative requirements and system functions in SysML v2 (Group 2)
- Regenerative-scenario LCA (Group 3)
- Enabling-systems map and revenue-line bankability filter (Group 6)
- SysML v2 extension of the semantic bridge (Group 5)
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
3. `GLOSSARY.md` — the abbreviations
4. `RQ-DECOMPOSITION.md` — what counts as an answer, and how far each RQ is from one
5. `GAPS-AND-RISKS.md` — what's missing
6. The relevant group's `README.md` **and** `TASK-BRIEF.md`
7. `STATUS.md` — session-level progress

Then continue from the open task.
