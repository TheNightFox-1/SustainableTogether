# SolarX System Model — CLAUDE.md

## Purpose
Full SYSMOD-based SysML v2 system model of SolarX. Built step by step in a conversational
approach: brainstorm in natural language → confirm → generate SysML → validate → next step.

## Working File
`SolarXModel.sysml` — single growing file. All steps are appended to this file.
Never overwrite prior content; always extend.

## Step Sequence
| Step | Name                        | Status     |
|------|-----------------------------|------------|
| 1    | Problem Statement           | pending    |
| 2    | System Idea                 | pending    |
| 3    | Stakeholder Analysis        | done       |
| 4    | Requirements                | pending    |
| 5    | System Context & Actors     | done       |
| 6    | Use Cases                   | pending    |
| 6b   | Use Case Action Flows       | pending    |
| 7    | Functional Architecture     | pending    |
| 8    | Logical Architecture        | pending    |
| 9    | Physical Architecture       | pending    |

## Step Order Note
Requirements (Step 4) must come BEFORE System Context (Step 5).
Stakeholders must be defined before requirements so that stakeholder links work.

## Known SolarX Context
- **System:** SolarX — a photovoltaic energy company
- **AS-IS components:** PVArray, SolarInverter, BatteryStorage, SystemController, GridConnection
- **Transformation goal:** from conventional PV company (SolarX) to sustainable PV company (SustainaSun)
- **LCA integration:** PoC built in `../SimpleLCAIntegration/` using RDF/SPARQL semantic matching

## Convention
- One `.sysml` file, all steps accumulated
- SYSMODLibrary package always at the bottom of the file
- Brainstorm first, SysML only when user says "it's okay" or equivalent
