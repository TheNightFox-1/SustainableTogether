# Glossary — Regeneration Task-Force

**Scope:** every abbreviation, acronym, and project-specific term used anywhere in the `Regeneration/` workspace.
**Owner:** Regeneration Task-Force · **Updated:** 2026-08-11

---

## How abbreviations are used in this workspace

**The rule:** expand every abbreviation on its **first appearance in each document** — "Photovoltaics-as-a-Service (PVaaS)" — then use the short form freely for the rest of that document. Every document links here for the full list. A reader should never have to leave a document to understand its first paragraph.

This applies to READMEs, task briefs, and research documents alike. Units (kWh, MW, €/MWh) and chemical symbols do not need expanding.

---

## 1. Project and governance

| Term | Meaning |
|---|---|
| **INCOSE** | International Council on Systems Engineering — the international professional body for systems engineering |
| **GfSE** | Gesellschaft für Systems Engineering — the German-language chapter organisation of INCOSE |
| **WG** | Working Group |
| **Task-Force / TF** | The Regeneration Task-Force — the sub-structure of the Sustainability WG that owns this workspace |
| **SEBoK** | Systems Engineering Body of Knowledge — the community reference work for systems engineering |
| **SolarX** | *Project-specific.* The fictional conventional photovoltaics company used as the as-is baseline. Its system model lives in `../System Model/SolarX/` |
| **SustainaSun** | *Project-specific.* The regenerative future state SolarX is transformed into — the to-be case |
| **SustainableTogether** | The overall INCOSE/GfSE Sustainability WG project this Task-Force sits inside |

---

## 2. Research method

| Term | Meaning |
|---|---|
| **RQ** | Research Question. The three top-level questions are RQ1 (viability), RQ2 (conditions), RQ3 (methodology). Sub-questions are numbered RQ1.1, RQ1.2, … — see [`RQ-DECOMPOSITION.md`](RQ-DECOMPOSITION.md) |
| **DRM** | Design Research Methodology — the research frame used here (Blessing & Chakrabarti, 2009). Runs RC → DS-I → PS → DS-II → Writing |
| **RC** | Research Clarification — DRM stage 1: fix the research questions and success criteria. Locked in `00-foundations/RC-research-clarification.md` |
| **DS-I** | Descriptive Study I — DRM stage 2: understand the existing situation (literature review + empirical study) |
| **PS** | Prescriptive Study — DRM stage 3: develop the design support (here: the 10-step approach and the models) |
| **DS-II** | Descriptive Study II — DRM stage 4: evaluate whether the design support works |
| **C1–C8** | The eight success criteria that determine whether the thesis is proven. Defined in the Research Clarification |
| **PRISMA** | Preferred Reporting Items for Systematic Reviews and Meta-Analyses — the protocol governing the literature review in `_research/` |
| **CQ** | Competency Question — in ontology engineering, a question the ontology must be able to answer. Used to scope the IVIO ontology |
| **PoC** | Proof of Concept |
| **TRL** | Technology Readiness Level — 1 (basic principle) to 9 (proven in operation). Used to rate the 144 solutions in the taxonomy |
| **TBD** | To Be Determined — a value the Task-Force must still set, deliberately not asserted |

---

## 3. Regeneration theory

| Term | Meaning |
|---|---|
| **DO** | Desired Outcome — the unit of design in this project. Something the system makes improve, repeatedly, over its life. The eight of them (DO-1 … DO-8) are defined in `03-methodology/01-desired-outcomes-interface.md` |
| **Regenerative dynamics** | Fischer et al. (2024): an outcome that rises repeatedly, is partly self-perpetuating, but still needs ongoing input — the "upward helix" |
| **Degenerative dynamics** | The mirror image: an outcome that declines repeatedly and self-perpetuates downward. What conventional PV runs on |
| **Restoration** | Fixing damage once, from outside the system. A *prerequisite* for regeneration, not the same thing |
| **Triple Top Line** | Economy + Ecology + Equity, all positive. No capital may be traded off against another (McDonough & Braungart) |
| **Five capitals** | Natural, human, social, manufactured, financial. The design must model value flowing across all five |
| **C2C** | Cradle to Cradle — McDonough & Braungart's design framework of technical and biological material cycles |
| **9R** | The circular-economy strategy hierarchy (Refuse, Rethink, Reduce, Reuse, Repair, Refurbish, Remanufacture, Repurpose, Recycle, Recover) |
| **NbS** | Nature-based Solutions |
| **ANR** | Assisted Natural Regeneration |
| **FMNR** | Farmer-Managed Natural Regeneration |
| **TEK** | Traditional Ecological Knowledge — treated in this workspace as first-class engineering knowledge, not appendix material |
| **FPIC** | Free, Prior and Informed Consent — the consent standard for engaging Indigenous knowledge and territory |
| **CARE** | Collective benefit, Authority to control, Responsibility, Ethics — the Principles for Indigenous Data Governance |
| **ReFi** | Regenerative Finance — the crypto-adjacent movement financing ecological outcomes. Critiqued, not endorsed, in this workspace |

