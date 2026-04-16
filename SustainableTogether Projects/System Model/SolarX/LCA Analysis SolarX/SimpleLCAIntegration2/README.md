# MBSE-LCA Knowledge Graph Prototype

Semantic integration of a SysML v2 system model with a Life Cycle Assessment
using an in-memory RDF knowledge graph.

## Architecture

```
SysML v2 REST API          openLCA IPC server
(localhost:9000)            (localhost:8080)
       │                           │
       ▼                           │
 sysml_reader.py                   │
 (fallback: battery.ttl)           │
       │                           │
       ▼                           │
   graph.py  ◄── ontology .ttl     │
 (rdflib ConjunctiveGraph)         │
       │                           │
       ▼                           │
   bridge.py                       │
 (SPARQL → JSON-LD)                │
       │                           │
       └──────────► lca_client.py ─┘
                    (import + calculate + write back)
```

| Layer | Technology | Notes |
|---|---|---|
| Triplestore | rdflib `ConjunctiveGraph` | In-memory, no external server |
| Ontology | OWL 2 / Turtle | `ontology/lca_sysml_alignment.ttl` |
| Physical quantities | QUDT | `qudt:QuantityValue` blank nodes |
| SysML source | REST API or `.ttl` fallback | `sysml_reader.py` |
| LCA bridge | SPARQL SELECT + JSON-LD | `bridge.py` |
| LCA tool | olca-ipc + olca-schema | `lca_client.py` |

## Prerequisites

| Requirement | Version | Notes |
|---|---|---|
| Python | ≥ 3.10 | f-strings, `match`, `list[T]` hints |
| rdflib | ≥ 6.3.2 | core dependency, always needed |
| requests | ≥ 2.31.0 | SysML API calls |
| olca-ipc | ≥ 2.0.0 | optional — needed only for live openLCA |
| olca-schema | ≥ 2.0.0 | optional — needed only for live openLCA |
| openLCA | ≥ 2.0 | optional — IPC server at `localhost:8080` |
| SysML v2 Pilot | any | optional — REST API at `localhost:9000` |

## Installation

```bash
# 1. Create and activate a virtual environment
python -m venv .venv
# Windows:
.venv\Scripts\activate
# macOS / Linux:
source .venv/bin/activate

# 2. Install core dependencies (always required)
pip install rdflib requests

# 3. Install openLCA IPC bindings (only if openLCA is available)
pip install olca-ipc olca-schema

# Or install everything at once:
pip install -r requirements.txt
```

## Running the pipeline

```bash
python main.py
```

### Standalone mode (no external services)

The pipeline runs fully offline:

- **No SysML API**: `sysml_reader.py` automatically falls back to `data/battery.ttl`.
- **No openLCA**: `lca_client.py` returns a simulated GWP100 value (45.3 kg CO₂-eq),
  which is a plausible estimate for a 4.2 kg NMC battery module manufactured in DE.

Expected standalone output:
```
============================================================
  MBSE-LCA Knowledge Graph Pipeline
============================================================
[graph]        Loaded ontology      : lca_sysml_alignment.ttl  (38 triples total)
[sysml_reader] API not reachable — using battery.ttl fallback
[graph]        Loaded instance data : battery.ttl  (53 triples total)
[bridge]       Extracted: NMC Battery Module | 4.2 kg | 48.0 V | 15.0 Ah | DE
[lca_client]   olca-ipc not installed — install with: pip install olca-ipc olca-schema
[lca_client]   (offline) Simulated import: 'NMC Battery Module' → 4b167b93-...
[lca_client]   (offline) Simulated GWP100 = 45.3 kg CO₂-eq
[lca_client]   Wrote triple: <...#batteryModule> lca:hasGWP100 45.3 .
...
============================================================
  Result Summary
============================================================
  Data source  : battery.ttl (offline fallback)
  Graph size   : 57 triples

  NMC Battery Module
    Mass         : 4.2 kg
    Voltage      : 48.0 V
    Capacity     : 15.0 Ah
    Geography    : DE
    Ecoinvent ID : 4b167b93-2b25-4aa3-ab1c-35cd804f4a73
    GWP100       : 45.30 kg CO₂-eq
```

