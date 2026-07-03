# Task Brief — Next Session: Automate the FBMC⇄CLD Alignment Pipeline

**Date of brief:** 2026-07-02 · **Owner:** Hamza · **Context folder:** this folder (`04-business-model/business-model`)

## 1. Context (read this first, then skim the files)

We built a semantic-alignment method between the Flourishing Business Model Canvas (FBMC, per Upward & Jones 2015 SSBMO — PDF in folder) and Causal Loop Diagrams, extending to System Dynamics (Vensim) and the Excel financial model. Core idea: canvas elements don't vary, their **MeasurableAttributes** do; a **Concept Registry** is the single source of truth and all artifacts are projections of it. Everything is documented — do NOT re-derive the method, just read:

1. `Semantic-Integration-Playbook.md` — the full method, conceptual → knowledge graph, incl. code skeletons and 14-step checklist. **Primary reference.**
2. `SustainaSun_Concept_Registry.xlsx` — the live registry: 21 generic concepts (GEN-001..021), 34 links (L01..L34), 9 loops (R1-R4, B1-B5), ChangeLog, README sheet with append rules.
3. `FBMC-CLD-Alignment-Ontology.drawio` — 4 pages: FBMC metamodel, CLD metamodel, bridge, generic CLD.
4. `FBMC-CLD-Semantic-Alignment.docx` — method doc incl. complete block-by-block mapping (§7) and generic loop table (§8). `FBMC-CLD-Alignment-WG.pptx` — WG deck.
5. Source material: v1 paper (`SustainableTogether Circular Photovoltaic Leasing Business Model.docx`), v2 CLD (`2026-07-02 SustainSun CLD v2.docx`), FBMC content in `SustainaSun-Regenerative-PV-Business-Model.md`, financial model xlsx.

Known v1/v2 defects (motivate everything): vocabulary drift, v2 "R7" is actually balancing, actual-vs-perceived environment merged, compound variable names.

## 2. Goal of next session

Automate the pipeline so alignment work is scripted/skill-driven, then run the PV instantiation.

## 3. Target architecture: agentic pipeline with V&V and human gates

Hamza's requirement: he says "integrate domain X to domain Y" and an orchestrated pipeline executes the Playbook, with machine verification after every agent step and human checkpoints between phases.

**Principles:** machines verify structure, humans verify meaning · producer agent ≠ verifier agent (verifier gets fresh context: artifact + checklist only) · humans only review machine-validated work · every human gate = recorded sign-off in ChangeLog.

**Skill suite** (orchestrator `integrate-domains` calls these in order; verifier = separate subagent; gates via AskUserQuestion):

| # | Producer skill | Machine V&V | Human gate |
|---|---|---|---|
| 1 | `metamodel-domain` (per domain, from sample artifacts) | every construct in samples covered by metamodel | G1 approve metamodels |
| 2 | `design-bridge` (bridge concept, cardinalities, derivation rules) | automated "stranger test" on 3 held-out elements | G2 approve bridge (key decision) |
| 3 | `author-invariants` (+ change workflow) | each invariant ↔ defect class, machine-checkable | G3 approve invariants |
| 4 | `build-registry` (xlsx generator) | recalc 0 errors, structure lint, round-trip | G4 sign-off after trial change cycle |
| 5 | `instantiate-registry` (populate from sources) | validate_registry.py (I1–I7), coverage report | G5 expert reviews names/definitions |
| 6 | `project-artifacts` (registry→CLD drawio / Vensim / RDF) | round-trip parse, SHACL, visual-QA subagent | G6 artifact review before publish |
| — | `manage-change` (cross-cutting) | full validation suite re-run | approval for split/merge/retire only |

Note: skills 1–4 already have their FBMC⇄CLD outputs done manually (this folder) — they serve as the reference/regression cases when building the skills.

## 4. Backlog (priority order)

**P1 — Build the skill suite above** (use skill-creator; one orchestrator + station skills, or one skill with station procedures — decide with Hamza based on skill-creator constraints). Bundle these scripts so any future session/agent can run them:
- `validate_registry.py` — checks invariants I1–I7 **directly on the xlsx** (no RDF needed): I1 orphan variables, I2 coverage per FBMC block, I3 recompute loop polarity from CausalLinks and compare to Loops sheet, I4 naming lint (compound "and", direction words: gain/reduction/pressure/increase), I6 goal indicators present, I7 every ID mentioned in ChangeLog. Output: pass/fail report.
- `registry2cld.py` — generate a draw.io CLD page (XML) from Concepts+CausalLinks+Loops (layout: reuse page 4 of the existing drawio as template).
- `xlsx2rdf.py`, `fbmc-cld.ttl`, `shapes.ttl` — the L2/L3 starter kit per Playbook §C3–C5 (skeletons already in the Playbook).
- SKILL.md triggers: "instantiate registry", "validate alignment", "generate CLD", "export knowledge graph".

**P2 — PV instantiation (workshop-sized):** append PV- rows to Concepts renaming the 21 GEN variables from the SustainaSun canvas (use the .md FBMC content; reconcile v1/v2 names into the Name_v1/Name_v2 columns; fill units + FBMC_Element; ChangeLog entries). Then run validator.

**P3 — CLD v3:** generate from registry via `registry2cld.py`; produce a Word loop-table matching the v1/v2 paper format, with corrected loop classification and a v1↔v2↔v3 rename map appendix.

**P4 — Vensim export:** `registry2mdl.py` emitting a Vensim .mdl skeleton (sdTypeHint → Level/Rate/Aux/Constant, units from registry).

**P5 — Knowledge graph:** run the RDF pipeline, spot-check SPARQL coverage query (Playbook §C6).

## 5. Working agreements / decisions already made

- Vocabulary base: FBMC/SSBMO terms; v1/v2 names are legacy columns only.
- SD tool: Vensim. Registry format: Excel (humans) → generated Turtle (machines). URIs: `https://w3id.org/sustainabletogether/fbmc-cld#`.
- IDs never reused; loop type always derived; artifacts regenerated, never hand-edited.
- Business-model scope question (leasing vs. utility PPA) was deferred — ask Hamza before P2 which canvas the PV- rows instantiate.

## 6. Suggested session opening prompt

> "Read TASK-BRIEF-next-session.md in the connected folder. Start with P1: build the integrate-domains skill suite (section 3 architecture) with skill-creator, beginning with validate_registry.py and the metamodel/bridge/invariant station procedures. Use the existing FBMC⇄CLD artifacts as regression cases. Ask me the P2 scope question (leasing vs. utility PPA canvas) when you reach instantiation."
