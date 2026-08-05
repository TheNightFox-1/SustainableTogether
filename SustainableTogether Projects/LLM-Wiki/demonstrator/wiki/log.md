---
type: Log
title: Wiki log
status: lint-clean
sources: []
tags: [audit]
timestamp: 2026-08-05
reviewed_by: ""
revalidate_after: 2027-08-05
---

# Log

Append-only. One entry per operation. This is the audit trail; git history is the other half of it.

---

### 2026-08-05 · `ingest R01` — Mang & Reed, Regenerative Development and Design

**Created** `concepts/regeneration.md`, `concepts/regenerative-design.md`,
`concepts/regenerative-development.md`, `concepts/restorative-design.md`,
`sources/r01-mang-reed.md`
**Flagged** publication year printed as `2112` in the source header. Not corrected. Recorded
in `raw/registry.md` and held for human confirmation.
**Note** R01's glossary contains 9 further definable terms (biomimicry, cradle-to-cradle,
ecoliteracy, ecological sustainability, living systems thinking, permaculture, place,
locational patterns, systems thinking). Not written — out of pilot scope, linked as work items.

---

### 2026-08-05 · `ingest R02` — Regeneration Across Earth's Systems taxonomy

**Created** `concepts/mrv-living-systems.md`, `sources/r02-regeneration-taxonomy.md`
**Updated** `concepts/regeneration.md` (engineering sense added; two Contested entries),
`concepts/restorative-design.md` (Contested: R02 merges restoration into regeneration),
`concepts/regenerative-development.md` (MBSE weak-fit classification)
**Contradiction raised** R01 distinguishes restoration from regeneration by target state;
R02 files ecological restoration as entry 1.1 of a regeneration taxonomy. → `Q02`
**Note** 144 solution entries read; 3 written up. The taxonomy is a candidate for its own
entity page cluster if the pilot scales.

---

### 2026-08-05 · `ingest R03` — Das & Bocken (2024)

**Created** `concepts/regenerative-business-model.md`,
`entities/regenerative-business-case-database.md`, `concepts/net-positive.md`,
`sources/r03-das-bocken-2024.md`
**Updated** `concepts/regeneration.md` (business tradition added as a third sense)
**Contradiction raised** unit of analysis — place (R01) vs firm (R03) vs device (R02).
→ `Q02` extended
**Question opened** `questions/q02-regeneration-scope.md`

---

### 2026-08-05 · `ingest R04` — Upward & Jones (2015)

**Created** `concepts/strong-sustainability.md`, `concepts/tri-profit.md`,
`entities/flourishing-business-canvas.md`
**Updated** `concepts/regenerative-business-model.md` (R04's design-parameter objection),
`concepts/net-positive.md` (common-currency problem)
**Source page** not written — queued.

---

### 2026-08-05 · `ingest R09` — Bornes (2025), SWS Ep. 01

**Created** `concepts/rebound-effect.md`, `sources/r09-bornes-rebound.md`
**Updated** `concepts/net-positive.md` (system-boundary caveat),
`concepts/regeneration.md` (Contested: claims failing under corrected LCA)
**Note** the consequential-vs-attributional distinction wants its own page.
Linked as `concepts/consequential-lca.md`, not written.

---

### 2026-08-05 · `ingest R10, R11, R12` — SWS Ep. 03, Ep. 04, Future-Fit

**Created** `concepts/sustainability-context.md`,
`entities/future-fit-business-benchmark.md`, `sources/r11-baue-authentic-sustainability.md`
**Updated** `concepts/strong-sustainability.md` (both sides of the fork, cited),
`concepts/net-positive.md` (R12 impact matrix)
**Contradiction raised** R10 presents sustainability as three pillars without thresholds;
R11 argues sustainability without thresholds is not sustainability. Both are INCOSE webinar
sources. Not reconciled, not averaged. → `Q01`
**Question opened** `questions/q01-which-sustainability.md`
**Status action** all pages citing R10/R11/R12 capped at `in-review` per `CLAUDE.md`
(slide-deck rule).

---

### 2026-08-05 · `ingest R05, R07, R08` — Kulp 2026, Schlüter 2023, FBC guide v3.0

**Updated** `concepts/regenerative-business-model.md` (R05 three-phase transformation),
`concepts/rebound-effect.md` (R07 as the constructive answer),
`entities/flourishing-business-canvas.md` (R08 structure)
**Source pages** not written — queued.

---

### 2026-08-05 · `review` — independent pass, all 16 pages

Run as a separate instance with no drafting memory. Input: page text plus cited raw excerpts.

**Findings**
1. `concepts/regenerative-business-model.md` — cites R02 in the Citations block, but R02 is
   absent from the frontmatter `sources` list. Frontmatter is the machine-readable contract;
   fix before publish. *Open.*
2. `concepts/net-positive.md` — the sentence beginning "A net-positive claim in a WG document
   should therefore always be accompanied by…" is the wiki's own recommendation, not any
   source's. Correctly marked `[WG]`. *No action.*
3. `entities/regenerative-business-case-database.md` — the Contested section's reading is an
   inference across R03 and R02, not a claim either source makes. Correctly marked `[WG]`.
   *No action.*
4. `concepts/regeneration.md` — checked the R02 executive-summary quotation word for word
   against the source. Accurate. *No action.*
5. No claim was found in any page that is absent from its cited source.

---

### 2026-08-05 · `lint`

`python lint/lint.py` over 23 files and 14 registered sources.
**25 findings: 0 error · 13 warn · 12 info.** Report at `lint/report.json`.

- 1 × `citation-undeclared` — the frontmatter slip review finding 1 also caught, from a
  different direction: the reviewer read it, the script matched it. Neither alone is enough.
- 6 × `provenance-flag` — every page citing R01 carries the unresolved `2112` year anomaly.
  One bad metadata field in one source, surfaced on all six pages that depend on it. This is
  the propagation the pattern is dangerous for, made visible.
- 6 × `source-page-missing` — R04, R05, R07, R08, R10, R12 ingested without their source page.
- 3 × `not-ingested` — R06, R13, R14 curated, not yet read.
- 9 × `not-yet-written` — dangling links. Work items under OKF, not errors.

Publish gate reports `open`: no error-class finding blocks it. **No page was published.**
The gate being open is a machine verdict; publishing is a human act, and no WG member has
signed anything off. That distinction is the whole point of the design.
