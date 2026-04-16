# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This folder is a **proof-of-concept SysML v2 ↔ LCA integration pipeline**. It demonstrates how a SysML v2 part definition can be semantically linked to an LCA flow database (ELCD/ecoinvent) without hardcoding UUIDs, using RDF/OWL ontology bridging and SPARQL matching.

The motor example here is a stepping stone toward automating LCA from the full SolarX SysML model (PVArray, SolarInverter, BatteryStorage, SystemController, GridConnection).

## Pipeline Architecture

The integration has four layers, each represented by a file:

```
motor.sysml                 ← SysML v2 model (source of truth)
    ↓  (manual / future: automated serialization)
motor_instance.ttl          ← SysML part as RDF individuals
    ↓  (loaded together into a triplestore)
motor_lca_ontology.ttl      ← OWL bridge: SysML concepts ↔ LCA concepts
    ↓  (queried via)
semantic_matching.sparql    ← SPARQL: match material names to ELCD flows
```

The SPARQL query requires a fourth graph at runtime: `elcd_flows.ttl` — ELCD flows loaded as RDF. This is **not yet generated**; it is the responsibility of `stage4_integration.py` (not yet written).

## Key Design Decisions

- **No hardcoded UUIDs.** Matching is done at runtime by string containment on flow names (`CONTAINS(LCASE(?matchedFlowName), LCASE(?materialName))`), so the query is database-agnostic.
- **Ontology bridge rules** in `motor_lca_ontology.ttl` declare: `sysml:PartDefinition owl:equivalentClass lca:Process` and `sysml:materialName owl:equivalentProperty lca:flowName`. These are the semantic anchors for reasoning.
- **Namespaces to preserve:**
  - `sysml: <http://sysmlv2.org/ontology#>`
  - `lca: <http://lca.org/ontology#>`
  - `ex: <http://sysmlv2club.org/example#>`

## What Still Needs to Be Built

1. **`stage4_integration.py`** — Python script (rdflib) that:
   - Loads `motor_lca_ontology.ttl`, `motor_instance.ttl`, and `elcd_flows.ttl` into a conjunctive graph
   - Executes `semantic_matching.sparql`
   - Outputs matched flow name, category, and ELCD UUID

2. **`elcd_flows.ttl`** — ELCD/ecoinvent flows serialized as RDF using the `lca:` ontology classes (`lca:Flow` with `lca:flowName`, `lca:flowCategory`, `lca:elcdUUID`)

3. **Automated SysML → RDF serialization** — currently `motor_instance.ttl` is written by hand; future work should parse `.sysml` files and generate instance TTL automatically

## Scaling to SolarX

To extend this pattern to the full SolarX system, create one `<component>_instance.ttl` per SolarX component, reusing the same ontology and SPARQL query. Component names to use: `PVArray`, `SolarInverter`, `BatteryStorage`, `SystemController`, `GridConnection`.