---

## 4. Business model and finance

| Term | Meaning |
|---|---|
| **BM** | Business Model |
| **PVaaS** | Photovoltaics-as-a-Service — the locked business-model direction. SustainaSun sells the outcome (clean energy plus ecological and social value) as an ongoing service and retains asset ownership |
| **PaaS** | Product-as-a-Service — the general service-model archetype PVaaS instantiates |
| **PSS** | Product-Service System |
| **FBMC** | Flourishing Business Model Canvas — the sustainability-oriented canvas used to structure the SustainaSun business model |
| **SSBMO** | Strongly Sustainable Business Model Ontology — the formal ontology underlying the FBMC (Upward & Jones) |
| **NPV** | Net Present Value — all future cash flows discounted back to today's money. NPV > 0 means the project earns more than the demanded discount rate, i.e. it creates value |
| **IRR** | Internal Rate of Return — the discount rate at which NPV would equal zero; effectively the project's own rate of return. IRR ≥ 8% clears the bar typical for utility-scale PV |
| **WACC** | Weighted Average Cost of Capital — the blended cost of debt and equity. Lowering it raises project value; community equity is modelled as a ~50–100 bps reduction |
| **bps** | Basis points — hundredths of a percentage point. 100 bps = 1% |
| **CAPEX** | Capital Expenditure — up-front investment cost |
| **OPEX** | Operating Expenditure — ongoing running cost |
| **O&M** | Operation and Maintenance |
| **EPC** | Engineering, Procurement and Construction — the build contract model for PV plants |
| **LCOE** | Levelised Cost of Electricity — lifetime cost divided by lifetime generation, in €/MWh |
| **DSCR** | Debt Service Coverage Ratio — cash available for debt service divided by debt service due. A lender's covenant metric |
| **ROI** | Return on Investment |
| **PPA** | Power Purchase Agreement — a long-term contract to buy electricity at an agreed price |
| **ESG** | Environmental, Social and Governance — the mainstream investor reporting lens |
| **Bankable** | A revenue line a lender or investor will underwrite today, as opposed to *optionality* (may become real) or *non-bankable* (real value, but not financeable) |

---

## 5. Modelling, MBSE and digital engineering

| Term | Meaning |
|---|---|
| **MBSE** | Model-Based Systems Engineering — using a formal model, rather than documents, as the authoritative system description |
| **SysML** | Systems Modeling Language. This project uses **SysML v2** textual notation exclusively |
| **SYSMOD** | The Systems Modeling Toolbox — the 9-step MBSE method used to build the SolarX model (Weilkiens) |
| **SD** | System Dynamics — modelling how a system behaves over time through stocks, flows, and feedback |
| **CLD** | Causal Loop Diagram — the qualitative System Dynamics notation showing variables and the polarity of their causal links |
| **R1, R2, …** | Reinforcing loops in a CLD — feedback that amplifies change (the upward helix, or a vicious circle) |
| **B1, B2, …** | Balancing loops in a CLD — feedback that resists change and imposes limits |
| **Leverage point** | A place in the system structure where a small intervention produces a large systemic effect (Meadows) |
| **DE** | Digital Engineering — here, the semantic integration and automation layer (`07-digital-engineering/`) |
| **IVIO** | Integrated Viability & Impact Ontology — the project's own ontology covering how a system creates, captures, costs, and consumes value. Namespace `https://w3id.org/sustainabletogether/ivio#` |
| **RDF** | Resource Description Framework — the W3C graph data model (subject–predicate–object triples) |
| **RDFS** | RDF Schema — the basic vocabulary layer on top of RDF |
| **OWL** | Web Ontology Language — the W3C language for formal ontologies |
| **SPARQL** | The W3C query language for RDF graphs |
| **SHACL** | Shapes Constraint Language — W3C standard for validating RDF graphs against constraints |
| **SKOS** | Simple Knowledge Organization System — W3C vocabulary for thesauri and concept schemes |
| **PROV** | The W3C provenance ontology — records where a statement came from |
| **QUDT** | Quantities, Units, Dimensions and Types — the ontology for units of measure |
| **TTL / Turtle** | Terse RDF Triple Language — the human-readable RDF file format (`.ttl`) |
| **TBox** | The terminological box of a knowledge graph: the classes and properties (the schema). Here, `fbmc-cld.ttl` |
| **ABox** | The assertional box: the actual instances. Here, `registry_latest.ttl` |
| **URI / IRI** | Uniform / Internationalized Resource Identifier — the globally unique name of a concept in the graph |
| **L0 – L4** | The five integration maturity levels of the Semantic Integration Playbook, from L0 (conceptual alignment) to L4 (linked knowledge graph) |
| **I1 – I7** | The seven invariants the concept registry must satisfy, checked by `validate_registry.py` |
| **SysIDE** | The VS Code extension used to validate SysML v2 textual models |
| **openLCA** | The open-source LCA software the model connects to over its IPC interface |

