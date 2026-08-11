# Group 2 — Product Regeneration

**Owns research questions:** RQ1.2 (what the system physically is and what it costs) · RQ2.5 (which design choices are condition-dependent) · RQ3.3 (can desired outcomes be formalised as SysML v2 requirements and traced through architecture)
**Task brief:** [`TASK-BRIEF.md`](./TASK-BRIEF.md) · **Decomposition:** [`../RQ-DECOMPOSITION.md`](../RQ-DECOMPOSITION.md) · **Abbreviations:** [`../GLOSSARY.md`](../GLOSSARY.md)

**Group mandate:** Define what it means for a product to be regenerative in engineering terms, and formalize that in SysML v2 — from regenerative requirements through system architecture to ecological functions.

---

## Starting point: SolarX → SustainaSun

The SustainableTogether MBSE model (`../System Model/SolarX/`) covers the physical PV system:
- PV array, inverter, battery, energy management controller, monitoring unit, grid connection
- Energy and data flows
- 9-step SYSMOD process (partially complete)

This is a conventional engineering model of a PV system. It tells you how the system converts sunlight into electricity. It does not tell you how the system regenerates soil, supports biodiversity, or builds community wealth.

**Group 2's job:** extend the model so that it does.

---

## What "regeneration in the product" means in SysML v2 terms

In Fischer et al. (2024), regenerative dynamics describe desired outcomes that regenerate repeatedly — an "upward helix" that is partly self-perpetuating but still needs ongoing energy, labour and materials to keep going.

Translating to SysML v2:
1. **Regenerative system functions** — new behaviors the product performs beyond energy conversion
   - Manage habitat structure under array (vegetation management timing, height targets)
   - Retain and recharge soil moisture (drainage design, ground cover requirements)
   - Monitor and report ecological KPIs (soil carbon, species count, water infiltration rate)
   - Distribute value locally (energy access, community monitoring participation)

2. **Regenerative requirements** — measurable targets derived from Group 1's BM KPIs (target values come from Group 1; the figures below are illustrative placeholders until the group sets them)
   - `req: SoilCarbonRequirement` — SOC stable or increasing, measured annually
   - `req: BiodiversityRequirement` — species richness positive vs pre-installation baseline at Year 10 (target TBD)
   - `req: EnergyAccessRequirement` — a defined share of generation at a discounted rate to designated users (targets TBD)
   - These are new `requirement def` blocks in the SysML model

3. **Ecological flows in the model** — new port and flow types beyond energy/data
   - Biological capital flows (biomass, biodiversity indicators)
   - Water flows (infiltration, evapotranspiration)
   - Material flows at end-of-life (recovered Si, Ag, glass)
   - Social flows (community revenue, employment, monitoring participation)

4. **Lifecycle state representation** — the system's behavior changes across its 30-year life
   - Installation phase: low-disturbance site preparation constraints
   - Operation phase: regenerative land management functions active
   - EOL phase: material recovery pathway pre-specified at design time

---

## Connection to Group 1

Group 1 produces the KPI targets. Group 2 produces the system architecture that satisfies them.

The practical interface: Group 1 writes a requirements brief (what the system must achieve ecologically, socially, economically). Group 2 writes the `requirement def` blocks and then designs `part def` and `action def` elements that trace back to those requirements.

**Example:**

Group 1 says: "Net lifecycle GHG < 15 gCO₂eq/kWh."
Group 2 writes:
```sysml
requirement def LifecycleGHGRequirement {
    doc /* Net lifecycle GHG below 15 gCO2eq per kWh over the 30-year lifecycle */
    subject system : SustainaSunSystem;
    attribute maxGHG : ISQ::MassPerEnergy = 15[g/kWh];
    require constraint { system.netLifecycleGHG <= maxGHG }
}
```
And then traces it to the module sourcing requirement and the EOL recovery system.

---

## Connection to Group 3 (LCA & Financial, `06-lca-and-financial/`)

The openLCA integration prototype (`../System Model/SolarX/The IS-state of the System/SimpleLCAIntegration/`) already connects SysML to openLCA via a Resource Description Framework (RDF) pipeline. Group 2 supplies the model content this needs to cover:
- The regenerative system's ecological functions (not just energy performance)
- The material recovery pathway at EOL
- The social capital flows (community energy access)

---

## First deliverables for Group 2

1. **Scope definition** — a one-page document listing the 5 new system functions a regenerative PV system has that SolarX does not. This prevents scope creep and gives Group 1 a concrete interface.
2. **Requirements brief** — the 8–10 measurable regenerative requirements, aligned with Group 1's KPI set.
3. **Extended SysML model** — new `requirement def` blocks + at minimum stub `part def` and `port def` elements for the ecological functions.
