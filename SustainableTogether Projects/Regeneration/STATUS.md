# STATUS — Regeneration Task-Force

*Updated: 2026-08-11 (documentation-alignment session; earlier entries retained below)*

---

## Current state

**Phase:** Structure and framing complete; substantive group work not started. Waiting on the first Task-Force meeting to set the numeric desired-outcome targets and confirm the PVaaS business model.

**Done this session (2026-08-11, documentation alignment):**
- **Glossary** — `GLOSSARY.md` — every abbreviation used in the workspace, in ten categories, with the "expand on first use" rule stated.
- **RQ decomposition** — `RQ-DECOMPOSITION.md` — RQ1–RQ3 split into 17 sub-questions, each with one owner, one artefact, and one acceptance test; roll-up rules per RQ; evidence ledger; DO × Use matrix.
- **Group renumbering** — the 2026-08-09 restructure had left two groups labelled "Group 2" and two labelled "Group 3". Groups are now uniquely numbered 1–6 and referenced by number *and* name everywhere.
- **Task briefs for all six groups** — Groups 2, 3, 4 and 5 had none; they now use the same template as Groups 1 and 6, each stating its sub-RQs.
- **Stale paths corrected** — references to `04-business-model/system-dynamics/` now point at `07-digital-engineering/`.

**Open flags raised this session:**
- **Success criterion C5** (social value) has no owning sub-RQ. It is currently carried inside RQ3.2 and RQ3.5. If social value is to be evidenced as strongly as financial value, C5 needs its own sub-question and owner.
- **C6 requires ≥ 2 contexts**, but validating the method beyond PV is explicitly out of scope this cycle. RQ3's answer must be stated as "demonstrated in one context" — claiming C6 on the PV pilot alone would be overclaiming.
- **Groups 5 and 6 have no GitHub issues.** Recommended: two issues each (SysML bridge + standing consistency report for Group 5; bankability filter + landscape map for Group 6).
- **Folder prefixes `06-` are duplicated** across Groups 3 and 4. Group numbers are authoritative; renaming a folder was not done to avoid churning the just-completed restructure.

---

## Earlier: 2026-07-02 (aligned-approach session)

**Phase:** Aligned approach drafted. The three connective artefacts that `GAPS-AND-RISKS.md` found missing now exist in draft. Ready for the first Task-Force meeting to set target values and confirm the new business model.

**Done this session (2026-07-02, aligned-approach):**
- **The methodical approach** — `03-methodology/00-regenerative-design-approach.md` — 10-step process (Frame / Design / Prove), generic first then PV, built around Fischer's regenerative dynamics. Absorbs the old 8-phase framework.
- **The desired-outcomes interface** — `03-methodology/01-desired-outcomes-interface.md` — the spine; 8 proposed outcomes (DO-1…DO-8), each mapped to a CLD stock, a SysML requirement, a financial line, and an MRV method. Targets left TBD for the group.
- **The MRV protocol** — `06-lca-and-financial/mrv-protocol.md` — baseline → repeat → attribution logic, verification tiers, financial-ecological reconciliation.
- **Folder cleanse** — see "Folder changes" below.

**Location note:** Migration into the git repo is complete; the folder lives at `SustainableTogether Projects/Regeneration/`. *(Superseded 2026-08-09: the CLD and the semantic-integration pipeline moved to `07-digital-engineering/`.)*

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
| Set numeric targets + baselines in the desired-outcomes interface | Unblocks Steps 5–10 across all six groups |
| Reconcile CLD (leasing) with the new business model before parameterizing System Dynamics | Step 8 blocked until CLD and business model describe the same system |
| Confirm revenue architecture of the regenerative PVaaS business model | Group 1 core work; front of the pipeline |
| Does success criterion C5 (social value) get its own sub-RQ and owner? | Otherwise social value is evidenced more weakly than financial value |
| PhD relationship to the Task-Force (action-research framing) | WG governance |

---

## Pending technical work (next sessions)

| Item | Owner | Priority |
|---|---|---|
| First Task-Force meeting — set numeric DO targets ([#26](https://github.com/TheNightFox-1/SustainableTogether/issues/26)) | Hamza | **High** — gates RQ1.1 pricing, RQ3.4 parameterisation, RQ3.5 MRV thresholds simultaneously |
| Confirm PVaaS revenue architecture ([#27](https://github.com/TheNightFox-1/SustainableTogether/issues/27)) | Group 1 — Business Model | High — front of the pipeline; several groups wait on it |
| System Dynamics CLDs and model ([#29](https://github.com/TheNightFox-1/SustainableTogether/issues/29)) | Group 4 — System Dynamics | High — highest-priority missing artefact; structural work not blocked |
| Scope definition: ~5 regenerative system functions ([#31](https://github.com/TheNightFox-1/SustainableTogether/issues/31)) | Group 2 — Product Regeneration | High — unblocks SysML work and gives other groups a concrete interface |
| Revenue-line bankability filter (RQ1.4) | Group 6 — Enabling Systems | High — the RQ1 gate cannot be assembled honestly without it |
| Financial model verification (what is built vs. spec?) | Group 3 — LCA & Financial | Medium |
| MRV protocol ([#35](https://github.com/TheNightFox-1/SustainableTogether/issues/35)) | Group 3 — LCA & Financial | Medium — **not blocked, can start now** |
| SysML v2 extension of the semantic bridge | Group 5 — Digital Engineering | Medium — start once Group 2 produces its first `requirement def` elements |
| Open GitHub issues for Groups 5 and 6 | Hamza | Medium |
| Task-Force governance doc ([#37](https://github.com/TheNightFox-1/SustainableTogether/issues/37)) | Hamza | Medium |
| Regenerative-scenario LCA ([#34](https://github.com/TheNightFox-1/SustainableTogether/issues/34)) | Group 3 — LCA & Financial | Blocked on Group 2's material definitions |

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
