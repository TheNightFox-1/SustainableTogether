# SLR Execution Prompt: Regenerative Business Models

**Purpose:** the prompt to hand an AI research agent (or a human reviewer) to execute the systematic literature review on regenerative business models for the Regeneration Task-Force.
**Owner:** Group 1, Business Model · **Feeds:** RQ1.1 ★, RQ2.2, RQ3.2
**Created:** 2026-08-21 · **Status:** ready to run, pending the scope decision in §0

---

## §0 Scope decision (settle before running)

The prompt below is written for **Option A**. If you want Option B, change §2 and §4 only.

| | Unit of analysis | Expected corpus | Trade-off |
|---|---|---|---|
| **A (recommended)** | Regenerative business models in any sector, with an energy/PV subset flagged at extraction | 60 to 120 included | Supports the gap claim; produces a publishable WG output |
| **B** | Regenerative business models in energy systems only | 10 to 25 included | Fast, but too thin to claim a gap, and too thin for a WG paper |

---

## The prompt

> Copy everything below this line into the research session.

---

### 1. Review questions

This review answers three questions. Everything you produce serves one of them.

**SLR-Q1 (construct).** How is a *regenerative* business model defined in the literature, and on what criteria is it distinguished from sustainable, circular, net-positive, restorative and nature-positive business models? Where do the definitions disagree?

**SLR-Q2 (mechanism).** Which value-creation and value-capture mechanisms do regenerative business models actually use, and which of those are evidenced by real transactions rather than proposed conceptually? This is the output Group 1 needs most: it feeds the revenue-architecture bankability table directly.

**SLR-Q3 (evidence).** What quantified financial evidence exists for regenerative business models (NPV, IRR, payback, cost of capital, levelised cost of electricity (LCOE), willingness-to-pay premiums), and what is the state of evidence for engineered and energy systems specifically?

A prior, unverified search concluded that the regenerative business-model literature is entirely conceptual and that no study applies regenerative principles to a concrete engineered product with financial modelling. **Treat that as a hypothesis to test, not a finding to repeat.** State explicitly at the end whether the corpus confirms it, qualifies it, or refutes it.


### 2. Search strategy

Start from the concept blocks in `PRISMA-search-strategy.md`. Extend block A, which is the weak one:

```
"regenerative business model*" OR "regenerative business" OR "regenerative econom*"
OR "regenerative capitalism" OR "regenerative enterprise" OR "regenerative design"
OR "regenerative agricultur*" AND business OR "regenerative finance" OR ReFi
OR "net-positive business" OR "nature-positive business" OR "restorative business"
OR "strongly sustainable business model*" OR "flourishing business"
OR "thriveable business" OR "regenerative value creation"
```

Combine with a business-model block:

```
"business model*" OR "value creation" OR "value capture" OR "value proposition"
OR "revenue model*" OR "product-service system*" OR PSS OR servit* OR "as-a-service"
OR "business model innovation" OR "business model canvas"
```

**Databases (all of them, log counts per database):** Scopus, Web of Science, Business Source Premier or EBSCO, ScienceDirect, OpenAlex, Google Scholar (first 100 results only, used for snowballing and grey coverage, flagged as such).

**Date range:** database searches 2010 to present. Seminal earlier works (Lyle 1994, McDonough and Braungart 2002, Hawken) enter only through backward snowballing, marked as such.

**Languages:** English


**Grey literature (pre-registered, reported as a separate arm, never merged into the peer-reviewed counts):** Ellen MacArthur Foundation, Regenesis Group, Capital Institute, Forum for the Future, B Lab, IRENA, IEA and IEA-PVPS, Fraunhofer ISE, plus developer techno-economic reports. Grey sources may support SLR-Q2 and SLR-Q3 but may never carry a definitional claim in SLR-Q1 alone.


### 3. Inclusion and exclusion

**Include** if the work: treats a business model, value-creation logic, or business strategy as its object; **and** engages with regeneration, net-positive, restorative, or strongly-sustainable framing as more than a passing adjective; **and** is a peer-reviewed article, conference paper, book chapter, or a pre-registered grey source.

**Exclude:** urban regeneration and real-estate redevelopment; biological, medical, and tissue regeneration; regenerative braking and other engineering homonyms; papers using "regenerative" only as a synonym for renewable energy; corporate marketing material without method; works with no accessible full text after two retrieval attempts.

Record every exclusion with its reason code. Exclusion reasons are part of the result, not bookkeeping.

### 6. Screening

Title and abstract screening, then full text. Report a PRISMA 2020 flow with real counts at every stage: identified, deduplicated, screened, excluded with reasons, full-text assessed, included.

Screening decisions are not free-text. For each record log: ID, decision (include, exclude, uncertain), reason code, and a one-line justification. Anything marked uncertain goes to full text, never to exclusion.

### 7. Data extraction

One row per included work, in `03-extraction.csv`. Fields:

| Field | Note |
|---|---|
| `id` | short citation key, matching `references.bib` |
| `authors`, `year`, `title`, `venue`, `type`,`abstract` | type: article, chapter, conference, grey |
| `doi` | **mandatory for peer-reviewed items**, verified resolvable; a stable URL for grey |
| `discipline`, `sector`, `geography` | sector matters: expect agriculture and landscape ecology to dominate |
| `definition_verbatim` | the definition of regenerative business the work uses, at most 15 words quoted |
| `distinction_from` | which adjacent concepts it distinguishes itself from, and on what criterion |
| `theoretical_anchor` | Fischer, Hahn and Tampe, Konietzko, Buckton, Lyle, Raworth, McDonough, other |
| `empirical_basis` | conceptual, single case, multi-case, Delphi, survey, simulation, review |
| `n_cases` | integer or blank |
| `capitals_addressed` | natural, human, social, manufactured, financial |
| `trade_off_stance` | co-optimisation, explicit trade-off, silent |
| `value_capture_mechanism` | free text: how money is actually made. **The key field for SLR-Q2** |
| `mechanism_evidenced` | transacted, piloted, proposed, none |
| `financial_metric_reported` | NPV, IRR, payback, WACC, LCOE, premium, none |
| `financial_value` | the figure with units, or blank |
| `mrv_approach` | how outcomes are measured and verified, or none |
| `service_model` | yes / no: does it use a product-service system or as-a-service structure |
| `energy_relevance` | direct, transferable, none |
| `do_mapping` | which of DO-1 to DO-8 the work speaks to |
| `rq_relevance` | RQ1.1, RQ2.2, RQ3.2, or combinations |
| `quality_score` | from §8 |
| `notes` | including any concern about the work's rigour |

Blank means "the work does not report this". Never infer a value to fill a cell, and never carry a figure forward without its source.

### 8. Quality appraisal

Score every included work 1 to 5 on four dimensions, and report the instrument in the protocol:

1. **Conceptual clarity.** Is "regenerative" defined operationally, or used as a mood?
2. **Empirical grounding.** Data, cases, or assertion?
3. **Transparency.** Are method, assumptions, and limitations stated well enough to reproduce?
4. **Overclaim control.** Does the work acknowledge counter-evidence and boundary conditions?

Apply the Task-Force's standing critical lens: the ReFi, holistic-grazing, Bastin, and Rodale critiques. Where a work claims regenerative outcomes without measurement, flag it as overclaiming in `notes`. A highly cited paper that asserts rather than evidences gets a low score, and you say so.


### 10. Synthesis

Narrative synthesis with a thematic structure, supported by tables. Produce, in `05-synthesis.md`:

1. **Definitional map** for SLR-Q1: the competing definitions, the criteria that separate regenerative from circular, sustainable, and net-positive, and where the literature contradicts itself. Say which definition the Task-Force should adopt, and why.
2. **Mechanism catalogue** for SLR-Q2: every documented value-capture mechanism, with its evidence level (transacted, piloted, proposed) and its sector of origin. Sort by evidence level, not by how interesting it is.
3. **Evidence table** for SLR-Q3: every quantified financial figure in the corpus, with source, method, and boundary conditions. Where the corpus is empty, say it is empty.
4. **Maturity assessment:** what proportion of the corpus is conceptual, and the verdict on the prior gap claim (confirmed, qualified, or refuted).
5. **Chronology and geography:** where this field is growing and who is producing it.
6. **Contradictions and open disputes**, stated as disputes rather than resolved.


### 11. Outputs


```
00-protocol.md                  protocol and deviations
01-search-log.md                strings, databases, dates, counts per database
02-screening-log.csv            every record, decision, reason code
03-extraction.csv               one row per included work
04-quality-appraisal.md         instrument plus scored table
05-synthesis.md                 the review itself
06-implications-for-group1.md   the handover to the business model work
07-prior-log-verification.md    the §9 verification pass
prisma-flow.md                  counts plus a mermaid flow diagram
references.bib                  BibTeX, DOI on every peer-reviewed entry
```

### 12. Hard rules

- **Every citation must be real and verifiable.** DOIs preferred. If you cannot resolve a work, mark it unverified and exclude it from the synthesis. Never invent a reference, an author list, a year, or a figure.
- **Quotes: at most 15 words per direct quote, one quote per source per document.** Paraphrase otherwise.
- **Never report a search count you did not run.** If a database was inaccessible, record that instead of estimating.
- Expand every abbreviation on first use, then use the short form. Add any new abbreviation to `GLOSSARY.md` in the same commit.
- Maintain the Triple Top Line (economy, ecology, equity) and the five capitals (natural, human, social, manufactured, financial) as analytical lenses. Flag any work that trades one capital against another and calls the result regenerative.
- Treat Indigenous and traditional ecological knowledge as first-class evidence where the corpus contains it, not as an appendix.
- Distinguish *unanswered* from *answered no*, throughout. An empty evidence cell means more work is needed, not that the answer is negative.
- Writing style: direct, specific, no filler. No "it is worth noting", no closing bullet summary that restates the section above it.


---
