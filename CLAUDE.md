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
- **`System Model/SolarX/LCA Analysis SolarX/`** — LCA integration work. Contains a PoC SysML v2 ↔ LCA pipeline in `SimpleLCAIntegration/`. See the `CLAUDE.md` files in each subfolder for detailed guidance.
- **`Our Presentations/`** and **`SustainabilityWebinarSeries/`** — Static assets (PDFs, slides); not built or processed.

## Project Context

The project models a transformation from **SolarX** (conventional PV company, current state) to **SustainaSun** (sustainable future state). The MBSE models use SysML. Compatible tooling includes Cameo, Capella, and SysML v2 environments.

The near-term roadmap prioritises: completing the SolarX RFLP (Requirements, Functional, Logical, Physical) model layers; integrating LCA to automate environmental impact assessment; and beginning the SustainaSun model.

## LCA Integration Pipeline

The `SimpleLCAIntegration/` PoC demonstrates a four-layer pipeline:

```
motor.sysml → motor_instance.ttl → motor_lca_ontology.ttl → semantic_matching.sparql
```

Run the end-to-end pipeline (requires openLCA 2.x running locally with IPC server on port 8080):

```bash
cd "System Model/SolarX/LCA Analysis SolarX/SimpleLCAIntegration"
pip install rdflib olca-ipc
python stage4_integration.py
```

The script connects to openLCA via IPC, fetches ELCD flows, performs a SPARQL semantic match against the SysML material names, and prints the matched flow's GWP characterisation factor × mass.

To extend to the full SolarX system, create one `<Component>_instance.ttl` file per component (reusing the same ontology and SPARQL query). Component names: `PVArray`, `SolarInverter`, `BatteryStorage`, `SystemController`, `GridConnection`.

## Contribution Workflow

Commit message convention: `Add: ...`, `Fix: ...`, `Update: ...`

Issue templates in `.github/ISSUE_TEMPLATE/`: `bug_report.md`, `feature_request.md`, `content_contribution.md`.
