# Project Structure

This page explains what is in the repository and where to find things.

## Repository Overview

```
SustainableTogether/
├── .github/                          # GitHub configuration
│   ├── ISSUE_TEMPLATE/               # Templates for opening issues
│   ├── PULL_REQUEST_TEMPLATE.md      # Template for pull requests
│   └── workflows/                    # GitHub Actions (CI/CD)
├── docs/                             # Documentation source (this site)
│
├── SustainableTogether Approach/     # Framework, governance, WG leadership tracker
│
├── SustainableTogether Projects/     # Where the work happens — see the Projects page
│   ├── Regeneration/                 # Regeneration Task-Force: 6 groups, RQ1–RQ3
│   ├── System Model/                 # MBSE/SysML v2 models
│   │   ├── SolarX/                   # AS-IS PV system model + openLCA pipeline
│   │   └── MBSE for C2C/             # Cradle-to-Cradle reference material
│   ├── Business Model/               # SustainaSun canvas, assessment, financial model
│   ├── Sustainability Stakeholder Mapping/   # Ecosystem and partnership analysis
│   └── LLM-Wiki/                     # Knowledge-wiki demonstrator over WG documents
│
├── Our Presentations/                # Presentations by the working group
├── SustainabilityWebinarSeries/      # INCOSE Sustainability Webinar Series slides
│
├── README.md                         # Project overview
├── WORKSTREAMS.md                    # The 18 INCOSE Sustainability WG task groups
├── CONTRIBUTING.md                   # How to contribute
├── CODE_OF_CONDUCT.md                # Community standards
├── CHANGELOG.md                      # Version history
├── SECURITY.md                       # Security policy
├── LICENSE                           # MIT License
├── mkdocs.yml                        # Documentation site config
└── requirements.txt                  # Python dependencies for docs
```

---

## Folder Descriptions

### `SustainableTogether Projects/`
The working folder — five active projects, each with its own README and issue set. See the [Projects](projects.md) page for what each one produces and how they connect.

The largest is **`Regeneration/`**, the Regeneration Task-Force, which tests whether a regenerative PV business is more viable than the extractive one it replaces. Its three research questions break down across six working groups; the tree, the rules for composing sub-answers into answers, and the progress ledger live in that folder's `RQ-DECOMPOSITION.md`. Every abbreviation used across the Task-Force is defined in its `GLOSSARY.md`.

### `SustainableTogether Approach/`
The framework and governance layer: the 8-layer Generic Approach Framework, the collaboration workflow, and the WG Leadership Tracker listing all 18 task groups with their leads and open roles.

### `SustainableTogether Projects/System Model/`
The MBSE (Model-Based Systems Engineering) models for the SolarX and SustainaSun systems. Currently the SolarX PV system model plus the openLCA integration pipeline. See the [System Model](system-model.md) page for details.

### `Our Presentations/`
Presentations and publications produced by the SustainableTogether working group. These cover topics including AI Agents for MBSE, INCOSE sustainability standards, and the NSWG overview. See the [Presentations](presentations.md) page for a full index.

### `SustainabilityWebinarSeries/`
Slide decks from the INCOSE Sustainability Webinar Series — educational content on sustainable business design and systems thinking. See the [Webinar Series](webinar-series.md) page for details.

### `docs/`
The source files for this documentation website. Written in Markdown and built with [MkDocs Material](https://squidfunk.github.io/mkdocs-material/).

### `.github/`
GitHub-specific configuration: issue templates, pull request template, and GitHub Actions workflow for automatic documentation deployment.

---

## Key Files

| File | Purpose |
|---|---|
| `README.md` | Entry point for anyone visiting the GitHub repository |
| `WORKSTREAMS.md` | The 18 INCOSE Sustainability WG task groups, their leads, and how to join |
| `CONTRIBUTING.md` | Instructions for contributors |
| `LICENSE` | MIT License |
| `CODE_OF_CONDUCT.md` | Community behavior standards |
| `CHANGELOG.md` | Record of notable changes |
| `mkdocs.yml` | Configuration for the documentation site |
