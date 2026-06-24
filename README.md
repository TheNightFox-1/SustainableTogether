# SustainableTogether

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Documentation](https://img.shields.io/badge/docs-GitHub%20Pages-blue)](https://thenightfox-1.github.io/SustainableTogether/)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![INCOSE Sustainability WG](https://img.shields.io/badge/INCOSE-Sustainability%20WG-orange)](https://www.incose.org/group/sustainability-working-group/)

> **Transforming a conventional enterprise, business model, and product into a sustainable one.**

---

## Vision

Once upon a time, we were **SolarX** — a typical solar company. We sold solar systems that helped reduce energy bills, but our business model was not groundbreaking: high prices, limited accessibility, and products focused more on efficiency than on their full environmental and social impact.

Then we asked: *Why not become the most sustainable solar company in the world?*

That question began the transformation of SolarX into **SustainaSun** — a movement to make solar energy affordable for everyone, installable anywhere, and genuinely beneficial to both the planet and society.

**SustainaSun is not just a company. It is a movement toward a brighter, fairer future.**

---

## What is SustainableTogether?

SustainableTogether is an open-source initiative by the [INCOSE Sustainability Working Group](https://www.incose.org) that explores how systems engineering can support the transformation from conventional practices to sustainable business models, enterprise architecture and products for a flourishing future.

In its generic term, the project serves as a platform, where like-minded people come together, solve sustainability challanges and spreads them to the outside world. 

Everyone is welcome, every skill is needed to tackle this wicked problem.

This repository serves as a shared knowledge base and collaborative workspace for:

- Methods, processes and tools that supports the transformation to sustainable practices.
- Educational materials, presentations, and webinar content

---

## Repository Structure

```
SustainableTogether/
├── SustainableTogether Approach/          # Governance, methodology, and framework
│   ├── README.md                          # Generic Approach Framework (8 layers + holistic topics)
│   ├── CLAUDE.md                          # Guidance for AI contributors in this workspace
│   ├── COLLABORATION_WORKFLOW.md          # Detailed issue templates, PR workflow, review process
│   └── WG_Leadership_Tracker_csv.csv      # All 18 WG task groups: leads, status, time commitment
│
├── SustainableTogether Projects/          # Concrete case studies and implementations
│   ├── System Model/                      # SysML v2/MBSE models for SolarX → SustainaSun
│   │   ├── SolarX/                        # AS-IS baseline: PVArray, Inverter, Battery, Controller, Grid
│   │   └── [Future] SustainaSun/          # TO-BE transformation model (Milestone 2)
│   └── Sustainability Stakeholder Mapping/  # Ecosystem analysis: partners, collaborators, target audiences
│
├── Our Presentations/                     # Presentations and publications by the working group
├── SustainabilityWebinarSeries/           # Slides from the INCOSE Sustainability Webinar Series
├── docs/                                  # Full documentation (also published via GitHub Pages)
│
├── README.md                              # You are here — Vision, contribution paths, milestones
├── CONTRIBUTING.md                        # How to contribute: issue vs. workstream pathway routing
├── WORKSTREAMS.md                         # All 18 INCOSE Sustainability WG task groups with descriptions
├── LICENSE                                # MIT License
└── On-Boarding Document                   # Introduction to SustainableTogether & INCOSE Sustainability WG
```

### Key Directories

| Directory | Purpose | Owner |
|---|---|---|
| **SustainableTogether Approach/** | Framework, governance, contribution guidance, WG tracker | Sustainability WG |
| **SustainableTogether Projects/** | Case studies, SysML models, ecosystem analysis | Contributors |
| **docs/** | GitHub Pages documentation | Contributors |
| **Our Presentations/** | Community outreach and thought leadership | Contributors |
| **SustainabilityWebinarSeries/** | Recorded webinar materials | Content workstream |

---

## Documentation

Full documentation is available at:

**[thenightfox-1.github.io/SustainableTogether](https://thenightfox-1.github.io/SustainableTogether/)**

Topics covered:
- [Vision & Mission](https://thenightfox-1.github.io/SustainableTogether/vision/)
- [System Model](https://thenightfox-1.github.io/SustainableTogether/system-model/)
- [Presentations](https://thenightfox-1.github.io/SustainableTogether/presentations/)
- [Webinar Series](https://thenightfox-1.github.io/SustainableTogether/webinar-series/)
- [Roadmap](https://thenightfox-1.github.io/SustainableTogether/roadmap/)

---

## Getting Involved

We welcome contributions from anyone — you do not need to be a systems engineer or sustainability expert.

### Two Ways to Contribute

#### **Path A: Work on Deliverables (GitHub Issues)**

Pick a concrete issue from the [GitHub Project Board](https://github.com/users/TheNightFox-1/projects/3) and make a pull request.

**Quick Start (3 Steps):**
1. **Browse the issues** for an issue that interest you
2. **Claim an issue** by commenting "I'll work on this" — maintainers will assign you
3. **Follow the workflow:**
   - Create a branch: `git checkout -b issue-#N-brief-title`
   - Work locally, validate your changes (SysIDE for SysML, LCA pipeline for LCA)
   - Open a Pull Request linking to the issue with `Closes #N`
   - Maintainers review and merge

**Best for:** People who want **focused, bounded tasks** they can complete in 1–2 weeks.

#### **Path B: Join a WG Workstream (Ongoing Research)**

Contribute to one of **18 INCOSE Sustainability WG task groups** — ongoing research and community activities.

**How to Get Involved:**
1. **Browse the [WG Leadership Tracker](SustainableTogether%20Approach/WG_Leadership_Tracker_csv.csv)** to see all workstreams
2. **Find an open role** that matches your expertise (Business Models, Digital Engineering, Circular Economy, Risk Analysis, etc.)
3. **Volunteer** — contact the workstream lead or comment on the tracker "I'd like to volunteer for X"
4. **Contribute asynchronously** — sync at monthly WG meetings; coordinate smaller deliverables as needed

**Active Workstreams** (with assigned leads):
- Systems Thinking / System Dynamics
- Life Cycle Assessment (LCA)
- Sustainability Requirements
- INCOSE Connect Moderation
- Manage Networking

**Open Workstreams** (recruiting volunteers):
- Business Models & Circular Economy
- Digital Engineering & MBSE
- GitHub Management & Repo Structure
- Enterprise Architecture
- Enabling Systems & Tools
- Regeneration & Beyond-Sustainability
- Risk Analysis & Regulatory Compliance
- And more — see **[WORKSTREAMS.md](WORKSTREAMS.md)** for all 18 with full descriptions

**Best for:** People who want **deeper, ongoing involvement** in research, strategy, or community building.

---

### Contribution Types (Issue-Based)

| I want to... | Where | Effort |
|---|---|---|
| **Work on the SysML model** | Pick an architecture issue (#3–#5) from the project board | Intermediate |
| **Run LCA analysis** | Pick an LCA issue (#6–#8), use openLCA + SimpleLCAIntegration2 pipeline | Advanced |
| **Write documentation** | Pick a docs issue (#9, #14), or improve guides in `docs/` | Beginner |
| **Design SustainaSun strategy** | Join the Business Models workstream or pick issues #10–#13 | Intermediate |
| **Ask a question** | Start a [Discussion](../../discussions) or comment on an issue | Any |
| **Report a bug** | Open an issue with error details (SysIDE Problems, LCA validation logs) | Any |
| **Share resources** | Open an issue or discussion with links/documents | Any |

---

### Full Guides & Documentation

**Getting Started:**
- **[CONTRIBUTING.md](CONTRIBUTING.md)** — How to contribute, issue vs. workstream pathway routing, PR checklist
- **[Onboarding Document](On-Boarding%20SustainableTogether%20and%20INCOSE%20Sustianability%20WG.pdf)** — Full introduction to SustainableTogether and INCOSE Sustainability WG

**Framework & Governance:**
- **[SustainableTogether Approach / README.md](./SustainableTogether%20Approach/README.md)** — Generic Approach Framework: 8-layer transformation journey with milestone mapping
- **[WORKSTREAMS.md](WORKSTREAMS.md)** — All 18 INCOSE Sustainability WG task groups with descriptions, leads, and how to participate
- **[WG_Leadership_Tracker_csv.csv](./SustainableTogether%20Approach/WG_Leadership_Tracker_csv.csv)** — Current leads, co-leads, and open roles

**Detailed Workflows:**
- **[SustainableTogether Approach / COLLABORATION_WORKFLOW.md](./SustainableTogether%20Approach/COLLABORATION_WORKFLOW.md)** — Issue templates, PR workflow, project board columns, review process
- **[SustainableTogether Approach / CLAUDE.md](./SustainableTogether%20Approach/CLAUDE.md)** — Guidance for AI contributors and system implementers

### Current Milestones (Work One at a Time)

1. **SolarX AS-IS Complete** ← **Current focus** (Issues #3–#9)
   - Full SysML v2 model (all 9 SYSMOD steps)
   - LCA baseline for all 5 components
   - Non-engineer documentation

2. **SustainaSun v1** (Issues #10–#12)
   - Business model transformation (PaaS leasing)
   - Enterprise architecture (new capabilities)
   - 9R circular economy strategy alignment

3. **DPP Integration** (Issues #13–#14)
   - Digital Product Passport (EU ESPR compliance)
   - Regulatory alignment documentation

---

## Onboarding

New to the project? Start with the [Onboarding Document](On-Boarding%20SustainableTogether%20and%20INCOSE%20Sustianability%20WG.pdf) for a full introduction to SustainableTogether and the INCOSE Sustainability Working Group.

**Never used GitHub before?** Read the [GitHub Onboarding for Beginners](docs/github-onboarding.md) guide: plain-language basics, a step-by-step checklist, and the three ways to use GitHub (web browser, GitHub Desktop, or a local folder). It also walks you through raising your first issue and turning it into a pull request.



---

## License

This project is licensed under the [MIT License](LICENSE).
Copyright (c) 2024 SustainableTogether Contributors.

---

## Contact

Questions or ideas? Reach us at **sustainability@incose.net** or open a [Discussion](../../discussions).
