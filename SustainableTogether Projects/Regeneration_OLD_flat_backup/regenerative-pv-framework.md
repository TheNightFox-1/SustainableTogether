# A Decision-Support Methodology for Designing Regenerative Photovoltaic Systems

**A generic, lifecycle-complete, scale-agnostic, engineer-facing framework**

---

*Author:* Hamza Bassam (oose eG, Hamburg) with Claude (Cowork session)
*Version:* 0.1 — first integrated draft
*Date:* April 2026
*Status:* Reference document. SysML v2 formalisation deferred to a subsequent pass; this version is methodology-only.

---

## Abstract

Photovoltaic (PV) systems are routinely framed as a "sustainable" technology — but reducing harm is not the same as regenerating value. This document specifies an eight-phase methodology for designing PV systems that move ecological, social, and economic capital into the positive across the full lifecycle. It draws together regenerative-design lineage (Lyle, Benyus, McDonough & Braungart, Mollison, Wahl, Mang & Reed, Raworth), Indigenous knowledge as first-class engineering input, the Cradle-to-Cradle Triple Top Line, the five recurring mechanisms identified in a prior 144-solution regeneration taxonomy (Bassam, 2026), and a PV-specific evidence base on agrivoltaics, recycling, EU regulation, perovskite end-of-life, net-positive case studies, IEA PVPS Task 12 LCA, pollinator-friendly solar, floating PV ecology, and community solar. Each phase is specified by purpose, intellectual ingredients, PV-specific application, mapped solutions, KPIs, engineering deliverables, and overclaiming pitfalls. The methodology is generic and scale-agnostic; it does not assume a particular PV technology, geography, or business model. A model-based systems-engineering layer (SysML v2 textual notation, openLCA hooks) is foreshadowed but not formalised here.

---

## Scope and audience

**Scope.** A *decision-support methodology* — that is, a structured way of asking and answering the right questions when designing a PV system, not a checklist of solutions and not a contract template. The methodology covers the full PV lifecycle from raw-material sourcing through design, manufacturing, transport, installation, operation, decommissioning, and material reincorporation, and addresses six forms of capital (natural, human, social, manufactured, financial, cultural). It is generic: it does not pre-commit to rooftop, ground-mount, agrivoltaic, floating, building-integrated, or off-grid configurations.

**Audience.** Engineers, system architects, MBSE practitioners, sustainability leads, public and cooperative project developers, and procurement teams. Familiarity with PV engineering is assumed; familiarity with regenerative-design literature is not.

**What this document is not.** It is not a worked example (no specific project is instantiated here). It is not an MBSE specification (SysML v2 is deferred). It is not a regulatory compliance checklist (although it identifies where regulatory pressure is sharpening). It is not a procurement standard. These are downstream artefacts that the methodology can support but does not replace.

## How to use this document

Read in order on first pass. Phases 1–3 set context, phases 4–6 design, phases 7–8 realise and learn. Each phase section is self-contained and ends with risks and overclaiming pitfalls drawn from the underlying evidence base. Tables and matrices are intended to be re-used as templates — copy them, instantiate them with site-specific data, and treat the result as a living artefact rather than a finished deliverable.

**Reading paths.**
- *Engineers and system architects:* read all phases; pay particular attention to Phase 4 (lifecycle × capital matrix) and Phase 6 (synthesis hooks).
- *Sustainability and ESG leads:* read Phases 1, 3, 7 and the foundations chapter; consult Phase 8 for MRV.
- *Public-sector and cooperative developers:* read Phases 2, 7, 8 and the energy-democracy material in §R9 of the dossier.
- *MBSE practitioners:* read all phases plus Phase 6 carefully, then plan the SysML v2 layer in a follow-on pass.

## Notation and conventions

- Capitals are denoted by their initial letters: **N** (natural), **H** (human), **S** (social), **M** (manufactured), **F** (financial), **C** (cultural).
- The eight PV lifecycle stages are denoted **L1–L8** (defined in §I.6 below).
- The five recurring regenerative mechanisms are denoted **M1–M5** (defined in §I.4).
- Solutions from the prior 144-solution taxonomy (Bassam, 2026) are referenced by their domain and number, e.g. *Solution 1.07 — keyline design*.
- Citations follow APA-7. DOIs are provided where they exist.
- Direct quotations are limited to ≤15 words; one quotation per source.
- SysML v2 textual notation is used only where syntactically necessary; this version contains none.

---

# Chapter I — Foundations

This chapter establishes the conceptual scaffolding that the eight phases sit on. It is deliberately compact: each foundational element is treated long enough to be operational, not exhaustive. Readers familiar with regenerative-design literature can skim §I.2 and §I.3.

## I.1 · From sustainable to regenerative

The conventional sustainability frame asks how much harm a project causes and how that harm can be reduced. The regenerative frame asks whether the project, considered across its full lifecycle and full social-ecological context, leaves the place healthier than it was before. Lyle (1994) made the distinction explicit: industrial systems are typically *degenerative* (they extract from natural and social capital faster than these regenerate); the regenerative alternative is one in which "the products and processes of human activity are designed to enhance, rather than degrade, ecological and social systems" (paraphrased from Lyle, 1994).

For PV, the practical consequence is that "low-carbon" is not sufficient. A PV plant can have an excellent climate-change footprint and still degrade local soils, displace ground-nesting birds, transfer wealth out of a community, and produce a hazardous-waste stream at end-of-life. The regenerative question is whether — and how — the same plant can be designed so that across all six capitals and all eight lifecycle stages, more value is created than consumed.

This is not a rhetorical move. It commits the designer to (a) a wider system boundary than ISO 14040/14044 typically draws, (b) explicit attention to social and cultural capital alongside natural capital, and (c) measurement of net-positive outcomes rather than only reduced negatives.

## I.2 · The lineage of regenerative design

The methodology draws on a coherent lineage of regenerative thinking that converges from biology, architecture, agriculture, economics, and systems science.

**Lyle (1994), *Regenerative Design for Sustainable Development*** introduced the term in landscape architecture, framing design as the embedding of human activity in the metabolic cycles of place. The book's twelve "strategies of regenerative design" — including aggregating not isolating, matching technology to need, prioritising information over energy, using nature as measure — translate to PV almost without modification.

**Benyus (1997), *Biomimicry*** added biological precedent as a design source: nature's 3.8-billion-year R&D record for low-temperature, water-based, locally-sourced, recyclable manufacturing. For PV this informs material choices (silver-thrifty cell architectures, lead-free perovskites), structural design (compliant trackers, biomimetic cooling), and end-of-life thinking (full-recovery rather than disposal).

**McDonough & Braungart (2002), *Cradle to Cradle*** made the operational distinction between *biological cycles* and *technical cycles*, argued for the elimination rather than the reduction of toxicants, and introduced the **Triple Top Line** (Economy + Ecology + Equity, all positive simultaneously). Their key contribution to PV thinking is that material-flow regeneration is non-negotiable: a module that cannot be reincorporated into either a biological or a high-quality technical cycle is, by their criterion, a design failure regardless of operational performance.

**Mollison (1988), *Permaculture: A Designer's Manual*** systematised the design of productive perennial polycultures around water, edge effects, multifunctional elements, and zone-based intensity. Permaculture's design ethic — earth care, people care, fair share — is concise enough to function as a regulative principle for PV siting and operation.

**Capra & Luisi (2014), *The Systems View of Life*** integrated complexity science, autopoiesis, and ecological economics into a single framework. The key methodological consequence is that any PV system is a node in nested networks of energy, material, water, biodiversity, knowledge, and value flows; design that ignores those nestings produces brittle outcomes.

**Mang & Reed (2012)** and the **Regenesis Group** developed *Story of Place*, a methodology for understanding the unique pattern of a bioregion before designing within it. Story of Place is the operational backbone of Phase 2 of this framework.

**Wahl (2016), *Designing Regenerative Cultures*** broadens the unit of design from the project to the culture: regenerative outcomes require regenerative practitioner communities, not just regenerative drawings. This shapes the practitioner posture in Phases 7 and 8.

