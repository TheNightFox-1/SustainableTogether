# CLAUDE.md — SustainableTogether Approach

This file provides guidance to Claude Code when assisting with the **SustainableTogether** project planning, execution, and coordination.

## Purpose

The SustainableTogether initiative is an **INCOSE Sustainability Working Group platform** that explores how systems engineering (MBSE, lifecycle thinking, circular economy) transforms conventional enterprises into sustainable ones—using **SolarX → SustainaSun** as the pilot case study.

This workspace documents:
1. The **holistic sustainability transformation framework** (Generic Approach diagram)
2. The **WG Leadership Tracker** organizing 18 task groups across strategic, technical, community, and outreach domains
3. The **3-milestone roadmap** (SolarX AS-IS → SustainaSun v1 → DPP Integration)
4. The **contribution workflow** that allows any WG member to pick up an issue and contribute

## Context: Generic Approach Framework

The **Initial Generic Approach diagram** lays out a complete **sustainability transformation journey** with 8 strategic layers:

```
Strategic & Conceptual Foundations
├── Standards / Regulations (EU ESPR, DPP)
├── Mission & Vision (Eco-Effectiveness)
└── Design for Sustainable Behavior

Product & Industrial Foundations
├── Business Model (PaaS, Circular Economy)
├── Enterprise Architecture / SoS
├── Product Development
└── Enabling Systems

Industrialization & Production
├── Production (Manufacturing at scale)
├── Supply Chain (Logistics, sourcing)
└── Life Cycle Operation (Durability, maintenance)

Operation / Service
├── Product Use (Customer phase)
├── R-Strategies (Refuse → Recover)
└── Biological Cycle (Closed loops)

Retirement
└── Goal: Eliminate waste (not landfill)
```

**Holistic topics** span all layers:
- Systems Thinking & System Dynamics (Rebound Effect)
- Digital Engineering (MBSE, digital twins, simulation)
- Life Cycle Assessment (LCA integration)
- Risk Analysis (environmental, social, regulatory, supply chain)

## Context: WG Leadership Tracker

The **WG Leadership Tracker** organizes **18 task groups** across 4 categories:

### Category 1: SustainableTogether (Core Technical Workstreams)

| # | Task | Lead | Co-Lead | Status | Focus |
|---|------|------|---------|--------|-------|
| 1 | Systems Thinking / System Dynamics | Ivan | Jorge | **Active** | Frameworks, case studies, system dynamics linking to sustainability outcomes |
| 2 | Life Cycle Assessment (LCA) | Hamza | — | **Open** | Integrate LCA into SE, ISO 14040/44 guidance, worked examples |
| 3 | Literature Review | — | — | **Open** | Systematic review, annotated bibliography, synthesis |
| 4 | Business Models | — | — | **Open** | Circular economy, PaaS, archetypes, SE guidance |
| 5 | Digital Engineering | — | — | **Open** | MBSE, digital twins, simulation for sustainability |
| 6 | Sustainability Requirements | Lou | Ali B. | **Active** | Requirement templates, taxonomies, verification/validation |
| 13 | GitHub Management | — | — | **Open** | Repo structure, contribution guidelines, access, PRs |
| 14 | Enterprise Architecture | — | — | **Open** | UAF/TOGAF/DoDAF for sustainability embedding |
| 15 | Enabling Systems | — | — | **Open** | Measurement frameworks, decision-support tools, assessment platforms |
| 16 | Regeneration | — | — | **Open** | Beyond sustainability; active restoration principles |
| 17 | Circular Economy Strategies | — | — | **Open** | Design for longevity, reuse, remanufacturing, closed loops |
| 18 | Risk Analysis | — | — | **Open** | Sustainability risk identification, FMEA/bow-tie methods |

### Category 2: Community

| # | Task | Lead | Co-Lead | Status |
|---|------|------|---------|--------|
| 7 | INCOSE Connect Moderation | Alain | Sannelie | **Active** |

### Category 3: Content

| # | Task | Lead | Co-Lead | Status |
|---|------|------|---------|--------|
| 8 | Sustainability Webinar Series | — | — | **Open** |
| 9 | SEBoK | — | — | **Open** |

