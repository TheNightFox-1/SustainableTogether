# STATUS — Regeneration Task-Force

*Updated: 2026-07-02 (aligned-approach session; was: Regenerative PV Framework build log, 2026-04-26)*

---

## Current state

**Phase:** Aligned approach drafted. The three connective artefacts that `GAPS-AND-RISKS.md` found missing now exist in draft. Ready for the first Task-Force meeting to set target values and confirm the new business model.

**Done this session (2026-07-02, aligned-approach):**
- **The methodical approach** — `03-methodology/00-regenerative-design-approach.md` — 10-step process (Frame / Design / Prove), generic first then PV, built around Fischer's regenerative dynamics. Absorbs the old 8-phase framework.
- **The desired-outcomes interface** — `03-methodology/01-desired-outcomes-interface.md` — the spine; 8 proposed outcomes (DO-1…DO-8), each mapped to a CLD stock, a SysML requirement, a financial line, and an MRV method. Targets left TBD for the group.
- **The MRV protocol** — `06-lca-and-financial/mrv-protocol.md` — baseline → repeat → attribution logic, verification tiers, financial-ecological reconciliation.
- **Folder cleanse** — see "Folder changes" below.

**Location note:** Migration into the git repo is complete; the folder lives at `SustainableTogether Projects/Regeneration/`. The CLD doc is in `04-business-model/system-dynamics/`. `Regeneration_OLD_flat_backup/` is retained until verified.

---

## What was done (2026-07-01 → 2026-07-02)

0. **Correction (2026-07-02):** PhD folder reconstituted (`PhD/` with `Stefan Schaltegger/` + proposal + brief) after an earlier restructure had dissolved it — no files lost. Migration into the correct git-repo location prepared. A review pass corrected fabricated-looking quotes, wrong file paths, invalid SysML v2, and illustrative KPIs that read as agreed targets.

1. **Folder restructure** — all files moved from flat root (plus PhD/ and BM and SD/ subfolders) into the organized structure.

2. **Context documents written:**
   - `README.md` — Task-Force overview, two groups, integration point, folder map
   - `CLAUDE.md` — Updated from PV-methodology scope to full Task-Force context
   - `GAPS-AND-RISKS.md` — 10 critical gaps identified
   - `_review/REVIEW-NOTES.md` — Per-document analysis and recommendations for all 8 documents in `_review/`
   - README files for all 7 content folders (00–06)

3. **Confirmed folder structure:**
   ```
   00-foundations/         4 files + README
   01-theory-and-ontology/ 14 files + README
   02-strategic-framework/ 1 file + README
   03-methodology/         diagrams/ (5 draw.io) + README
   04-business-model/      business-model/ (3 files) + system-dynamics/ (empty) + README
   05-product-regeneration/ empty + README
   06-lca-and-financial/   empty + README
   _research/              4 files
   _review/                8 files + REVIEW-NOTES.md
   ```

---

## Folder changes (2026-07-02)

- **Deleted:** `_review/SustainaSun-...(1).md` (byte-identical duplicate, confirmed).
- **Moved:** `regenerative-pv-framework.md` + `pv-research-dossier.md` → `03-methodology/pv-case-study/` (PV is now the case study under the generic method).
- **Moved:** Circular PV Leasing `.docx` + `SustainableTogether_ Business Models.pdf` → `04-business-model/business-model/` (both are inputs to the new regenerative-dynamics BM).
- **Archived:** framework handoff brief + resolved REVIEW-NOTES → `_archive/`.
- **Removed:** empty `_review/` folder.
- **Kept:** `Regeneration_OLD_flat_backup/` (in the parent Projects folder) until Hamza verifies nothing was lost.

## Resolved decisions (from 2026-07-02 session)

| Decision | Outcome |
|---|---|
| Generalize methodology or PV-only? | **Generalize first, then PV.** Done — see `03-methodology/`. |
| Which BM track? | **Build a new BM centered on regenerative dynamics.** Ownership + leasing models become inputs. |
| `SustainaSun BM (1).md` | Duplicate — deleted. |
| `Circular PV Leasing BM.docx` | Substantive CLD sketch — kept as BM input. |
| `SustainableTogether Business Models.pdf` | Single-page image export (no text) — kept as visual; **needs a human glance** to classify. |

## Still waiting on the group

| Decision | Stakes |
|---|---|
| Set numeric targets + baselines in the desired-outcomes interface | Unblocks Steps 5–10 for both groups |
| Reconcile CLD (leasing) with the new BM before parameterizing SD | Step 8 blocked until CLD and BM describe the same system |
| Confirm revenue architecture of the new regenerative-dynamics BM | Group 1 core work |
| PhD relationship to the Task-Force (action-research framing) | WG governance |

---

## Pending technical work (next sessions)

| Item | Owner | Priority |
|---|---|---|
| First Task-Force meeting | Hamza | High — many decisions require the group |
| System Dynamics CLD | Group 1 | High — highest-priority missing artifact |
| Group 2 scope definition (5 regenerative system functions) | Group 2 | High — unblocks SysML work |
| Shared KPI set (Group 1 → Group 2 interface) | Both groups | High |
| Financial model verification (is the Excel built?) | Hamza | Medium |
| MRV protocol | Task-Force | Medium |
| Task-Force governance doc | Hamza | Medium |
| Regenerative-scenario LCA | Group 1 + openLCA | Low (depends on scope decision) |
| Resume 8-phase methodology (Phases 5–8) | Claude (after scope decision) | Blocked |

---

## Previous: PV Framework build log

**Status before 2026-07-01:** Stage 2 of 4 (writing framework doc), Phases 1–4 of 8 written.

| Stage | Status | Output |
|---|---|---|
| 0. Setup, decisions, plan | done | files created |
| 1. PV-specific research (9 topics) | done | `_review/pv-research-dossier.md` |
| 2. Write framework document (Phases 1–4 of 8) | paused — scope decision needed | `_review/regenerative-pv-framework.md` |
| 3. Verification pass | not started | |
| 4. Convert to .docx | not started | |

---

## Resumption prompt

> I am resuming the Regeneration Task-Force. Please read `CLAUDE.md`, `README.md`, `GAPS-AND-RISKS.md`, and `STATUS.md` in the Regeneration folder, then ask me which open item to work on.
