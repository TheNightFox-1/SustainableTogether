# Group 5 — Digital Engineering

**Owns research questions:** RQ3.1 ★ (leads the methodology question — can the artefacts be formally aligned and machine-validated?) · RQ1.6 (do all artefacts describe the same system?)
**Task brief:** [`TASK-BRIEF.md`](./TASK-BRIEF.md) · **Decomposition:** [`../RQ-DECOMPOSITION.md`](../RQ-DECOMPOSITION.md) · **Abbreviations:** [`../GLOSSARY.md`](../GLOSSARY.md)

> **New folder (2026-08-09):** The semantic integration and automation pipeline, previously under `04-business-model/system-dynamics/`.
>
> *Status change 2026-08-11: this folder was previously described as "the tooling layer — not a research group". It is now **Group 5**, because it owns and leads RQ3.1 — the claim that artefacts across business model, System Dynamics and MBSE can be formally aligned and machine-validated **is** the methodological contribution, not just infrastructure serving it. It remains the layer every other group depends on.*

---

## Purpose

Provide the **formal mapping infrastructure** between modelling domains so that artifacts stay consistent as the project evolves. This is the "digital engineering" layer: ontologies, registries, validation pipelines, and automated artifact generation.

---

## What's here

### Semantic Integration Method (FBMC ↔ CLD)

The worked example of integrating a business-model canvas (Flourishing Business Model Canvas) with causal loop diagrams (System Dynamics).

| File | Description |
|---|---|
| `Semantic-Integration-Playbook.md` | The full reusable method — L0 (conceptual) through L4 (linked knowledge graph) |
| `FBMC-CLD-Alignment-Ontology.drawio` | Metamodels + bridge concept (4 pages) |
| `FBMC-CLD-Semantic-Alignment.docx` | Block-by-block mapping documentation |
| `FBMC-CLD-Semantic-Alignment-Method.md` | Condensed method |
| `SustainaSun_Concept_Registry.xlsx` | The live concept registry (21 generic + 21 PV instance, 34 links, 9 loops) |
| `SustainaSun_CLD_v3_leasing.drawio` | CLD v3 generated from the registry |

### Automation Pipeline (`pipeline/`)

Scripts that validate, transform, and generate artifacts from the concept registry.

| Script | Purpose |
|---|---|
| `validate_registry.py` | Checks invariants I1–I7 on the registry |
| `registry2cld.py` | Generates a draw.io CLD page from the registry |
| `xlsx2rdf.py` | Converts registry to RDF triples |
| `log_change.py` | Change log management |
| `regression_test.py` | Defect-injection tests (11 fixture cases) |
| `run_all_checks.sh` | Runs the full validation suite |

### Ontology / Knowledge Graph

| File | Description |
|---|---|
| `fbmc-cld.ttl` | OWL ontology (TBox) |
| `shapes.ttl` | SHACL validation shapes |
| `registry_latest.ttl` | Current ABox (RDF instances) |

### Progress

See [`pipeline/PROGRESS.md`](pipeline/PROGRESS.md) for the build log and remaining tasks.

---

## Where the semantic integration fits

This group provides the **formal infrastructure** every other group's artefacts pass through. Consumers of its output:

- **Group 1 (Business Model)** — uses the concept registry to ensure the business model and CLD describe the same system
- **Group 2 (Product Regeneration)** — reuses the method to map SysML v2 ↔ CLD and other domain pairs
- **Group 3 (LCA & Financial)** — uses the RDF pipeline to carry LCA results back into the model
- **Group 4 (System Dynamics)** — uses the CLD as a starting point for behavioral analysis
- **Group 6 (Enabling Systems)** — records enabling-system dependencies against registry concepts rather than free text

---

## Future: making it reusable

The Semantic Integration Playbook is written as a **domain-agnostic method**. The next step is to make the pipeline itself domain-agnostic (replace FBMC/CLD-specific code with template-driven generation based on metamodels).