---

## 6. Life-cycle assessment and environment

| Term | Meaning |
|---|---|
| **LCA** | Life Cycle Assessment — quantifying environmental impact across a product's whole life, per ISO 14040/14044 |
| **LCI** | Life Cycle Inventory — the input/output data an LCA is built from |
| **LCIA** | Life Cycle Impact Assessment — translating inventory data into impact categories |
| **GHG** | Greenhouse Gas |
| **gCO₂eq/kWh** | Grams of carbon-dioxide equivalent per kilowatt-hour — the lifecycle carbon intensity metric. DO-5 targets < 15 |
| **EPD** | Environmental Product Declaration — a third-party-verified LCA disclosure. The evidence base for the low-carbon premium |
| **BoS** | Balance of System — everything in a PV installation other than the modules (inverters, mounting, cabling, civil works) |
| **EOL** | End of Life — the decommissioning and material-recovery phase |
| **DfD** | Design for Disassembly — designing so components can be separated and recovered at EOL |
| **DPP** | Digital Product Passport — the EU-mandated digital record of a product's composition and lifecycle, enabling material recovery |
| **MRV** | Monitoring, Reporting and Verification — the protocol proving a claimed outcome actually happened. Defined in `06-lca-and-financial/mrv-protocol.md`. *(Some literature expands the M as "Measurement"; this workspace uses "Monitoring" throughout.)* |
| **SOC** | Soil Organic Carbon — the DO-1 metric, measured at fixed depth and corrected for bulk density |
| **EOV** | Ecological Outcome Verification — Savory Institute / Land to Market's outcome-based (not practice-based) land verification standard |
| **LER** | Land Equivalent Ratio — how much land a single-use system would need to match a dual-use system's combined output. Values > 1 are frequently over-claimed; see the PV dossier critique |
| **Agrivoltaics** | Combined agricultural and photovoltaic use of the same land |
| **CDR** | Carbon Dioxide Removal |
| **DAC** | Direct Air Capture |
| **ERW** | Enhanced Rock Weathering |
| **OAE** | Ocean Alkalinity Enhancement |

---

## 7. Standards, regulation and reporting frameworks

| Term | Meaning |
|---|---|
| **EU** | European Union |
| **ISO 14040 / 14044** | The international standards defining LCA principles and requirements |
| **CSRD** | Corporate Sustainability Reporting Directive — the EU sustainability reporting mandate |
| **ESRS** | European Sustainability Reporting Standards — the reporting standards CSRD is executed through |
| **CSDDD** | Corporate Sustainability Due Diligence Directive — EU supply-chain due-diligence obligations |
| **ESPR** | Ecodesign for Sustainable Products Regulation — the EU regulation that introduces the Digital Product Passport |
| **RED III** | Renewable Energy Directive III — the current EU renewables framework |
| **WEEE** | Waste Electrical and Electronic Equipment Directive — the EU take-back obligation covering PV modules |
| **EU Taxonomy** | The EU classification of environmentally sustainable economic activities |
| **SFDR** | Sustainable Finance Disclosure Regulation |
| **CBAM** | Carbon Border Adjustment Mechanism — the EU carbon tariff on imported goods; relevant to DO-8 supplier data |
| **EU ETS** | EU Emissions Trading System — the European carbon market |
| **NRL** | Nature Restoration Law — the EU restoration regulation |
| **BNG** | Biodiversity Net Gain — the UK planning requirement that development leave biodiversity measurably better |
| **EIA** | Environmental Impact Assessment |
| **TNFD** | Taskforce on Nature-related Financial Disclosures — the nature-risk reporting framework |
| **LEAP** | Locate, Evaluate, Assess, Prepare — TNFD's assessment approach |
| **SBTN** | Science Based Targets Network — science-based targets for nature |
| **SBTi** | Science Based Targets initiative — science-based targets for climate |
| **ICVCM** | Integrity Council for the Voluntary Carbon Market |
| **CCP** | Core Carbon Principles — ICVCM's quality threshold for carbon credits |
| **ROC** | Regenerative Organic Certified |
| **EEG** | Erneuerbare-Energien-Gesetz — the German Renewable Energy Sources Act |
| **CRE** | Commission de régulation de l'énergie — the French energy regulator, whose low-carbon PV tenders are the reference precedent for a low-carbon premium |
| **NDC** | Nationally Determined Contribution — a country's pledge under the Paris Agreement |
| **OSH** | Occupational Safety and Health |

