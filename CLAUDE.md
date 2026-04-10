# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Documentation Site

Built with MkDocs Material, deployed automatically to GitHub Pages on every push to `main`.

```bash
pip install -r requirements.txt
mkdocs serve          # local preview with live reload
mkdocs build          # build static site to site/
```

All documentation source is in `docs/` as Markdown; navigation is configured in `mkdocs.yml`.

## Repository Architecture

This is a **knowledge repository and MBSE model workspace**, not a traditional software project. Two independent workstreams:

**1. MBSE/SysML v2 Model** (`System Model/SolarX/`)

The primary artefact is `Solar X System Model/SolarXModel.sysml` — a single growing file containing all SYSMOD steps (1–9) accumulated in order. Never overwrite earlier steps; always extend. The completed physical layer composes eight subsystems:

```
PVArray → SolarInverter → EnergyManagementController
BatteryStorage ↔ EnergyManagementController
GridConnection ↔ EnergyManagementController
MonitoringUnit ← EnergyManagementController
CommissioningInterface (installer boundary)
MaintenanceDiagnosticsUnit (technician boundary)
```

All port definitions and item flows are in `SolarX_PortDefinitions` and `SolarX_Items` packages inside the model. See `Solar X System Model/CLAUDE.md` for the full step-by-step status, state machine details, and SysML conventions.

**2. LCA Integration PoC** (`System Model/SolarX/LCA Analysis SolarX/SimpleLCAIntegration/`)

Four-layer pipeline: `motor.sysml → motor_instance.ttl → motor_lca_ontology.ttl → semantic_matching.sparql`. Requires openLCA 2.x running locally with IPC on port 8080.

```bash
cd "System Model/SolarX/LCA Analysis SolarX/SimpleLCAIntegration"
pip install rdflib olca-ipc
python stage4_integration.py
```

Semantic matching uses substring containment — no hardcoded UUIDs. To extend to the full SolarX model, create one `<Component>_instance.ttl` per physical component, reusing the same ontology and SPARQL query. See `SimpleLCAIntegration/CLAUDE.md` for the design decisions.

## SysML v2 Tooling

- **Validator:** SysIDE VS Code extension. Open `SolarXModel.sysml` in VS Code; errors appear in the Problems panel (`Ctrl+Shift+M`). Paste errors into chat to diagnose.
- **Model output rule:** return only raw SysML v2 — no markdown fences, no mixed natural language. First non-whitespace character must be a valid SysML keyword.
- **Methodology:** SYSMOD step sequence (brainstorm → confirm → generate SysML → validate → next step). The CLAUDE.md in the project root of the Claude for SysML v2 workspace (`Claude for SysML v2/CLAUDE.md`) contains confirmed syntax rules accumulated from SysIDE validation sessions.

## Project Context

Models the transformation from **SolarX** (conventional PV company, AS-IS) to **SustainaSun** (sustainable future state). Near-term roadmap: add views for Steps 3–6b, complete Step 9 internal connections, integrate full LCA workflow, begin SustainaSun model.

- GitHub repo: `TheNightFox-1/SustainableTogether`
- Project board: `github.com/users/TheNightFox-1/projects/3`
- Active milestone: **SolarX AS-IS complete** (issues #3–#9)

## Contribution Workflow

Commit convention: `Add: ...`, `Fix: ...`, `Update: ...`

Issue templates in `.github/ISSUE_TEMPLATE/`: `bug_report.md`, `feature_request.md`, `content_contribution.md`.