**Raworth (2017), *Doughnut Economics*** offered a quantifiable diagnostic frame — operate above a social foundation, below an ecological ceiling — that is used in Phase 3 to localise the diagnosis to the project site.

**Stahel (2010), *The Performance Economy*** reframes ownership and value capture: selling performance (kWh delivered, hours of guaranteed service) rather than products (modules, inverters) realigns incentives across the lifecycle. This is the spine of Phase 7.

**Ostrom (1990), *Governing the Commons*** provides the institutional design principles (clear boundaries, congruent rules, collective choice, monitoring, graduated sanctions, conflict resolution, recognition of rights, nested enterprises) for community-owned PV — the operational counterpart to Phase 7's social-economy thread.

**Ellen MacArthur Foundation (2013)** consolidated the operational vocabulary of the circular economy (cascades, technical and biological cycles, performance models) — a vocabulary the Phase 5 solution-mapping inherits.

**IPBES (2019)** and the **Doughnut Economics Action Lab** localisation work supply the empirical backdrop: biodiversity decline, planetary-boundary breaches, and regional-scale social shortfalls that any "regenerative" PV claim has to be measured against rather than waved over.

**Indigenous knowledge systems** — pastoral, agroecological, hydrological, fire-ecological — are treated throughout this framework as *first-class engineering knowledge*, not as cultural appendix. The 144-solution taxonomy (Bassam, 2026) flags Domain 8 (Indigenous and traditional regenerative practices) as a primary source for Phase 5 selection. Three principles govern engagement: free, prior, and informed consent (FPIC); attribution and provenance; and Indigenous data sovereignty (CARE Principles for Indigenous Data Governance).

## I.3 · The Triple Top Line and the six capitals

The **Triple Top Line** (McDonough & Braungart, 2002) is the *guiding criterion* of regenerative design: a project succeeds when Economy, Ecology, and Equity all move positively, and fails when any one of them is traded against another. Triple Top Line replaces the "triple bottom line" of sustainability accounting, in which losses on one axis are deemed acceptable if compensated by gains on another. In a Triple Top Line frame, a PV project that cuts emissions but displaces ground-nesting birds while transferring landowner wealth to a foreign investor is not regenerative even if its CO₂ ledger balances.

To make Triple Top Line operational at engineering granularity, this framework decomposes Ecology, Equity, and Economy into **six forms of capital**, following the lineage from Forum for the Future and the Capitals Coalition:

| Symbol | Capital | Examples in the PV context |
|--------|---------|---------------------------|
| **N** | Natural | Soil organic carbon, biodiversity (pollinators, ground-nesting birds, soil biota), water (groundwater recharge, evaporation, runoff), atmospheric carbon, ecosystem services |
| **H** | Human | Operator and farmer skills, occupational health, training, knowledge in the workforce |
| **S** | Social | Community trust, governance capacity, conflict-resolution institutions, supplier networks |
| **M** | Manufactured | Modules, inverters, mounts, BoS components, infrastructure, recoverable material stocks |
| **F** | Financial | Cash flows, return on capital, equity participation, distribution of dividends |
| **C** | Cultural | Place-meaning, aesthetic and heritage values, languages and cultural practices interacting with the site |

Cultural capital is a deliberate addition; it is what is most often eroded silently when "sustainable" infrastructure overrides local meaning, and it is what the Story of Place methodology (Phase 2) is designed to surface.

The Triple Top Line is operationalised in this framework by requiring each phase deliverable to identify its expected effect on each of the six capitals, and Phase 8 to measure them.

## I.4 · The five recurring regenerative mechanisms

The 144-solution regeneration taxonomy (Bassam, 2026) identified five mechanisms that recur across domains and that are reliable indicators of regenerative action. They are diagnostic: a PV design that activates more of them is more likely to produce regenerative outcomes than one that activates fewer.

- **M1 · Loop closure** — material and energy outputs become inputs in the same system or in another. Examples in PV: closed-loop module recycling (Latunussa et al., 2016), reuse of decommissioned modules, on-site reuse of irrigation water on agrivoltaic plots, photovoltaic-thermal hybrid systems that recover waste heat.
- **M2 · Hydrological retention and slow release** — design that keeps water on or in the landscape longer. Examples in PV: ground-mount layouts that integrate keylines, swales, and infiltration trenches; agrivoltaic shade that reduces evapotranspiration; floating PV that suppresses evaporation under suitable conditions.
- **M3 · Photosynthetic carbon transfer to recalcitrant pools** — solar energy is captured biologically and routed into soil organic matter and woody biomass. Examples in PV: pollinator and species-rich understorey grassland, sheep grazing under elevated arrays, integration with hedgerows and agroforestry.
- **M4 · Biological self-organisation under managed disturbance** — the design sets boundary conditions and lets ecological processes do the work. Examples in PV: managed grazing rotations, mowing regimes timed to flowering and bird-nesting cycles, fire-resilient vegetation strips.
- **M5 · Co-evolutionary place-based design** — the design is specific to its bioregion and to the cultures inhabiting it, and it co-evolves with them. Examples in PV: site selection sensitive to migratory corridors and Indigenous land claims, governance arrangements that fit local cooperative traditions, technology choices matched to the local repair economy.

A regenerative PV design should activate at least three of M1–M5 explicitly. Activating only M1 and M2 (the "engineering-friendly" mechanisms) is a signal that the design has not yet engaged the biological, social, and cultural dimensions seriously.

## I.5 · The seven binding constraints

The taxonomy identified seven binding constraints that limit the credibility and scalability of any regenerative claim. They are the primary failure modes any framework has to address.

1. **Measurement, reporting, and verification (MRV) gaps.** Most regenerative claims are not measured at the granularity required to verify them. A regenerative PV methodology must specify which variables are measured, by whom, on what cadence, with what comparator.
2. **Coupled hydro-bio-geochemical modelling immaturity.** Soil-water-plant-atmosphere dynamics under PV arrays are still poorly modelled, especially for multi-year horizons.
3. **LCA rigor for "regenerative" claims.** Conventional attributional LCA is inadequate to capture biodiversity, soil-carbon, and social outcomes.
4. **Climate-trajectory feedback.** Many regenerative practices were calibrated under historical climate; their performance under projected trajectories is uncertain.
5. **Indigenous data sovereignty.** Where Indigenous knowledge informs design, governance must respect FPIC and CARE principles.
6. **Equity and gentrification risks.** Regenerative interventions can raise land values and displace existing communities — a known failure mode of "green" infrastructure.
7. **Governance pathways.** Regenerative outcomes typically require institutional arrangements (cooperatives, commons trusts, land partnerships) that conventional project finance does not naturally produce.

Each phase explicitly addresses how it engages with these constraints.

## I.6 · The eight PV lifecycle stages

The framework adopts the following eight-stage decomposition of the PV lifecycle. The stages align with IEA PVPS Task 12 LCA conventions (Frischknecht et al., 2020a) and with the WEEE/ESPR regulatory frame (European Parliament & Council, 2012, 2024).

| Symbol | Stage | Scope |
|--------|-------|-------|
| **L1** | Raw-material sourcing | Silica, silver, copper, aluminium, glass, polymer feedstocks; perovskite precursors; rare earths in some BoS components |
| **L2** | Cell, module, and BoS manufacturing | Wafer, cell, module assembly; inverter, mounting, cabling, monitoring electronics |
| **L3** | Distribution and transport | Container shipping, road haulage, packaging, last-mile logistics |
| **L4** | Site preparation and installation | Land grading, foundation, mounting structure, cabling, grid connection, civil works |
| **L5** | Operation and maintenance | Generation, monitoring, vegetation and water management, cleaning, repair, repowering |
| **L6** | Repair, repowering, and life extension | Component replacement, second-life modules, refurbishment, software updates |
| **L7** | Decommissioning | Disconnection, dismantling, transport to recycling or storage |
| **L8** | Material reincorporation | Recycling (mechanical, thermal, chemical), recovery, downcycling, waste disposal where unavoidable |