### With SysML v2 Pilot Implementation

1. Start the SysML v2 Pilot Implementation server:
   ```bash
   java -jar syside-server.jar   # or your server start command
   ```
2. Ensure it listens on `http://localhost:9000`.
3. Run `python main.py` — the reader will fetch `PartDefinition` elements
   and convert them to RDF triples automatically.

### With openLCA

1. Open openLCA ≥ 2.0 and load a database that contains:
   - The **ReCiPe 2016 Midpoint (H)** impact assessment method.
   - Optionally: the ecoinvent 3.x dataset for NMC battery production
     (UUID `4b167b93-2b25-4aa3-ab1c-35cd804f4a73`).
2. Start the IPC server:
   - Menu: `Tools → Developer tools → IPC server`
   - Port: `8080`
3. Run `python main.py`.

## Output files

| File | Description |
|---|---|
| `output_graph.ttl` | Final RDF graph in Turtle (includes GWP100 triple) |
| `output_summary.json` | Machine-readable result summary |
| `process_<name>.json` | openLCA JSON-LD process dict (one per part) |

## Project structure

```
mbse-lca-prototype/
├── ontology/
│   └── lca_sysml_alignment.ttl  # OWL 2 ontology: sysml:PartDef ↔ lca:UnitProcess
├── data/
│   └── battery.ttl              # 48V/15Ah NMC battery instance data (QUDT quantities)
├── src/
│   ├── __init__.py
│   ├── graph.py                 # rdflib ConjunctiveGraph wrapper + shared namespaces
│   ├── sysml_reader.py          # SysML v2 REST API reader (fallback: battery.ttl)
│   ├── bridge.py                # SPARQL → openLCA JSON-LD transformation
│   └── lca_client.py            # olca-ipc client: import, calculate, write-back
├── main.py                      # Pipeline orchestrator
├── requirements.txt
└── README.md
```

## Extending the model

### Add more parts

Add further instances to `data/battery.ttl` following the same pattern:

```turtle
ex:inverter
    a sysml:PartDefinition, lca:UnitProcess ;
    rdfs:label        "SolarX Inverter" ;
    lca:hasMass       [ a qudt:QuantityValue ; qudt:numericValue 3.8 ; qudt:unit unit:KiloGM ] ;
    lca:hasGeography  "DE" ;
    lca:hasEcoinventUUID "your-ecoinvent-uuid-here" .
```

### Connect to a live SysML model

If your SysML model defines mass as an attribute:

```sysml
part def BatteryModule {
    attribute mass : MassValue { :>> num = 4.2; :>> mRef = kg; }
}
```

The SysML reader will pick up `mass`-named attributes from the API response
and convert them to `lca:hasMass` QUDT quantity values automatically.

### Query the graph directly

```python
from src.graph import LCAKnowledgeGraph

kg = LCAKnowledgeGraph()
kg.load_ontology()
kg.load_instance_data()

for row in kg.query("""
    PREFIX lca: <http://mbse-lca.org/ontology#>
    SELECT ?part ?gwp WHERE { ?part lca:hasGWP100 ?gwp . }
"""):
    print(row.part, "→", float(row.gwp), "kg CO₂-eq")
```

## Ontology alignment

The `owl:equivalentClass` assertion between `sysml:PartDefinition` and
`lca:UnitProcess` enables a reasoner to infer that every SysML part
definition is also an LCA unit process and vice versa.  Physical properties
(mass, voltage, capacity) are modelled as `qudt:QuantityValue` blank nodes,
keeping numeric values and units together without custom literals.

```
sysml:PartDefinition  ─── owl:equivalentClass ───  lca:UnitProcess
        │                                                  │
   lca:hasMass                                    lca:hasGeography
        │                                          lca:hasEcoinventUUID
   qudt:QuantityValue                              lca:hasGWP100
    ├─ qudt:numericValue  4.2
    └─ qudt:unit          unit:KiloGM
```
