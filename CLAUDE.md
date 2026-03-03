# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Documentation Site

The documentation is built with MkDocs Material and deployed automatically to GitHub Pages on every push to `main`.

Install dependencies:
```bash
pip install -r requirements.txt
```

Serve locally with live reload:
```bash
mkdocs serve
```

Build static site:
```bash
mkdocs build
```

All documentation source files are in `docs/` as Markdown. The site navigation is configured in `mkdocs.yml`.

## Repository Architecture

This is a **knowledge repository and MBSE model workspace**, not a traditional software project. It contains:

- **`docs/`** — Documentation source (MkDocs). Editing these files updates the published site at [thenightfox-1.github.io/SustainableTogether](https://thenightfox-1.github.io/SustainableTogether/).
- **`System Model/SolarX/`** — MBSE/SysML model of the SolarX PV system (current/AS-IS state). The system architecture is: `PVArray → SolarInverter → BatteryStorage` and `SolarInverter → GridConnection`, all orchestrated by `SystemController`.
- **`System Model/SolarX/LCA Analysis SolarX/`** — Planned location for Life Cycle Assessment (LCA) integration with the SolarX model (currently empty, in active development).
- **`Our Presentations/`** and **`SustainabilityWebinarSeries/`** — Static assets (PDFs, slides); not built or processed.

## Project Context

The project models a transformation from **SolarX** (conventional PV company, current state) to **SustainaSun** (sustainable future state). The MBSE models use SysML. Compatible tooling includes Cameo, Capella, and SysML v2 environments.

The near-term roadmap prioritises: completing the SolarX RFLP (Requirements, Functional, Logical, Physical) model layers; integrating LCA to automate environmental impact assessment; and beginning the SustainaSun model.

## Contribution Workflow

Commit message convention: `Add: ...`, `Fix: ...`, `Update: ...`

Issue templates in `.github/ISSUE_TEMPLATE/`: `bug_report.md`, `feature_request.md`, `content_contribution.md`.
