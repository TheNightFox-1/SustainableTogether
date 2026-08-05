# Raw source registry

Layer 1. Immutable. The agent reads these and never edits them.

Every path is relative to the repository root
(`projects/incose-gfse-wg/SustainableTogether/`). Nothing was copied into this folder —
the registry points at the PDFs the WG already holds, so there is one copy of each source
and the wiki can always be re-derived from it.

`state`: `curated` = admitted to the corpus by a WG member · `ingested` = read, source page
written, dependent pages updated · `pending` = curated but not yet read.

| ID | Source | Path | State |
|---|---|---|---|
| R01 | Mang & Reed, *Regenerative Development and Design*, Encyclopedia of Sustainability Science & Technology, ch. 303 | `SustainableTogether Projects/Regeneration/00-foundations/EncylopediaSustainabilitySciencearticle.pdf` | ingested |
| R02 | *Regeneration Across Earth's Systems: A Comprehensive Solution Taxonomy* (WG review, 144 solutions) | `SustainableTogether Projects/Regeneration/00-foundations/Regeneration Across Earth's Systems_ A Comprehensive Solution Taxonomy.pdf` | ingested |
| R03 | Das & Bocken (2024), *Regenerative business strategies: A database and typology*, Sust. Prod. & Consumption 49:529–544 | `SustainableTogether Projects/Regeneration/01-theory-and-ontology/DasBocken2024Regenerativebusinessstrategies.pdf` | ingested |
| R04 | Upward & Jones (2015), *An Ontology for Strongly Sustainable Business Models*, Organization & Environment | `SustainableTogether Projects/Regeneration/01-theory-and-ontology/Jones_AnOntologyforStronglySustainable_2015.pdf` | ingested |
| R05 | Kulp, Remke, Cherraoui & Kickul (2026), *How to Transform Resource-Intensive Industries Toward Regenerative Business Models*, Bus. Strat. Env. | `SustainableTogether Projects/Regeneration/01-theory-and-ontology/Kulp2026_TransformingResourceIntensiveIndustries.pdf` | ingested |
| R06 | Roome & Louche (2015), *Journeying Toward Business Models for Sustainability*, Organization & Environment | `SustainableTogether Projects/Regeneration/01-theory-and-ontology/Journeying_Toward_Business_Models_for_Sustainabili.pdf` | pending |
| R07 | Schlüter et al. (2023), *Sustainable business model innovation: Design guidelines for integrating systems thinking principles*, J. Cleaner Prod. 387:135776 | `SustainableTogether Projects/Regeneration/01-theory-and-ontology/Sustainable business model innovation - Design guidelines for integrating.pdf` | ingested |
| R08 | Upward, *Flourishing Business Canvas v2.1 — Interactive Detailed Guide v3.0* | `SustainableTogether Projects/Regeneration/04-business-model/business-model/Flourishing-Business-Canvas-v2.1-Interactive-Detailed-Guide-v3.pdf` | ingested |
| R09 | Bornes (2025), *Systemic and concrete methods and tools to address environmental complexity and rebound effects* — SWS Ep. 01 | `SustainabilityWebinarSeries/SWS Ep 01 Laetitia Bornes - Systemic Approach for rebound-effects.pdf` | ingested |
| R10 | Wheatcraft (2025), *Defining Needs and Requirements for Sustainable Systems* — SWS Ep. 03 | `SustainabilityWebinarSeries/SWS - Ep 03 - Defining Needs and Requirements for SSlides.pdf` | ingested |
| R11 | Baue / r3.0 (2025), *Hacking Sustainability Standards to Achieve Authentic Sustainability* — SWS Ep. 04 | `SustainabilityWebinarSeries/SWS Ep 04 - Authentic Sustainability Slides.pdf` | ingested |
| R12 | Rich, Future-Fit Foundation (2026), *Future-Fit Business Benchmark — Introduction for INCOSE* | `SustainabilityWebinarSeries/20260225 Future-Fit Introduction for INCOSE.pdf` | ingested |
| R13 | Noy & McGuinness, *Ontology Development 101: A Guide to Creating Your First Ontology* | `SustainableTogether Projects/Regeneration/01-theory-and-ontology/Ontology Literature/ontology101.pdf` | pending |
| R14 | Seppälä, Ruttenberg & Smith, *Guidelines for writing definitions in ontologies* | `SustainableTogether Projects/Regeneration/01-theory-and-ontology/Ontology Literature/Guidelines for writing definitions in ontologies.pdf` | pending |

---

## Handling rules

Standing rules for whole classes of source. Applied by the agent at ingest; not defects.

- **R02** — a WG-produced review, not peer-reviewed literature. Every quantitative claim taken
  from it carries the primary reference it cites, not R02 alone.
- **R09, R10, R11, R12** — webinar slide decks. Slides carry claims without the argument that
  supports them. Pages citing these are capped at `in-review` until a WG member confirms the
  reading against the recording.

## Provenance notes

Anomalies in a source that the agent found and will not resolve on its own. Each one blocks
the publish gate for every page citing that source until a human clears it. Notes never modify
the source.

- **R01** — the PDF's own header prints the publication year as `2112`. Almost certainly a
  typo for 2012, but the agent does not silently correct a citation year. Needs a WG member to
  confirm against the encyclopedia record.