---

## 8. Technology and materials

| Term | Meaning |
|---|---|
| **PV** | Photovoltaic(s) — solar electricity generation |
| **c-Si** | Crystalline silicon — the dominant PV cell technology |
| **TOPCon** | Tunnel Oxide Passivated Contact — a high-efficiency silicon cell architecture |
| **HJT** | Heterojunction Technology — an alternative high-efficiency cell architecture |
| **FRELP** | Full Recovery End-of-Life Photovoltaic — a high-recovery PV recycling process |
| **ROSI** | A French PV recycling process recovering silicon and silver at high purity |
| **Si / Ag** | Silicon / silver — the high-value materials recovered at EOL |
| **V2G** | Vehicle-to-Grid |
| **P2P** | Peer-to-peer (energy trading) |
| **MW / MWp** | Megawatt / megawatt-peak (PV nameplate capacity under standard test conditions) |
| **kWh / MWh / GWh / TWh** | Kilowatt-, megawatt-, gigawatt-, terawatt-hour — units of energy |

---

## 9. Organisations and data sources

| Term | Meaning |
|---|---|
| **IEA** | International Energy Agency |
| **IEA-PVPS** | The IEA's Photovoltaic Power Systems Programme. **Task 12** produces the reference PV life-cycle assessment methodology and baselines used here |
| **IRENA** | International Renewable Energy Agency |
| **NREL** | National Renewable Energy Laboratory (United States) |
| **Fraunhofer ISE** | Fraunhofer Institute for Solar Energy Systems — publisher of the annual Photovoltaics Report |
| **EMF** | Ellen MacArthur Foundation — the circular-economy institution |
| **IBU** | Institut Bauen und Umwelt — a German EPD programme operator |
| **DGRV** | Deutscher Genossenschafts- und Raiffeisenverband — the German cooperative federation; source of energy-cooperative statistics |
| **REScoop.eu** | The European federation of citizen energy cooperatives |
| **BfN** | Bundesamt für Naturschutz — the German Federal Agency for Nature Conservation |
| **IPBES** | Intergovernmental Science-Policy Platform on Biodiversity and Ecosystem Services |
| **IUCN** | International Union for Conservation of Nature |
| **FAO** | Food and Agriculture Organization of the United Nations |
| **UNEP** | United Nations Environment Programme |
| **OECD** | Organisation for Economic Co-operation and Development |
| **OP2B** | One Planet Business for Biodiversity — the WBCSD-hosted corporate coalition |
| **ILFI / LBC** | International Living Future Institute / Living Building Challenge — the regenerative building standard |
| **GIAHS** | Globally Important Agricultural Heritage Systems (FAO) |
| **MARRS** | Mars Assisted Reef Restoration System — a coral-reef restoration method cited in the solution taxonomy |
| **WALFA** | West Arnhem Land Fire Abatement — the Aboriginal "cool burning" fire-management project cited in the solution taxonomy |

---

## 10. Repository and tooling

| Term | Meaning |
|---|---|
| **PR** | Pull Request |
| **CI/CD** | Continuous Integration / Continuous Deployment |
| **MkDocs** | The static-site generator building the project documentation site |
| **draw.io** | The diagram tool (`.drawio` files) used for CLDs and ontology diagrams |
| **IPC** | Inter-Process Communication — how the SysML pipeline talks to openLCA (port 8080) |

---

## Adding to this glossary

If you introduce an abbreviation anywhere in `Regeneration/`, add it here in the same commit. If a term is project-specific rather than a standard abbreviation, mark it *Project-specific* so readers know not to search for it externally.

**Related:** [`RQ-DECOMPOSITION.md`](RQ-DECOMPOSITION.md) · [`README.md`](README.md) · [`03-methodology/01-desired-outcomes-interface.md`](03-methodology/01-desired-outcomes-interface.md)
