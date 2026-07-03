# Methodology

The engineering methodology for designing regenerative systems. **Generalized first, then instantiated for PV** (decision taken 2026-07-02).

## Contents

| Item | Status | Notes |
|---|---|---|
| `00-regenerative-design-approach.md` | Draft v0.1 | The 10-step generic approach (Frame / Design / Prove), then PV instantiation. The centerpiece. |
| `01-desired-outcomes-interface.md` | Draft v0.1 | The spine: the shared 8–10 desired-outcomes list used as CLD stocks + SysML requirements + financial lines + MRV targets. |
| `pv-case-study/` | Complete (Phases 1–5) | The PV-specific evidence base: `regenerative-pv-framework.md` (Phases 1–5) + `pv-research-dossier.md` (9 topics). |
| `diagrams/` | Complete | 5 draw.io files (see below) |

## Reading order

1. `00-regenerative-design-approach.md` — the process
2. `01-desired-outcomes-interface.md` — the shared contract between groups
3. `../06-lca-and-financial/mrv-protocol.md` — the measurement layer (Step 10)
4. `pv-case-study/` — the PV worked example

## Diagrams

| File | What it shows |
|---|---|
| `methodology-overview.drawio` | 8-phase flow with feedback loop between phases |
| `lifecycle-capital-matrix.drawio` | 8 PV lifecycle stages × 6 capital types — the central design tool |
| `five-mechanisms.drawio` | The 5 recurring regenerative mechanisms with PV examples |
| `triple-top-line-capitals.drawio` | C2C Triple Top Line + 6 capital types |
| `phase-deliverables-flow.drawio` | Per-phase artifact and handoff flow |

## The 8-phase methodology structure (from the framework doc)

**A · Set context**
1. Frame ambition — Triple Top Line (all three positive)
2. Read the place — Regenesis Story of Place
3. Diagnose state — Doughnut Economics + baseline LCA

**B · Design**
4. Map lifecycle — 8 stages × 6 capitals matrix
5. Pick solutions — from 144-solution catalogue via 5 mechanisms
6. Synthesize — formalize in SysML v2 with openLCA hooks

**C · Realize and learn**
7. Business model — Stahel Performance Economy, EMF archetypes, EU Taxonomy
8. Implement — MRV, adaptive management, feedback to phase 1

## Open question

Currently: "8 PV lifecycle stages." If the methodology generalizes, these become "8 product lifecycle stages" and the PV specifics move to an appendix or case study. This is the primary architectural decision for this folder.