The methodology treats every stage as both a potential source of *degeneration* and a potential site of *regeneration*. The cross-cutting Phase 4 matrix (Chapter VI) tabulates this explicitly.

## I.7 · The eight-phase methodology at a glance

The methodology is grouped into three macro-phases. Each numbered phase is the subject of one chapter (Chapters III–X).

**A · Set context** — answer "what is this project for, where, and starting from what state?"
1. Frame ambition (Triple Top Line + six capitals)
2. Read the place (Story of Place)
3. Diagnose state (local Doughnut + ISO 14040/14044 baseline LCA)

**B · Design** — answer "what would regenerative look like here, and how do we engineer it?"
4. Map lifecycle (8 stages × 6 capitals → degeneration/regeneration matrix)
5. Pick solutions (populate matrix from the 144-solution catalogue using M1–M5)
6. Synthesize (formal artefact; SysML v2 hooks identified, formalisation deferred)

**C · Realise and learn** — answer "how is this paid for, governed, measured, and improved?"
7. Business model (Performance Economy, EMF archetypes, Taxonomy/CSRD, ReFi caution)
8. Implement and learn (citizen-grade MRV, adaptive management, living-lab posture, feedback to Phase 1)

The phases are sequential on first pass and iterative thereafter: Phase 8 feeds Phase 1 in subsequent project cycles, as well as during the same project.

---

# Chapter II — Phase 1 · Frame ambition

## II.1 Purpose

Phase 1 establishes *what regenerative outcome the project is committing to*, before any site work, technology choice, or business modelling. The deliverable is a written ambition statement — adopted by the project's decision-making body — that names, for each of the six capitals, whether the project intends to be neutral, degenerative-but-mitigated, restorative, or net-positive, and on what time horizon. The statement is the regulative reference for every subsequent phase: Phase 5 solution choices and Phase 8 measurement plans are accountable to it.

Without an explicit ambition, "regenerative" defaults to a marketing claim. The taxonomy's overclaiming critique (Bassam, 2026) is unambiguous: net-positive language has been applied to projects whose evidence base does not support it, and the principal cause is that the ambition was never made falsifiable.

## II.2 Intellectual ingredients

Phase 1 draws on:

- **Cradle-to-Cradle Triple Top Line** (McDonough & Braungart, 2002) — the regulative principle that Economy, Ecology, and Equity must all move positively. No trades.
- **Six-capitals framework** (Forum for the Future, Capitals Coalition) — the operational decomposition introduced in §I.3.
- **The four-level ambition ladder** (adapted from Reed, 2007 and Mang & Reed, 2012):
  1. *Conventional* — minimise harm to the legal limit
  2. *Sustainable* — meet or exceed best practice; net-zero on selected variables
  3. *Restorative* — actively repair past damage
  4. *Regenerative* — co-evolve with the place; net-positive across capitals
- **Theory of change reasoning** (carried in from impact-evaluation practice) — the project must articulate the causal pathway from intervention to capital movement.
- **CARE Principles for Indigenous Data Governance** where any Indigenous knowledge is in scope.

## II.3 PV-specific application

For PV projects, Phase 1 ambition is set against a baseline that is itself shifting: a 2026 ground-mount PV plant in Germany has substantially lower embodied carbon and higher recycled-content potential than one built in 2016, so "net-positive on Natural capital" must be defined relative to a current, not historical, reference.

The phase produces **per-capital ambition statements** of the form: "Across stages L1–L8, this project will achieve [conventional / sustainable / restorative / regenerative] performance on [N | H | S | M | F | C], measured by [primary indicator] against [reference] over [horizon]." The aggregation rule is Triple Top Line: at least one capital regenerative, no capital below restorative, and a written justification for any capital that is not at restorative or above.

A non-trivial PV-specific question is whether ambition is set per *site* or per *fleet*. A utility-scale developer building hundreds of MW per year will rationally set fleet-level ambitions (e.g. portfolio recycled-content thresholds), while a single-site community cooperative will set site-level ambitions. The framework supports both; the only requirement is that the chosen unit is named.

A second non-trivial question is the *time horizon*. PV plant lifetimes are 25–35 years; soil-carbon and biodiversity outcomes equilibrate on decadal timescales; cultural-capital effects can outlast the plant. Phase 1 ambition must specify horizons explicitly (e.g. "Natural-capital regenerative at year 10 measurement, sustained at year 25") because mismatched horizons are a documented source of overclaiming (Walston et al., 2018; Heath et al., 2020).

## II.4 Solutions catalogue mapped

Phase 1 does not select solutions; it sets the criterion against which Phase 5 selection will be made. The taxonomy domains it draws from in framing language are:

- Domain 7 (Socio-technical and systemic frameworks) — for the choice of regulative principle (Triple Top Line vs. weaker variants).
- Domain 10 (Social and cultural regeneration) — for the inclusion of cultural capital in the ambition statement.
- Domain 8 (Indigenous and traditional regenerative practices) — for FPIC and data-sovereignty commitments where applicable.

## II.5 Quantitative metrics and KPIs

Phase 1 produces **target KPIs per capital** that Phase 8 will measure. Indicative examples (these are templates, not prescriptions):

| Capital | Indicative target KPI | Reference / comparator |
|---------|----------------------|-----------------------|
| **N** — Natural | Soil organic carbon ΔSOC ≥ +0.4% pt at 30 cm by year 10; pollinator visit rate ≥ 1.5× adjacent arable; bird breeding-pair density ≥ regional median | Site-specific baseline (Phase 3); regional Doughnut |
| **H** — Human | ≥ X person-days of training in operation, monitoring, repair per MW per year; zero LTIFR | National OSH baseline |
| **S** — Social | Cooperative or community ownership share ≥ Y%; ≥ Z annual general-meeting participation rate | RED III REC criteria (European Parliament & Council, 2023) |
| **M** — Manufactured | Recycled content of major materials ≥ ESPR delegated-act threshold (when set); design-for-disassembly score ≥ specified rubric | ESPR (European Parliament & Council, 2024) |
| **F** — Financial | Local retention of revenue ≥ X%; dividend distribution within community subscriber base ≥ Y% | DGRV cooperative benchmarks (DGRV, 2023) |
| **C** — Cultural | Place-meaning indicators (qualitative) maintained or enhanced; heritage values not displaced | Story-of-Place baseline (Phase 2) |

