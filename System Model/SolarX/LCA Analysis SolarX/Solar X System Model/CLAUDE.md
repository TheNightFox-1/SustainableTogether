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
| 1    | Problem Statement           | done       |
| 2    | System Idea                 | done       |
| 3    | Stakeholder Analysis        | done       |
| 4    | Requirements                | done       |
| 5    | System Context & Actors     | done       |
| 6    | Use Cases                   | done       |
| 6b   | Use Case Action Flows       | done       |
| 7    | Functional Architecture     | done       |
| 8    | Logical Architecture        | done       |
| 8b   | Logical Behavior (States)   | done       |
| 9    | Physical Architecture       | done (structural skeleton — no internal connections yet) |

## Use Cases (current — revised in session 2026-03-26)
| ID   | Name                                        | Notes                        |
|------|---------------------------------------------|------------------------------|
| UC-1 | supply household electricity                | merged former UC-1/2/3       |
| UC-2 | feed surplus solar electricity to public grid | was UC-4                  |
| UC-3 | monitor energy generation and consumption   | was UC-5                     |
| UC-4 | install and commission PV system            | was UC-6                     |
| UC-5 | repair system component                     | new — maintenance technician |

## Step 6 Pattern — def + usage
Each use case is modeled as a **def + usage pair** inside `SolarX_UseCases`:
- `use case def 'name'` — holds `subject`, `actor`, `objective` (the specification)
- `use case <'UC-x'> camelCaseName : 'name'` — the usage typed to the def, holds the action flow (`first/then`, `action` usages, `flow` statements)

Action flows live in the usage, not in a separate package. The former `SolarX_ActionFlows` package has been removed.

## Step 6b Status — all done (flows now in UC usages)
- UC-1 (`supplyHouseholdElectricity`) — sequential, source selection deferred to Step 7
- UC-2 (`feedSurplusSolarElectricityToPublicGrid`) — sequential
- UC-3 (`monitorEnergyGenerationAndConsumption`) — **continuous loop** using `merge continuousLoop`, no `done`, triggered at system start
- UC-4 (`installAndCommissionPVSystem`) — sequential, ConfigurationData in / CommissioningReport out
- UC-5 (`repairSystemComponent`) — sequential, MaintenanceRequest in / DiagnosticsData out

## Step Order Note
Requirements (Step 4) must come BEFORE System Context (Step 5).
Stakeholders must be defined before requirements so that stakeholder links work.

## Known SolarX Context
- **System:** SolarX — a photovoltaic energy company
- **AS-IS components:** PVArray, SolarInverter, BatteryStorage, SystemController, GridConnection
- **Transformation goal:** from conventional PV company (SolarX) to sustainable PV company (SustainaSun)
- **LCA integration:** PoC built in `../SimpleLCAIntegration/` using RDF/SPARQL semantic matching
- **Items package:** `SolarX_Items` — SolarIrradiation, DCElectricity, ACElectricity, MonitoringData, ControlCommand, ConfigurationData, CommissioningReport, DiagnosticsData, MaintenanceRequest
- **Ports:** SunPort (`in SolarIrradiation`), GridPort (`out ACElectricity` — feed-in direction), HouseholdPort (`out ACElectricity`), HomeownerPort (`in ControlCommand`, `out MonitoringData`), InstallerPort (`in ConfigurationData`, `out CommissioningReport`), MaintenancePort (`in MaintenanceRequest`, `out DiagnosticsData`)
- **GridPort is unidirectional** — SolarX has two grid port instances: `gridFeedInPort : GridPort` (out) and `gridDrawPort : ~GridPort` (in); publicGrid mirrors with `feedInSystemPort : ~GridPort` and `drawSystemPort : GridPort`
- **Actors in context:** sun, publicGrid, household, homeownerActor, installerActor, maintenanceTechnicianActor

## Step 8b — Logical Behavior (States)
Package: `SolarX_LogicalBehavior` → `SolarX_LifecycleStages`

### Lifecycle state machine: `solarXLifecycleStages`
States: `off` → `commissioning` → `operational` ↔ `fault` → `maintenance`
Triggers (`item def`): InstallerInitiatesCommissioning, CommissioningComplete, FaultDetected, MaintenanceStarted, RepairComplete, SystemShutdown
Transition form: `transition <source> accept <item def trigger> then <target>`

### Operational sub-machines (3 concurrent, defined as sibling state usages)
SysIDE limitation: nested composite state transitions fail — sub-machines live at the package level.

| State usage | States | Triggers (`attribute def`) |
|---|---|---|
| `generationModes` | standby ↔ generating | IrradiationAvailable / IrradiationUnavailable |
| `storageModes` | idle ↔ charging, idle ↔ discharging | ChargingRequired, StorageFull, DischargingRequired, StorageEmpty |
| `gridModes` | disconnected ↔ feedingIn, disconnected ↔ drawingFromGrid | SurplusAvailable, NoSurplus, GridDrawRequired, GridDrawSatisfied |

Transition form: bare `accept <attribute def trigger> then <target>` (sequential, after source state definition)

## Convention
- One `.sysml` file, all steps accumulated
- SYSMODLibrary package always at the bottom of the file
- Brainstorm first, SysML only when user says "it's okay" or equivalent

## Views
- Views live inside each step package, at the bottom — they are the communication artifact for that step
- Import at `SolarXProject` level: `private import Views::asTreeDiagram;` and `private import Views::asInterconnectionDiagram;` (specific imports — `Views::*` wildcard does NOT resolve)
- `fileType` must be a **string literal**: `"PNG"`, `"SVG"`, or `"PDF"` — bare identifier causes resolve error
- CLI: `syside viz view "SolarXModel.sysml"` — outputs files to same directory
- Views in progress: `problemSpaceView` (step 1+2) done — outputs `step1_2_problem_space.png`; remaining steps pending

## GitHub Project
- Repo: https://github.com/TheNightFox-1/SustainableTogether
- Project board: https://github.com/users/TheNightFox-1/projects/3
- Active milestone: **SolarX AS-IS complete** (issues #3–#9)
- Next: add views for remaining steps (3–6b); complete Step 9 internal connections
