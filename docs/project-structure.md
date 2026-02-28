# Project Structure

This page explains what is in the repository and where to find things.

## Repository Overview

```
SustainableTogether/
├── .github/                        # GitHub configuration
│   ├── ISSUE_TEMPLATE/             # Templates for opening issues
│   ├── PULL_REQUEST_TEMPLATE.md    # Template for pull requests
│   └── workflows/                  # GitHub Actions (CI/CD)
├── docs/                           # Documentation source (this site)
├── Our Presentations/              # Presentations by the working group
├── SustainabilityWebinarSeries/    # INCOSE Sustainability Webinar Series slides
├── System Model/                   # MBSE/SysML system models
│   └── SolarX/                     # PV system model
├── .gitignore                      # Git ignore rules
├── CHANGELOG.md                    # Version history
├── CODE_OF_CONDUCT.md              # Community standards
├── CONTRIBUTING.md                 # How to contribute
├── LICENSE                         # MIT License
├── README.md                       # Project overview
├── SECURITY.md                     # Security policy
├── mkdocs.yml                      # Documentation site config
└── requirements.txt                # Python dependencies for docs
```

---

## Folder Descriptions

### `System Model/`
Contains the MBSE (Model-Based Systems Engineering) models for the SolarX and SustainaSun systems. Currently includes the SolarX PV system model. See the [System Model](system-model.md) page for details.

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
| `CONTRIBUTING.md` | Instructions for contributors |
| `LICENSE` | MIT License |
| `CODE_OF_CONDUCT.md` | Community behavior standards |
| `CHANGELOG.md` | Record of notable changes |
| `mkdocs.yml` | Configuration for the documentation site |
