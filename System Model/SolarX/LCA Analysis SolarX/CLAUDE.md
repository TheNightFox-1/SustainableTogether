# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This folder contains the Life Cycle Assessment (LCA) of **SolarX** — the AS-IS state of a conventional photovoltaic solar energy system. The LCA establishes the environmental baseline that the SustainaSun transformation will be measured against.

## SolarX System Boundary

The LCA covers five components of the SolarX PV system:

| Component | Role in System |
|---|---|
| **PVArray** | Converts sunlight to DC electricity; dominant source of material impacts (silicon, silver, aluminium) |
| **SolarInverter** | Converts DC to AC; contains copper, electronics |
| **BatteryStorage** | Stores excess energy; lithium/lead chemistry, significant end-of-life impacts |
| **SystemController** | Manages energy flow; PCB and embedded electronics |
| **GridConnection** | Interface to public grid; cabling and switchgear |


## LCA Methodology

Follow **ISO 14040 / ISO 14044** — four phases:

1. **Goal & Scope** — functional unit, system boundary, life cycle stages covered (cradle-to-grave)
2. **Life Cycle Inventory (LCI)** — material and energy flows per component per life cycle stage
3. **Life Cycle Impact Assessment (LCIA)** — translate inventory into impact categories
4. **Interpretation** — identify hotspots, sensitivity analysis, conclusions

### Life Cycle Stages to Cover

- Raw material extraction & processing
- Component manufacturing
- Transport & logistics
- Installation & commissioning
- Operation & maintenance (25-year assumed lifetime)
- End-of-life (disposal, recycling, landfill)

### Recommended Impact Categories (minimum)

- Global Warming Potential (GWP) — kg CO₂-eq
- Energy Payback Time (EPBT) — years
- Cumulative Energy Demand (CED) — MJ
- Acidification Potential (AP)
- Human Toxicity Potential (HTP)

## Tooling & Data Sources

**Open-source LCA tools:**
- [Brightway2](https://brightway.dev/) — Python-based; preferred for scripted/automated analysis and SysML integration
- [OpenLCA](https://www.openlca.org/) — GUI-based; good for initial exploration

**Background inventory databases:**
- [ecoinvent](https://ecoinvent.org/) — industry standard (requires licence)
- [GLAD / openLCA Nexus](https://nexus.openlca.org/) — free datasets

**Python packages for Brightway2 workflows:**
```
brightway2
bw2data
bw2calc
bw2io
pandas
matplotlib
```

## Folder Structure (Intended)

```
LCA Analysis SolarX/
├── CLAUDE.md              # This file
├── README.md              # Overview
├── data/                  # Raw inventory data (CSV, JSON) per component
├── notebooks/             # Jupyter notebooks for analysis and visualisation
├── results/               # LCIA result tables and charts
└── reports/               # Written LCA report (Markdown or PDF)
```

## Integration with MBSE Model

The roadmap calls for automating LCA from the SysML model. When adding inventory data, structure it so it can be mapped to SysML block properties — one data file or dataset per SolarX component, keyed by component name (`PVArray`, `SolarInverter`, `BatteryStorage`, `SystemController`, `GridConnection`).

## Key References

- ISO 14040:2006 — LCA Principles and Framework
- ISO 14044:2006 — LCA Requirements and Guidelines
- IEA PVPS Task 12 — LCA of PV systems (authoritative PV-specific guidance)
