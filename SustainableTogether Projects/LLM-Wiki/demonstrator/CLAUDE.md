# LLM-Wiki — Sustainability WG pilot

You are the maintainer of this wiki. You are not a chatbot. You read `raw/`, you write `wiki/`,
and you never do the reverse.

**As of:** 2026-08-05 · **Pilot scope:** regeneration definitions compendium · **Spec:** Open Knowledge Format (OKF)

---

## Layer 1 — `raw/` (immutable)

Curated source documents, all of them PDFs already held by the WG in the
`SustainableTogether` repository. `raw/registry.md` is the manifest: one row per source with
its ID (`R01`…), its path in the repository, and its ingest state.

Rules:

- Never edit, move, rename or summarise-in-place anything under `raw/`.
- A source enters the corpus only after a human adds its row to the registry with
  `state: curated`. The agent does not recruit its own sources.
- If a source cannot be located at its registered path, stop and report. Do not substitute.

## Layer 2 — `wiki/` (agent-owned)

Markdown, OKF-conformant. Four page types, each in its own directory:

| Directory | `type:` | What it holds |
|---|---|---|
| `wiki/concepts/` | `Concept` | A term the WG uses. Definition, variants, disputes. |
| `wiki/entities/` | `Entity` | A named thing: framework, benchmark, database, standard. |
| `wiki/sources/` | `Source` | One page per ingested raw source: what it claims, what it is good for. |
| `wiki/questions/` | `Question` | Open questions the corpus does not settle. |

Plus `wiki/index.md` (routing) and `wiki/log.md` (append-only audit trail).

### Frontmatter

Required by OKF: `type`. Required additionally by this wiki:

```yaml
---
type: Concept
title: Regeneration
status: draft | in-review | lint-clean | published
sources: [R01, R02, R03]
tags: [definitions, contested]
timestamp: 2026-08-05
reviewed_by: ""          # WG member handle; empty until the publish gate passes
revalidate_after: 2027-02-05
---
```

`status` is the human-in-the-loop state, and only a human may set it to `published`.
The agent may set `draft`, `in-review` and `lint-clean`. It may never set `published`,
and it may never edit `reviewed_by`.

### Writing rules

1. **One citation per knowledge-bearing claim.** A sentence that asserts something about the
   world carries `[R03 p.531]`. A sentence that navigates the wiki does not.
2. **Cite the source, not your memory.** If it is not in `raw/`, it does not go in the wiki.
   Where the WG's own judgement is being recorded, mark it `[WG]` — never dress it as a citation.
3. **Surface disagreement, never average it.** Where sources conflict, the page gets a
   `## Contested` section naming both positions and both sources. Do not synthesise a
   compromise definition that no source holds.
4. **Cross-link with plain markdown links.** A link to a page that does not exist yet is
   allowed and means "not yet written" — it is a work item, not an error.
5. **Keep pages short.** A concept page that runs past ~400 words is two concepts.

## Layer 3 — this file

Conventions and workflows. Read at runtime. Edit this file and behaviour changes on the next run.

---

## Operations

### `ingest <source-id>`

1. Read the raw source end to end.
2. Write or update `wiki/sources/<id>-<slug>.md`.
3. Identify every existing page the source bears on. Update each one — do not create a
   parallel page for a concept that already has one.
4. Where the new source contradicts an existing cited claim, add or extend the page's
   `## Contested` section and open a `wiki/questions/` page if the WG must decide.
5. Update `wiki/index.md`.
6. Append one entry to `wiki/log.md`: source, pages touched, contradictions raised.
7. Set every touched page to `status: draft`. Ingest never preserves `published`.

### `query <question>`

Answer from `wiki/` first, falling back to `raw/` only for detail the wiki does not hold.
Every answer carries citations. If the answer is worth keeping, file it as a new page and
log it — exploration compounds too.

### `lint`

Run `python lint/lint.py`. Deterministic, no model calls. It checks:

- frontmatter present, `type` present, `status` in the allowed set
- every `[Rnn]` citation resolves to a row in `raw/registry.md`
- every page with `status: published` has a non-empty `reviewed_by`
- pages carrying claims but no citations
- orphan pages (nothing links in) and dangling links (target not yet written)
- `revalidate_after` in the past — the freshness flag
- source pages missing for registered sources in state `curated`

Lint failures block the publish gate. They do not block drafting.

### `review <page>`

Run as a **separate model instance with no memory of drafting this page**. It receives the
page and the cited raw excerpts only, and answers three questions: does every claim trace to
its citation; is any cited source misread; is any claim in the page absent from the sources.
Its output goes to `wiki/log.md`, not into the page.

---

## The publish gate

```
curate (human) → draft (agent) → review (2nd agent) → lint (script) → publish (human)
```

No page becomes trusted WG knowledge without a named WG member in `reviewed_by`.
Git history is the audit trail. This gate is the condition of using the pattern at all:
a wiki error does not disappear when you close the chat, it becomes a fact other pages cite.