### Category 4: Outreach

| # | Task | Lead | Co-Lead | Status |
|---|------|------|---------|--------|
| 10 | Manage Networking | Sannelie | Guillaume | **Active** |
| 11 | Understanding Industrial Actors Needs | — | — | **Open** |

---

## How the Generic Approach Maps to the 3-Milestone Roadmap

### **Milestone 1: SolarX AS-IS Complete** (Issues #3–#9)
**Capture current state across all layers**

- **Strategic & Conceptual:** Stakeholder analysis, requirements, context (SYSMOD Steps 1–6)
- **Product & Industrial:** Functional architecture, logical architecture (SYSMOD Steps 7–8)
- **Industrialization:** Physical architecture (SYSMOD Step 9)
- **Operation / Service:** Use cases, lifecycle flows, behavioral states
- **Enablement:** LCA baseline for all 5 components; baseline GWP/environmental impact
- **Holistic topics:** System dynamics in use cases, digital model representation, initial risk factors

**WG Task Groups Contributing:**
- Systems Thinking (Step 1–6 problem formulation)
- LCA (Issues #6–#8, baseline analysis)
- Sustainability Requirements (Requirements traceability)
- Digital Engineering (MBSE model structure, documentation)

### **Milestone 2: SustainaSun v1** (Issues #10–#12)
**Transform Business Model → Enterprise Architecture → Product Design**

- **Strategic & Conceptual:** New mission/vision alignment with circular economy
- **Product & Industrial:** PaaS business model, service delivery enterprise architecture, product design transformation
- **Industrialization:** Manufacturing implications, supply chain shift to service model
- **Operation / Service:** Maintenance/repair/refurbishment logistics, reverse logistics, fleet management
- **Retirement:** 9R strategy integration (Refuse through Recover)

**WG Task Groups Contributing:**
- Business Models (PaaS archetypes, circular economy principles)
- Enterprise Architecture (new service-delivery operating model)
- Circular Economy Strategies (9R alignment, design for longevity)
- Risk Analysis (regulatory, market, supply chain risks in transformation)

### **Milestone 3: DPP Integration** (Issues #13–#14)
**Close the loop with Digital Product Passport for traceability**

- **Strategic & Conceptual:** EU ESPR compliance, regulatory alignment
- **Product & Industrial:** DPP data structure (composition, materials, environmental impact, durability, EOL)
- **Operation / Service:** Traceability from production to use to recycling
- **Retirement:** Closed-loop material flow, enabling R-Strategies via DPP transparency

**WG Task Groups Contributing:**
- Digital Engineering (DPP as MBSE structure, data integration)
- Sustainability Requirements (ESPR Article 6–9 compliance mapping)
- Regeneration / Circular Economy (EOL options, material passports, closed loops)

---

## WG Task Groups & How They Connect to SustainableTogether Issues

### **Active Task Groups (Leads Assigned)**

1. **Systems Thinking / System Dynamics** (Ivan, Jorge)
   - Input to: SolarX problem formulation, use case behavioral flows, SustainaSun transformation dynamics
   - Deliverable type: Case studies, system dynamics models, rebound effect analysis

2. **Sustainability Requirements** (Lou, Ali B.)
   - Input to: SolarX requirements (Issues #3–#6), SustainaSun requirements (#10–#12), DPP requirements (#13–#14)
   - Deliverable type: Requirement templates, taxonomies, specification examples

3. **LCA** (Hamza)
   - Input to: SolarX LCA baseline (#6–#8), SustainaSun lifecycle comparisons, DPP environmental impact data (#13–#14)
   - Deliverable type: ISO 14040/44 guidance, SimpleLCAIntegration2 pipeline outputs, GWP/impact assessments

4. **INCOSE Connect Moderation** (Alain, Sannelie)
   - Input to: Community engagement, disseminating project updates
   - Deliverable type: Forum posts, announcements, member onboarding

5. **Manage Networking** (Sannelie, Guillaume)
   - Input to: External partnerships, standards body liaison, industry adoption pathways
   - Deliverable type: Contact list, partnership agreements, event presence

### **Open Task Groups (Need Volunteers)**

**Critical for SustainableTogether Milestones:**
- **Business Models** (#10–#12) — PaaS archetype modeling
- **Digital Engineering** (all) — MBSE model structure, data integration, tools
- **GitHub Management** (#13+) — Repo organization, contribution guidance, PR reviews
- **Enterprise Architecture** (#11–#12) — Service delivery operating model
- **Circular Economy Strategies** (#12, #13–#14) — 9R integration, design-for-EOL
- **Risk Analysis** (all milestones) — Sustainability risk identification and management
- **Regeneration** (#12–#14) — Beyond-sustainability principles

**Supporting Activities:**
- **Literature Review** — Inform all workstreams with academic/industry context
- **Enabling Systems** — Tools, metrics frameworks, decision-support systems
- **Webinar Series & SEBoK** — Knowledge dissemination
- **Understanding Industrial Actors Needs** — Practitioner feedback loops

---

## How to Work with This Framework

### **When Starting a Session on SustainableTogether**

1. **Read context**
   - Load this CLAUDE.md and the memory files (`project_sustainabletogether.md`, `workflow_sustainable_together_session_pattern.md`)
   - Check which Generic Approach layers your issue touches
   - Check which WG task groups contribute to your issue

2. **Pick an issue from GitHub**
   - Select from Backlog or Ready to Start in the project board
   - Confirm which milestone it belongs to (SolarX AS-IS, SustainaSun v1, or DPP Integration)
   - Verify which task groups / WG workstreams it aligns with

3. **Work on it**
   - Follow the issue's acceptance criteria
   - For SysML model work: validate in SysIDE (Ctrl+Shift+M)
   - For LCA work: test with SimpleLCAIntegration2 pipeline
   - For business/EA work: link to Generic Approach framework layers

4. **Document progress**
   - At end of session: update the GitHub issue with what was completed, blockers, next steps
   - Move issue in project board (Backlog → In Progress → In Review → Done)
   - Update this session in a comment with Generic Approach layers touched and WG task groups engaged

---

## Confirmed Conventions

### **Naming & Structure**

- **SolarX model files:** Organized by SYSMOD step (Steps 1–9) inside `SolarXModel.sysml`
- **SustainaSun model files:** Parallel structure, prefixed `SustainaSun_...` (after Milestone 2 starts)
- **DPP model files:** Integrated into main model with `DPP_...` namespacing (Milestone 3)

### **Generic Approach Layer References**

When documenting an issue or PR, cite which framework layers it touches:

```markdown
## Generic Approach Alignment
- **Strategic & Conceptual:** Mission & Vision, Design for Sustainable Behavior
- **Product & Industrial:** Product Development, Enabling Systems
- **Operation / Service:** Product Use, R-Strategies
- **Holistic Topics:** Digital Engineering, LCA

## WG Task Groups Engaged
- Systems Thinking (Behavioral modeling)
- Digital Engineering (MBSE structure)
- LCA (Impact assessment)
```

### **Milestone Roadmap**

- **Milestone 1 (SolarX AS-IS):** Issues #3–#9 — **Current Focus**
- **Milestone 2 (SustainaSun v1):** Issues #10–#12 — Starts after M1 complete
- **Milestone 3 (DPP Integration):** Issues #13–#14 — Starts after M2 complete

---

## Questions & Support

- **Which task group should I volunteer for?** Check the WG_Leadership_Tracker CSV for open roles that match your expertise
- **How does my issue connect to the Generic Approach?** Map it to one or more of the 8 strategic layers
- **Which WG task group should I coordinate with?** Check the table above for active leads and open areas
- **Unclear issue scope?** Comment in the GitHub issue before starting — don't guess

---

**Last updated:** 2026-04-18
**Related files:**
- `SustainableTogether - Copy of Initial Generic Approach for the Case Study.jpg` — Framework diagram
- `WG_Leadership_Tracker_csv.csv` — Task group assignments and status
- `COLLABORATION_WORKFLOW.md` — Contribution process
- GitHub Project Board: https://github.com/users/TheNightFox-1/projects/3
