# LLM-Wiki demonstrator — Sustainability WG

A working LLM-Wiki built over the WG's own PDFs, to accompany
`../LLM-Wiki-Sustainability-WG.pptx` in the working session.

The deck argues the pattern. This is the pattern, running, on our material.

**New to this? Read [`GETTING-STARTED.md`](GETTING-STARTED.md) instead.** It assumes no prior
knowledge of git, Obsidian, Python or AI tooling, and walks through what to click and what it
means. This file is the short version, for whoever is presenting.

## What to open

| | |
|---|---|
| **`llm-wiki-demonstrator.html`** | The presentation view. Open in any browser, no server, no install. Browse the wiki, watch an ingest, read the contradictions and the lint report. |
| **`GETTING-STARTED.md`** | Beginner's guide. Start here if the pattern is new to you. |
| **`wiki/index.md`** | The wiki itself, as plain markdown. Reads fine in Obsidian, VS Code or on GitHub. |
| **`CLAUDE.md`** | Layer 3 — the schema and the workflows. The whole configuration is one file you can read in five minutes. |
| **`raw/registry.md`** | Layer 1 — the source manifest. Points at PDFs already in this repository; nothing was copied. |
| **`lint/lint.py`** | The deterministic health check. `python lint/lint.py` |

## What is real here

- **The sources are real.** 14 PDFs already in `SustainableTogether`, listed with their paths
  in `raw/registry.md`.
- **The pages are real.** Every claim carries a citation to one of those PDFs, with the page
  or slide number.
- **The contradictions are real.** They were found in the corpus, not invented for the demo.
  The sharpest one is between two of our own webinar episodes: Ep. 03 presents sustainability
  as three pillars, Ep. 04 argues that sustainability without thresholds is not sustainability.
  Nothing in the corpus reconciles them, so the wiki does not either — it holds both, cites
  both, and opens a question.
- **The lint report is real.** `lint/report.json` is the output of running `lint/lint.py`
  against these files. Re-run it and you get the same 25 findings.
- **No page is published.** Every page sits at `draft`, `in-review` or `lint-clean`. The
  publish gate needs a WG member's name, and nobody has signed anything.

## What is not real

The pilot is 11 sources deep, not the full corpus, and the ingest history in `wiki/log.md`
is written as a single session rather than accumulated over weeks. The 400-word pages are
what a real pilot produces; the *pace* shown here is compressed.

## The proposal this supports

Slide 12 of the deck: pilot on one asset, make it OKF-conformant from day one, wire in the
human-in-the-loop gates, review at the next session. This demonstrator is that pilot at
roughly one afternoon of work — small enough to throw away if a page never compresses real
work, and legible enough to know why.

## Presenting it

Six tabs, roughly in the order the deck argues them: **The wiki** (browse it) · **Ingest**
(press *Run ingest R11* — one source, six files, one contradiction, one question opened) ·
**Contested** · **Lint** · **Log** · **How it works**.

Every view is directly linkable, so you can jump straight to a slide's counterpart:

```
llm-wiki-demonstrator.html#view=contested
llm-wiki-demonstrator.html#view=lint
llm-wiki-demonstrator.html#concepts/regeneration.md
```

The two pages worth opening live are `concepts/regeneration.md` (three definitions held apart,
provenance flag visible in the side panel) and `concepts/strong-sustainability.md` (Ep. 03
against Ep. 04). Clicking a greyed link — `flourishing.md`, say — shows what OKF does with a
page that has not been written yet.

## Running it

```bash
python lint/lint.py            # report to stdout, exit 1 on any error
python lint/lint.py --json     # rewrite lint/report.json
```

No dependencies beyond the Python standard library. No network access. No model calls —
lint is scripts, not tokens, which is what makes it repeatable and immune to model drift.