The KPIs are deliberately heterogeneous — quantitative where rigorous quantification is possible, qualitative where it is not. The framework treats forced quantification as a failure mode (Strathern's "what gets measured, gets managed" inverted: what is forcibly quantified to be managed, is mismeasured).

## II.6 Engineering deliverables

Phase 1 produces a single artefact, the **Ambition Statement**, comprising:

1. Project unit (site / fleet / programme).
2. Six-capital target table (as in §II.5).
3. Time horizon per capital target.
4. Reference / comparator per capital target.
5. Triple Top Line aggregation justification (one paragraph per capital that is below restorative).
6. Governance commitments (FPIC, CARE, community engagement protocols where applicable).
7. Sign-off by the project's decision-making body.

The Ambition Statement is the input to all subsequent phases and is the primary anchor for the Phase 8 verification report.

## II.7 Risks and overclaiming pitfalls

- **Aspirational ambition without measurement plan.** "Net-positive biodiversity" without a measurement protocol is a marketing claim. Phase 1 must already commit to the Phase 8 MRV plan in outline.
- **Capital substitution by stealth.** A common failure is to claim Triple Top Line while accepting a below-restorative outcome on one capital because another is exemplary. The framework forbids this; written justification is required and reviewed in Phase 8.
- **Reference-class shifting.** Comparing to a 1990s baseline rather than current best practice inflates ambition apparent achievement (Heath et al., 2020). Use current, locally-relevant references.
- **Horizon mismatch.** Operational KPIs at year 1 reported as evidence for soil-carbon or biodiversity claims that take a decade to materialise (Walston et al., 2018; Blaydes et al., 2022).
- **FPIC as procedure rather than substance.** Indigenous consultation reduced to a checkbox is a known failure mode; the CARE principles require ongoing data-governance arrangements, not one-off sign-off.
- **Cultural-capital erasure.** "Cultural capital" can become a placeholder; Phase 1 must commit to surfacing it substantively in Phase 2.

---

# Chapter III — Phase 2 · Read the place

## III.1 Purpose

Phase 2 produces a structured, multi-disciplinary characterisation of the bioregion, watershed, biota, climate, cultural history, and Indigenous knowledge of the project site, sufficient to ground every later design decision in *this* place rather than a generic place. The deliverable is a **Story of Place dossier**.

Reading the place is not site assessment in the conventional sense (irradiation, shading, soil bearing capacity). Conventional site assessment treats the site as a slot for a generic technology; Story of Place treats the site as a unique pattern of relationships into which a technology must be inserted with care. The conventional assessment is still required — Phase 2 produces it as a sub-deliverable — but it is subordinated to the Story.

## III.2 Intellectual ingredients

- **Regenesis Group's Story of Place methodology** (Mang & Reed, 2012; Mang & Haggard, 2016). Story of Place identifies the *unique pattern of life* in a place — its geological foundation, watershed dynamics, biotic communities, human inhabitation history, and contemporary social-economic functioning — and articulates how new design can co-evolve with that pattern.
- **Bioregional mapping** (Sale, 1985; Berg & Dasmann, 1977). Watersheds, soil associations, ecoregions, and migratory corridors as the relevant unit of design rather than political jurisdictions.
- **Permaculture site analysis** (Mollison, 1988): zones of intensity, sectors of incoming energy/biota, slope and aspect, water flow patterns.
- **Indigenous knowledge protocols** — FPIC (UN Declaration on the Rights of Indigenous Peoples), CARE Principles (GIDA, 2019). In European contexts this includes Sámi, Roma, and other historically displaced communities whose land relationships persist.
- **Traditional Ecological Knowledge (TEK) literature** (Berkes, 2018) — to recognise that long-resident farming and pastoral communities also carry place-knowledge that is empirically validated through multi-generational practice.
- **Climate-trajectory localisation** — IPCC AR6 regional projections at watershed scale; Copernicus Climate Data Store for European sites.
- **Cultural landscape concepts** from UNESCO and from German *Heimat* and *Kulturlandschaft* traditions, where applicable.

## III.3 PV-specific application

Story of Place produces, for the project's bioregion and site, six pieces:

1. **Geological and hydrological foundation** — bedrock, soil associations, infiltration patterns, groundwater connectivity, surface-water network, flood and drought regimes. For PV this informs foundation design, water management, and risk to and from the array.
2. **Biotic communities and migration patterns** — flora and fauna present and historically present, ground-nesting bird populations (a sensitive issue for German solar parks), pollinator guilds, soil biota, migratory bird corridors, deer and wild-boar movement. For PV this constrains site footprint, fencing strategy, vegetation choice, and mowing/grazing regimes.
3. **Climate signature, current and projected** — irradiation, temperature, precipitation, hail and wind extremes, and the projected 2050/2080 envelope for the site. PV system performance and ecological compatibility both depend on this; agrivoltaic design that performs in 2026 may underperform in 2050 if crop suitability shifts.
4. **Human inhabitation history** — Indigenous and pre-modern occupation, agricultural history, industrial history, war legacies (relevant in many German sites), demographic trajectory, current land-use patterns. This surfaces what the site has meant and means.
5. **Indigenous and traditional knowledge present** — protocols for engagement, knowledge holders identified, FPIC arrangements established or planned, CARE-compliant data-handling agreements drafted.
6. **Socio-economic functioning of the bioregion** — employment patterns, energy poverty incidence, cooperative tradition, land-tenure structure, migration trends. Phase 7 business-model choices are constrained by what this section finds.

The dossier is produced collaboratively, not by the engineering team alone. Practitioners with biological, ecological, social-science, historical, and Indigenous-knowledge competencies are engaged. For small projects this can be a half-day workshop with a structured template; for utility-scale projects it is a multi-month engagement.

## III.4 Solutions catalogue mapped

Phase 2 does not select solutions but it identifies *which taxonomy domains will be in scope* for Phase 5. Typical mappings:

- Domain 1 (Biological / ecological regeneration) is in scope wherever Phase 2 finds soil, biodiversity, or watershed degradation.
- Domain 5 (Water systems regeneration) is in scope wherever Phase 2 finds altered hydrology — drainage, channelisation, groundwater stress, or flood risk.
- Domain 8 (Indigenous and traditional regenerative practices) is in scope wherever knowledge holders are identified.
- Domain 10 (Social and cultural regeneration) is in scope wherever Phase 2 finds cultural-landscape value, community fragmentation, or socio-economic stress.
- Domains 2, 3, 4 (Material / Energy / Built environment regeneration) are always in scope for PV but are scoped by the Phase 1 ambition.

Solutions from the prior taxonomy that are particularly relevant to the *reading* itself (rather than later selection) include *Solution 7.05 — community-based participatory research*, *Solution 7.11 — Indigenous-led co-design protocols*, and *Solution 8.01–8.04 — TEK-informed land assessment*.

## III.5 Quantitative metrics and KPIs

Phase 2 is largely qualitative. The primary KPI is *completeness of the dossier* against the six-piece template (§III.3). Quantitative inputs that the dossier records — irradiation maps, climate projections, baseline biotic surveys, soil tests — feed Phases 3–5.

Where rapid quantitative diagnostics are useful at this stage:
- **Bioregional integrity index** — proportion of the watershed in semi-natural land cover (data from Copernicus Land Monitoring Service for European sites).
- **Heritage and protected-area overlay** — Natura 2000, FFH, Ramsar, UNESCO designations within the watershed; cultural-landscape designations.
- **Cooperative / commons density** — count of active Energiegenossenschaften or equivalents in the region (DGRV, 2023, as a starting reference for German contexts).

## III.6 Engineering deliverables

Phase 2 produces:

1. The **Story of Place dossier** (§III.3 six-piece structure).
2. A **bioregional map** in GIS format with watershed, ecoregion, protected-area, and migratory-corridor layers.
3. A **stakeholder and knowledge-holder register** with engagement protocols.
4. A **conventional site-assessment report** — irradiation, shading, soil bearing, grid connection — produced as a sub-deliverable rather than as the primary output.
5. A **climate-projection memo** at site / watershed scale for 2050 and 2080 horizons (RCP/SSP scenarios as relevant).
6. A **CARE / FPIC compliance memo** if Indigenous or traditional knowledge is in scope.

The dossier is the input to Phase 3 (Doughnut diagnosis localisation) and Phase 4 (lifecycle-capital matrix population).

## III.7 Risks and overclaiming pitfalls

- **Story of Place reduced to a brochure section.** A common failure is to commission a glossy "place narrative" that is not subsequently used to constrain design. Phase 2 must produce material that Phases 4–5 can be falsified against.
- **Indigenous knowledge extracted without consent or attribution.** The taxonomy is unambiguous: this is not a regenerative project but a colonial extraction event, regardless of how green the modules are.
- **Bioregional definition gerrymandered to project boundary.** Watershed and ecoregion definitions follow biophysical, not parcel, lines.
- **Climate-projection naïveté.** Single-model projections at coarse resolution are routinely cited as if site-specific. The memo must record uncertainty and ensemble bounds.
- **Cultural-landscape concepts misappropriated.** German *Heimat* in particular has a politically loaded history; care is required to engage substantively rather than symbolically.
- **Site assessment substituted for Story.** Reverting to conventional irradiation-and-shading analysis defeats the phase's purpose.

---

# Chapter IV — Phase 3 · Diagnose state

## IV.1 Purpose

Phase 3 produces a *quantitative baseline* of the site and bioregion's current condition, against which the Phase 1 ambition will be measured. Two diagnostics are produced in parallel and reconciled:

- A **localised Doughnut diagnosis** — does this place currently sit within the safe and just space, and on which axes does it fall short or overshoot?
- A **baseline LCA of conventional PV at this site**, conducted to ISO 14040/14044 standards and IEA PVPS Task 12 methodology guidelines (Frischknecht et al., 2020a).

The first answers "what does the place need?", the second answers "what would a competently engineered but conventional PV plant cost the place?". The gap between the two is where regenerative design earns its keep.

## IV.2 Intellectual ingredients

- **Doughnut Economics** (Raworth, 2017) and the *Doughnut Economics Action Lab* localisation methodology (Fanning et al., 2022). The Doughnut frames a safe and just operating space bounded by a social foundation (twelve dimensions including health, education, housing, networks, energy, water, food, income, work, political voice, social equity, gender equality) and an ecological ceiling (nine planetary boundaries). The Action Lab's "City Portrait" methodology adapts the global Doughnut to local geographies; the same logic applies at watershed or municipality scale for PV.
- **ISO 14040 / 14044** — the international standard for LCA, including goal and scope definition, life cycle inventory, life cycle impact assessment, and interpretation.
- **IEA PVPS Task 12 methodology guidelines** (Frischknecht et al., 2020a) — the canonical PV-specific harmonisation of ISO 14040/14044, specifying functional unit, system boundary, allocation, and reporting categories.
- **Environmental Footprint (EF) 3.x** category set used in EU Product Environmental Footprint and EPD frameworks.
- **Social LCA scoping** — UNEP/SETAC Guidelines (UNEP, 2020), recognising that the social pillar is methodologically less mature than the environmental one (per IEA PVPS Task 12 acknowledgement, Frischknecht et al., 2020a).
- **Counterfactual reasoning** from impact evaluation — the baseline must specify the alternative against which "regenerative" will be assessed (continued conventional agriculture? continued grid power from the existing mix? abandonment?).

## IV.3 PV-specific application

The Doughnut diagnosis at site / watershed scale typically returns a pattern of overshoots and shortfalls. For a representative Northern German rural site, an indicative pattern might include: ecological ceiling overshoots on nitrogen flow, biodiversity, and freshwater withdrawal; social foundation shortfalls on energy access affordability, networks (rural depopulation), and political voice. The Phase 1 ambition is then read against this pattern: any capital target that does not at least neutralise a documented overshoot or shortfall is at risk of being decorative.

The baseline LCA covers the eight stages **L1–L8** for conventional PV at this site, using:

- **Functional unit:** 1 kWh AC delivered at the point of grid connection over the system lifetime (per Frischknecht et al., 2020a).
- **System lifetime:** 30 years for c-Si modules, 25 for inverters with one mid-life replacement, project-specific for BoS components.
- **System boundary:** cradle-to-grave including module manufacturing (geographically specific — EU vs. East Asia origin matters), BoS, transport, installation civil works, operation, decommissioning, and end-of-life processing per current Member State practice.
- **Impact categories:** climate change, cumulative energy demand, energy payback time, particulate matter, freshwater eutrophication, terrestrial ecotoxicity (relevant to perovskite if in scope), resource use (minerals and metals), land use, water use.
- **Geographical specificity:** site-specific irradiation and performance ratio; country-specific electricity mix for manufacturing electricity; site-specific land-use change (especially for ground-mount on agricultural or semi-natural land).

Where regenerative co-benefits will be claimed (soil carbon, biodiversity, water retention), Phase 3 must define the **measurement protocol** that will be used to substantiate them in Phase 8 — in advance of any intervention. Ex-post measurement without ex-ante baseline is uninterpretable (Walston et al., 2018; Blaydes et al., 2022).

## IV.4 Solutions catalogue mapped

Phase 3 itself is diagnostic; solutions are selected in Phase 5. The catalogue domains it draws on for *diagnostic instruments* are:

- Domain 7 — for the Doughnut localisation methodology and participatory diagnostic tools.
- Domain 1 — for ecological monitoring protocols (transects, eDNA, breeding-bird surveys) used in baseline biotic measurement.
- Domain 5 — for hydrological monitoring (piezometers, soil moisture probes, runoff measurement).

## IV.5 Quantitative metrics and KPIs

Phase 3 produces the **baseline values** for every KPI named in Phase 1, plus a set of standard PV-LCA indicators:

| Indicator | Unit | Source / method |
|-----------|------|-----------------|
| Climate change | kg CO₂-eq / kWh | IEA PVPS Task 12 LCA |
| Cumulative energy demand | MJ / kWh | IEA PVPS Task 12 LCA |
| Energy payback time | years | IEA PVPS Task 12 LCA |
| Particulate matter formation | disease incidence / kWh | EF 3.x |
| Freshwater eutrophication | kg P-eq / kWh | EF 3.x |
| Land occupation | m² · year / kWh | EF 3.x |
| Water consumption | m³ / kWh | EF 3.x |
| Soil organic carbon (baseline) | t C / ha at 30 cm depth | Site sampling, bulk-density-corrected |
| Pollinator visit rate (baseline) | visits / m² / hour | Standardised transect, by guild |
| Breeding-bird density (baseline) | pairs / 10 ha | Point-count or territory mapping |
| Local revenue retention (baseline) | % of regional energy spend retained | Regional input-output analysis |
| Energy-cooperative density (baseline) | members / 1000 inhabitants | DGRV (2023) for Germany |

Doughnut diagnosis outputs a categorical assessment per dimension (within / shortfall / overshoot / data gap) plus, where possible, a quantitative distance-to-target.

## IV.6 Engineering deliverables

Phase 3 produces:

1. **Local Doughnut report** — twelve social-foundation indicators and nine ecological-ceiling indicators at watershed or municipality scale, with data sources and uncertainty notes.
2. **Baseline LCA report** — ISO 14040/14044 / IEA PVPS Task 12 conformant; explicit functional unit, system boundary, allocation choices, and uncertainty.
3. **Baseline ecological / social monitoring data** — soil samples, pollinator transects, bird counts, hydrological measurements, household-survey or focus-group records, time-stamped and reproducible.
4. **Counterfactual specification** — the named alternative scenarios against which the project will be evaluated (status quo, conventional PV, abandonment, alternative regenerative interventions).
5. **Phase 1 ambition reconciliation note** — confirming or revising the Phase 1 ambition in light of the diagnosis.

## IV.7 Risks and overclaiming pitfalls

- **LCA boundary cherry-picking.** Excluding inverter replacements, civil works, or end-of-life from the boundary inflates apparent performance. Task 12 guidelines (Frischknecht et al., 2020a) make these inclusions mandatory; many marketing-grade LCAs still omit them.
- **Mass-balance "circularity" reported as net benefit.** A 95% mass-recovery figure that hides downcycling of glass to insulation is not a regenerative outcome (Heath et al., 2020; Latunussa et al., 2016). Phase 3 must record material *quality* alongside mass.
- **Spatial scale mismatch in Doughnut diagnosis.** Applying global planetary-boundary headroom to a site-level claim is meaningless. Use bioregional and watershed-scale instances.
- **Baseline drift.** "Conventional PV" is a moving target; the baseline must be dated and locked.
- **Social LCA reduced to head-counts.** Indicators like "jobs created" without distributional analysis recapitulate the failure modes the energy-democracy literature documents (Heeter et al., 2021).
- **Missing counterfactual.** "We saved X tonnes of CO₂" without naming what would have happened otherwise is a frequent overclaim. The counterfactual is part of the deliverable.
- **Ex-post claims without ex-ante baseline.** Pollinator and soil-carbon claims require pre-installation measurement. If this is not done in Phase 3, claims in Phase 8 are not falsifiable.

---

# Chapter V — Phase 4 · Map lifecycle

## V.1 Purpose

Phase 4 produces the structural spine of the methodology: a **degeneration / regeneration matrix** that maps each of the eight PV lifecycle stages (L1–L8) against each of the six capitals (N, H, S, M, F, C). For every cell, two entries are produced:

- The *degeneration vector* — what conventional PV at this site, in this stage, takes from this capital.
- The *regeneration vector* — what regenerative design at this site, in this stage, can give back to this capital.

The matrix is the artefact that Phase 5 populates with specific solutions and that Phase 8 verifies against. It is generic in this chapter (one populated template); Phase 5 instantiates it with project-specific solutions and quantities.

## V.2 Intellectual ingredients

- **Lifecycle thinking** (ISO 14040/14044; Frischknecht et al., 2020a) — the eight-stage decomposition introduced in §I.6.
- **Six-capitals framework** — introduced in §I.3.
- **Five recurring mechanisms** (M1–M5) — introduced in §I.4. The matrix entries name which mechanisms each regeneration vector activates.
- **Cradle-to-Cradle technical and biological cycles** (McDonough & Braungart, 2002) — the operational vocabulary for L8 (material reincorporation).
- **Material flow analysis** (MFA) and **substance flow analysis** (SFA) — for tracking specific elements (silver, lead, fluoropolymers).
- **Capitals Coalition Natural and Social Capital Protocols** — for the methodology of attributing changes in capital stocks to project actions.

## V.3 PV-specific application — the populated matrix

The following matrix is a **generic populated template**. Cell entries are illustrative — drawn from the regeneration taxonomy (Bassam, 2026) and the Stage 1 research dossier — and would be replaced or refined with project-specific entries in Phase 5. Each cell lists the degeneration vector first, then the regeneration vector with the activated mechanism(s) in brackets.

### V.3.1 — Stage L1 · Raw-material sourcing

| Capital | Degeneration vector | Regeneration vector |
|---------|--------------------|---------------------|
| **N** | Open-pit silica and quartz mining; bauxite extraction with red-mud waste; silver mining with cyanide and mercury legacy; copper mining water and tailings impacts | Recycled-content sourcing from L8 streams (M1); responsible mining certification (IRMA, ASI Aluminium); silver-thrifty cell architectures; supplier ecological-restoration commitments (M3) |
| **H** | OSH risks in mining (silicosis, heavy metals); child-labour risk in some Cu/Co/mica supply chains | Living-wage and OSH-compliant supplier audits; workforce skill-building partnerships; Indigenous-rights compliance in supply chain |
| **S** | Conflict-mineral risk; community displacement at mine sites; lack of FPIC | OECD Due Diligence Guidance compliance; community-benefit-sharing agreements; FPIC-verified sourcing (M5) |
| **M** | Linear extraction, no take-back relationship | Bilateral take-back contracts with suppliers; recycled-content thresholds in procurement (M1) |
| **F** | Value flows to mining and refining centres; project location captures none | Procurement preference for suppliers with circularity commitments; financial mechanisms tied to recycled content |
| **C** | Erosion of place-meaning at mining-affected sites (rarely visible to PV buyer) | Acknowledgement of upstream cultural impacts; transparency reporting; preference for suppliers with cultural-heritage commitments |

### V.3.2 — Stage L2 · Cell, module, and BoS manufacturing

| Capital | Degeneration vector | Regeneration vector |
|---------|--------------------|---------------------|
| **N** | High-electricity manufacturing in fossil-heavy grids; PFAS in encapsulants and back-sheets; perovskite Pb load if in scope | Manufacturing in low-carbon-grid jurisdictions; PFAS-free encapsulants; Pb-binding encapsulation for perovskite (Li et al., 2020) where unavoidable; closed-loop process water |
| **H** | Clean-room and chemical-handling OSH risks | Best-practice OSH; investment in worker training; transparent chemical disclosures |
| **S** | Concentration in geopolitical chokepoints | Diversified supplier base; regional manufacturing where viable; cooperative ownership of mid-tier suppliers |
| **M** | Modules designed for 25-year disposal | Design-for-disassembly; reversible adhesives; Digital Product Passport readiness (ESPR); standardised module dimensions for second-life (M1) |
| **F** | Value capture in manufacturing centres | Manufacturer take-back warranties; second-life buy-back contracts |
| **C** | — | Manufacturer transparency about origins; place-of-manufacture labelling |

### V.3.3 — Stage L3 · Distribution and transport

| Capital | Degeneration vector | Regeneration vector |
|---------|--------------------|---------------------|
| **N** | Container-shipping fuel emissions; road-haulage particulate; packaging waste | Rail and short-sea shipping preference; reusable pallets and crates (M1); biodegradable packaging |
| **H** | Logistics-worker conditions, including subcontractor cascades | Fair-haulage clauses; maritime-labour-convention compliance |
| **S** | Logistics opacity | Open route and emissions disclosure |
| **M** | Single-use packaging | Reusable, returnable packaging systems |
| **F** | — | — |
| **C** | — | — |

### V.3.4 — Stage L4 · Site preparation and installation

| Capital | Degeneration vector | Regeneration vector |
|---------|--------------------|---------------------|
| **N** | Land grading destroys soil structure and seed bank; concrete foundations sterile and lossy; cabling trenches break root networks; biodiversity loss from clearance | Driven piles or screw-piles in lieu of concrete (M1); minimal grading; preserved hedgerows and tree lines; topsoil stockpiling with re-seeding (M3); hydrological retention features (swales, infiltration trenches) integrated at L4 (M2); design-with-disturbance vegetation establishment (M4) |
| **H** | Construction-worker injury risk | Standard OSH plus regenerative-construction training |
| **S** | Community disruption during construction | Community liaison; local labour preference; school/visitor engagement during construction |
| **M** | Site infrastructure built once, demolished at L7 | Modular, reversible foundations and structures (M1); shared cabling that can outlast modules |
| **F** | Construction value flows to non-local contractors | Local-contractor preference; cooperative construction firms; apprentice training |
| **C** | Visual and aesthetic disruption of cultural landscape | Co-design with landscape architects and local stakeholders; sightline preservation; integration with traditional land patterns (M5) |

### V.3.5 — Stage L5 · Operation and maintenance

| Capital | Degeneration vector | Regeneration vector |
|---------|--------------------|---------------------|
| **N** | Mowed monoculture turf; herbicide use; impermeable surfaces under arrays; light-spectrum effects on biota; bird collisions and panel-as-water mistake | Pollinator-friendly seed mixes (Walston et al., 2018; Blaydes et al., 2022); managed grazing — sheep are well-evidenced (M3, M4); rotational mowing aligned with breeding cycles; agrivoltaic crop production where Phase 2 supports it (M3, M4); co-located hedgerow networks; pond and swale features (M2) |
| **H** | O&M crew skills as commodities | Long-term, high-skill employment for site stewardship; cross-skilled grazier-electricians; school and university field-teaching arrangements |
| **S** | Site as private operational asset | Visitor and education programmes; community-board governance of site management |
| **M** | Reactive maintenance; spare-parts not stockpiled | Predictive maintenance; spare-parts pools shared across community sites; local repair workshops |
| **F** | Revenue extraction by external owner | Cooperative ownership; benefit-sharing with neighbouring farms (grazing fees, crop revenue); local-tax retention |
| **C** | Site as anonymous infrastructure | Site as place of meaning — naming, signage, festivals, walking-trail integration (M5) |

### V.3.6 — Stage L6 · Repair, repowering, and life extension

| Capital | Degeneration vector | Regeneration vector |
|---------|--------------------|---------------------|
| **N** | Premature replacement multiplies upstream impacts | Component-level repair before module replacement; second-life modules in lower-grade applications (M1) |
| **H** | Specialised repair skills concentrated in OEM channels | Independent repair training; right-to-repair tooling; certification of community repair workshops |
| **S** | Repair monopoly by OEM | Open repair documentation; cooperative repair networks |
| **M** | Modules retired on age, not condition | Condition-based decisions; repowering with higher-efficiency modules; reuse of mounting structures and BoS (M1) |
| **F** | Repowering treated as new capital event, no reuse credit | Financial accounting that credits avoided manufacturing |
| **C** | — | Long-life infrastructure becomes part of cultural landscape |

### V.3.7 — Stage L7 · Decommissioning

| Capital | Degeneration vector | Regeneration vector |
|---------|--------------------|---------------------|
| **N** | Soil compaction from heavy equipment; hazardous-waste leaching during dismantling | Reversible installation paid off at L7 by light-disturbance dismantling; site rehabilitation plan executed; soil and biota baseline re-measured (M3) |
| **H** | Dismantling-worker exposure to legacy materials (perovskite Pb, fluoropolymers) | Best-practice OSH; legacy-material handling protocols |
| **S** | Site abandoned or fenced indefinitely | Defined post-decommissioning land use (often agricultural restoration or rewilding) determined in Phase 1 |
| **M** | Modules to landfill or downcycling | Modules routed to FRELP / ROSI / Veolia high-value recycling streams (Latunussa et al., 2016; Heath et al., 2020); BoS recovered |
| **F** | Decommissioning under-funded | Decommissioning bond established at Phase 1; covered by Performance-Economy contract (Phase 7) |
| **C** | Post-decommissioning land returned to community | Land returned with documented improvements in N and S; transition celebrated |

### V.3.8 — Stage L8 · Material reincorporation

| Capital | Degeneration vector | Regeneration vector |
|---------|--------------------|---------------------|
| **N** | Mass-balance recycling that downcycles glass and loses Si and Ag (Heath et al., 2020); leaching of perovskite Pb if mishandled | High-value recovery routes (FRELP, ROSI) for Si, Ag, Cu (Latunussa et al., 2016); Pb sequestration for perovskite (Li et al., 2020); float-quality glass recovery; closed reagent loops in chemical processes (M1) |
| **H** | Recycling-worker exposure | OSH-compliant recycling facilities; training and certification |
| **S** | Recycling sector treated as waste handler | Recycling cooperatives; transparency on recovery quality; community-monitor access |
| **M** | Materials lost from technical cycle | Materials returned to L1 of next-generation modules (M1); WEEE-compliant collection and reporting |
| **F** | Recycling cost externalised | Producer-responsibility financing; performance-contract amortisation |
| **C** | Recycling invisible to original community | Annual end-of-life reporting back to community |

### V.4 Reading the matrix

Three readings are routinely useful:

- **Stage-wise reading** (a column of the matrix per stage) — exposes how impacts and opportunities concentrate at particular stages. L4 (installation) and L5 (operation) typically carry the largest regeneration potential per capital; L1 (sourcing) and L2 (manufacturing) typically carry the largest degeneration vectors.
- **Capital-wise reading** (a row of the matrix per capital) — exposes whether the project's regenerative ambition for that capital is concentrated in one stage or distributed.
- **Mechanism-wise reading** — counting how often M1–M5 appear across the matrix reveals whether the design is genuinely activating multiple mechanisms or relying on one (typically M1).

A regenerative PV design will typically show: at least one regeneration vector per cell that is named in Phase 1; M1 active across L1, L2, L6, L8; M2–M4 active across L4, L5; M5 active across L4, L5, L7. If a row of the matrix has empty regeneration cells, Phase 1 ambition for that capital is at risk.

## V.5 Solutions catalogue mapped

The matrix template above is populated using solutions from across the 144-solution taxonomy, with concentrations as follows:

- **L1 · sourcing** — Domain 2 (Material / circular-economy regeneration) primarily; Domain 7 (governance) for FPIC supplier compliance.
- **L2 · manufacturing** — Domain 2; Domain 3 (Energy regeneration and recovery) for low-carbon manufacturing electricity.
- **L3 · distribution** — Domain 2; Domain 4 (Built environment and infrastructure) for logistics infrastructure.
- **L4 · site preparation** — Domain 1 (Biological / ecological regeneration); Domain 5 (Water systems regeneration); Domain 4.
- **L5 · operation** — Domain 1; Domain 5; Domain 8 (Indigenous and traditional regenerative practices) for managed grazing and rotational practices; Domain 9 (Bio-inspired / biomimetic technologies); Domain 10 (Social and cultural regeneration).
- **L6 · repair** — Domain 2; Domain 7 (Socio-technical and systemic frameworks).
- **L7 · decommissioning** — Domain 2; Domain 1.
- **L8 · reincorporation** — Domain 2 primarily; Domain 7 for governance of the recovery sector.

The Appendix indexes individual taxonomy solutions to specific cells.

## V.6 Quantitative metrics and KPIs

Each populated cell carries a **target delta** — the magnitude of capital movement the regeneration vector intends to produce. Phase 4 records targets as paired baseline/target values:

| Cell | Indicator | Baseline | Target | Reference |
|------|-----------|----------|--------|-----------|
| L1·N | Recycled silver content | < 1% | ≥ 30% by 2030 | ESPR DPP threshold (forthcoming) |
| L4·N | Soil organic carbon at 30 cm | site value | +0.4% pt at year 10 | Phase 3 baseline |
| L4·N | Hydrological retention | site value | +X mm runoff reduction | Site model |
| L5·N | Pollinator visit rate | site value | +50% vs. adjacent arable | Phase 3 baseline; Walston et al. (2018) for plausibility check |
| L5·N | Breeding-bird density | site value | ≥ regional median maintained | Phase 3 baseline |
| L5·F | Local revenue retention | regional value | ≥ X% target | DGRV (2023) reference for Germany |
| L8·M | Material-quality recovery | bulk-recycling baseline | float-quality glass + wafer-grade Si + recovered Ag | Heath et al. (2020); Latunussa et al. (2016) |

This is illustrative; project-specific targets are set in Phase 5.

## V.7 Engineering deliverables

Phase 4 produces:

1. The **populated 8 × 6 matrix** for the project, with a degeneration and a regeneration vector in every cell, mechanisms named per cell, and target deltas where quantified.
2. A **mechanism activation map** (count of M1–M5 by stage) demonstrating that at least three mechanisms are non-trivially activated.
3. A **gap log** identifying cells where regeneration vectors could not be specified — these are honest acknowledgements, not silent omissions.
4. **Crosswalk to ESPR / WEEE / EU Taxonomy criteria** showing how each regenerative target relates to the regulatory pipeline (European Parliament & Council, 2012, 2024; European Commission, 2021).

## V.8 Risks and overclaiming pitfalls

- **Matrix as paperwork.** The matrix becomes a compliance artefact rather than a design tool if it is filled in retrospectively rather than driving Phase 5 selection.
- **M1-only designs branded as regenerative.** Closing material loops is necessary but not sufficient. A design that activates only M1 is a circular-economy design, not a regenerative one.
- **Empty cells silently treated as neutral.** The framework requires gap acknowledgement; silence is degeneration by default.
- **Quantitative targets without baselines.** Phase 4 targets must be paired with Phase 3 baselines.
- **Stage substitution.** Strong regenerative performance at L5 used to justify weak performance at L1–L2 (e.g. spectacular biodiversity outcomes from modules manufactured in coal-grid facilities with poor labour conditions). This violates Triple Top Line at the lifecycle scale.
- **Boundary creep.** Adding upstream regenerative features (e.g. supplier ecological restoration) without auditable verification — a frequent overclaim in voluntary-sustainability schemes.

> **Visual reference.** The diagram `diagrams/lifecycle-capital-matrix.drawio` renders this matrix as a populated grid suitable for project use. Cells are colour-coded — degeneration (red) above, regeneration (green) below — with mechanism tags inline.

---

# Chapter VI — Phase 5 · Pick solutions

## VI.1 Purpose

Phase 5 populates the matrix produced in Phase 4 with concrete *solutions* drawn from the 144-solution regeneration taxonomy (Bassam, 2026), and supplemented by the PV-specific evidence in the research dossier. The deliverable is a **solution-instantiated matrix** in which every regeneration cell names one or more taxonomy solutions, with evidence references, mechanism tags, and target deltas.

This is the first phase in which the methodology becomes prescriptive about *what* will be built. Up to this point, the work has been ambition, place, diagnosis, and structure. From this point, the work is design choice.

## VI.2 Intellectual ingredients

- **The 144-solution taxonomy** (Bassam, 2026) — the primary catalogue.
- **The five recurring mechanisms** (M1–M5) — the selection filter: each chosen solution must visibly activate one or more.
- **Ellen MacArthur Foundation circular-economy archetypes** (EMF, 2013) — performance models, sharing platforms, product-as-service, end-of-life management — used as a parallel typology.
- **Indigenous knowledge systems** (Domain 8 of the taxonomy) — surfaced as first-class engineering options under FPIC and CARE governance.
- **PV-specific evidence base** (Stage 1 dossier) — agrivoltaics, recycling, regulation, perovskite EOL, net-positive cases, IEA PVPS Task 12, pollinator-friendly solar, floating-PV ecology, community solar.
- **Engineering selection heuristics**: technology-readiness level, climate-trajectory robustness, repairability, reversibility, governance fit.

## VI.3 PV-specific application

Solutions are selected against *each filled cell* of the Phase 4 matrix. The selection process is iterative and constrained:

1. **Filter by ambition.** Discard solutions that cannot move the targeted capital to the targeted level on the targeted horizon.
2. **Filter by place.** Discard solutions that conflict with the Story of Place dossier (Phase 2). Examples: deep-rooted nitrogen-fixing trees on a karst aquifer with shallow soils; Sn-based perovskites where high humidity accelerates degradation; community-ownership models where no cooperative tradition exists locally.
3. **Filter by mechanism.** For each cell, prefer solutions that activate at least one M1–M5; for each *capital row*, ensure the activated mechanisms across L1–L8 collectively cover at least three of M1–M5.
4. **Filter by evidence quality.** Prefer solutions with peer-reviewed quantitative evidence over those with only modelling or industry assertion. Where evidence is weak, treat the choice as an experiment and commit to the Phase 8 measurement that would falsify it.
5. **Filter by climate-trajectory robustness.** Ask: does this solution still work under the 2050/2080 envelope from Phase 2? Permaculture and pollinator schemes calibrated to historical climate may need contingency plans (Hailegnaw et al., 2015 illustrates how rapidly material questions shift; the same logic applies ecologically).
6. **Filter by reversibility and repairability.** Prefer solutions that fail safely, can be repaired locally, and can be reversed if the experiment fails.

For PV the high-leverage cells — by frequency of regenerative-design wins in the literature — tend to be **L4·N**, **L5·N**, **L7·M**, **L8·M**, **L5·F**, and **L5·S**. A project that gets these six right is doing most of the regenerative work; this is a useful prioritisation heuristic when resources are limited.

## VI.4 Solutions catalogue mapped — illustrative selections

The following table is a *non-exhaustive* illustration. The Appendix indexes specific taxonomy solutions to cells; this table shows how a typical project would select.

| Cell | Candidate solutions (taxonomy + dossier) | Mechanism tags | Evidence quality |
|------|------------------------------------------|----------------|------------------|
| **L4·N** | Driven/screw-pile foundations · keylines and swales · topsoil stockpiling and re-seeding with native mix · hedgerow and tree-line preservation | M1, M2, M3 | High for swale infiltration; medium for native re-seed establishment under PV |
| **L5·N** | Pollinator seed mixes (Walston et al., 2018; Blaydes et al., 2022) · sheep grazing under elevated arrays · agrivoltaic crop production where Phase 2 supports it (Trommsdorff et al., 2021; Barron-Gafford et al., 2019) · pond and wet-feature integration | M2, M3, M4 | High for pollinator visit gain in temperate sites; medium for soil-carbon; mixed for agrivoltaic yield by crop |
| **L5·F** | Energy cooperative structure (Wierling et al., 2018; DGRV, 2023) · neighbouring-farm benefit-sharing · local-tax retention · Renewable Energy Community legal form (RED III) | (institutional) | High for cooperative formation; medium for distributional outcomes |
| **L5·S** | Cooperative governance (Ostrom, 1990 design principles) · visitor and education programme · open monitoring data · community-board oversight | (institutional) | High procedurally; medium on equity |
| **L7·M** | Decommissioning routed to FRELP-class facility (Latunussa et al., 2016) · BoS recovery · soil/biota re-measurement · land returned with documented improvement | M1 | High for high-value-recycling potential at pilot scale; medium for operational throughput |
| **L8·M** | High-value glass + Si + Ag recovery (Heath et al., 2020) · perovskite Pb sequestration at EOL (Li et al., 2020; Chen et al., 2021) at TRL 3–4 — flag as experimental · WEEE Annex IV compliance | M1 | High for c-Si pathway; low TRL for perovskite — treat as research, not infrastructure |
| **L1·M** | Recycled-content silver and silicon (when ESPR thresholds set) · IRMA / ASI-certified primary materials · supplier take-back contracts | M1 | Medium — supplier verification quality varies |
| **L1·S** | OECD Due Diligence for conflict minerals · FPIC-verified sourcing where Indigenous lands are upstream | M5 | High procedurally |
| **L4·C** | Co-design workshops with neighbouring communities · sightline preservation · integration with traditional Kulturlandschaft elements | M5 | Qualitative; verified through Story of Place |

## VI.5 Quantitative metrics and KPIs

Each selected solution is bound to **a target delta** (set in Phase 4) and a **measurement protocol** (defined in Phase 8). Phase 5 ensures the chain — solution → mechanism → target delta → measurement protocol — is unbroken.

Indicative selection-quality metrics for the matrix as a whole:

- **Coverage.** Proportion of populated regeneration cells that have at least one specific solution selected. Target ≥ 80% for cells flagged as priority in Phase 1.
- **Mechanism diversity.** Number of distinct M1–M5 mechanisms activated across the matrix. Target ≥ 3.
- **Evidence-quality distribution.** Proportion of selected solutions with peer-reviewed quantitative evidence vs. modelled vs. industry-asserted. Target: > 50% peer-reviewed quantitative for high-priority cells; experimental solutions explicitly tagged.
- **Reversibility index.** Proportion of selected solutions that can be reversed if Phase 8 monitoring shows underperformance.

## VI.6 Engineering deliverables

Phase 5 produces:

1. The **solution-instantiated matrix** — Phase 4 matrix with each cell populated with named taxonomy solutions (e.g. *Solution 1.07 — keyline design*) and dossier references (e.g. Walston et al., 2018), mechanism tags, and target deltas.
2. A **risk register** — for each experimental solution, the failure mode that monitoring will catch, the trigger threshold, and the contingency.
3. An **Indigenous-knowledge attribution memo** if any Domain-8 practices are selected.
4. A **technology-portfolio summary** — modules, inverters, mounting, BoS, vegetation, fencing, water features, monitoring instrumentation — structured for procurement input.

## VI.7 Risks and overclaiming pitfalls

- **Solution stacking without site fit.** Listing every plausible regenerative practice in a glossy report and then implementing none of them well. Phase 5 must commit to a specific, executable selection.
- **Mechanism tagging without mechanism evidence.** Tagging a vegetated buffer "M3 photosynthetic carbon transfer" without measuring soil carbon converts a mechanism into branding.
- **Indigenous knowledge stripped of governance.** Adopting a TEK practice without the relationship and consent that produced it.
- **Silver-bullet bias toward agrivoltaics.** Agrivoltaics is well-evidenced for selected crops/climates (Barron-Gafford et al., 2019; Trommsdorff et al., 2021; Weselek et al., 2019) and over-claimed for many others; the LER framing in particular blends electricity and food yields in ways that can mislead.
- **Perovskite optimism.** Perovskite/tandem solutions remain at low TRL for circular EOL (Hailegnaw et al., 2015; Moody et al., 2020); selecting them in Phase 5 commits the project to research-grade, not infrastructure-grade, performance.
- **Floating PV "evaporation savings" extrapolation.** Suppression figures of 30–70% from arid-zone reservoirs do not transfer to temperate windy lakes (Exley et al., 2021, 2022).
- **Cooperative-form-over-substance.** Forming a cooperative without designing for distributional outcomes (Wierling et al., 2018; Heeter et al., 2021).
- **Closed-loop-by-mass.** Selecting recycling pathways on mass-balance figures while losing material *quality* (Heath et al., 2020).

---
