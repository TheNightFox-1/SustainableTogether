# Sustainability WG — Stakeholder Mapping Project

Welcome to the INCOSE Sustainability Working Group's ecosystem analysis initiative. This project systematically identifies, categorizes, and analyzes the organizations and networks relevant to sustainable systems engineering.

## Project Overview

The stakeholder map serves **three primary goals** and one **exploratory goal** (nice-to-have):

### Goal 1 — Identify Organizations to Learn From
Find organizations whose expertise in sustainability, systems thinking, standards, or domain knowledge can inform and strengthen the WG's work.

### Goal 2 — Identify Organizations to Collaborate With
Map organizations and networks with whom the WG can partner to develop and deliver sustainable solutions, joint publications, events, or tools.

### Goal 3 — Understand Target Audience & Industry Needs
Identify who the WG's primary audience is (SE practitioners, industries, educators, etc.), what they need, and what gaps exist. **This goal feeds directly into the "Understanding Industry Needs" sub-project.**

### Nice to Have — Network Science & Synergy Analysis
Apply network science methods to identify structural synergies in the ecosystem: broker organizations, emerging clusters, leverage points, and collaboration windows. Requires 30–40 stakeholder nodes and mature relationship data.

---

## Stakeholder Taxonomy & Categorization

### Organization Classification

The ecosystem can be organized along **multiple meaningful dimensions** — not just Inside/Outside INCOSE. See **CATEGORIZATION.md** for 9 alternative schemas:

1. **Decision-Making Authority** — Who sets the rules? (Policy-Makers, Standards-Setters, Market Leaders, Advocates, Implementers, Learners)
2. **SE Engagement Level** — How aware of systems engineering? (Unaware, Aware, Engaged, Expert)
3. **Sector/Domain** — What problems do they solve? (Energy, Transportation, Circular Economy, Finance, IT, etc.)
4. **Organization Size & Scale** — How large is their reach? (Global Mega, Large Regional, Mid-Market, Small, Startup, Network)
5. **Sustainability Maturity** — How advanced? (Leader, Committed, Aware, Lagging)
6. **Collaborative Readiness** — How willing to partner? (Ready to Co-Develop, Open, Cautious, Distant, Resistant)
7. **Engagement Stage** — Where in our journey? (Identified, Prospect, Engaged, Active, Dormant, Concluded)
8. **Geographic Focus** — Where do they operate? (Global, Continental, National, Regional, Distributed)
9. **Flow Contribution** — What do they bring? (Knowledge, Standards, Funding, Audience, Implementation, Advocacy, Talent)

**Recommendation:** Use a **multi-dimensional model** in Airtable with all categorizations. This enables rich filtering and insight discovery (e.g., "Show me Global Mega-Orgs in Energy that are Sustainability Leaders with high Collaborative Readiness").

### Primary Role Categories

| Role | Description |
|------|-------------|
| Working Groups | Other INCOSE or external WGs with overlapping mandates |
| NGOs | Non-governmental organizations focused on sustainability, environment, or policy |
| Research Groups / Institutes | Academic and independent research centers |
| INCOSE Members (SE Practitioners) | Individual practitioners — *to be confirmed whether included as separate nodes* |
| INCOSE TechOps | INCOSE technical operations function |
| Other INCOSE Working Groups | Sibling working groups within INCOSE |
| INCOSE Leadership | Board and executive leadership |
| INCOSE Chapters | Regional and national INCOSE chapters |
| Industrial Companies | Private sector organizations applying SE |
| Industry Consortiums & Sectorial Alliances | Cross-company or cross-sector industry bodies |
| Consulting Firms | SE or sustainability consultancies |
| Educators & Academia | Universities, professors, curriculum developers |
| Early-Career Professionals | Students and early-career SE practitioners |
| INCOSE Existing Liaisons | Formally established liaison relationships |
| Standards Bodies | ISO, IEC, IEEE — distinct role for standards producers |
| Policy Makers / Regulators | Government agencies, ministries, regulatory bodies |

### Suggested Additional Roles

- Think Tanks (research to policy bridge)
- Funding Bodies / Grant Agencies (EU Horizon, NSF, national research councils)
- Professional Associations (IEEE, SAE, PMI, AIAA)
- Corporate Sustainability / ESG Officers
- Technology Providers / Tool Vendors (Siemens, Dassault, PTC)
- Systems Engineers in Regulated Industries (aerospace, defense, medical, energy)
- Project / Program Managers
- Procurement & Supply Chain Functions
- Students & University Programs
- Media & Communication Channels (LinkedIn, newsletters, podcasts)

### Organizational Classification

All stakeholders are categorized as:
- **Inside INCOSE** — entities part of INCOSE structure
- **Outside INCOSE** — external organizations, networks, institutions

---

## Information Stack

### Inside INCOSE — Core Data Fields

| Field | Description | Type | Applicable Goals |
|-------|-------------|------|------------------|
| INCOSE entity type | WG / TechOps / Leadership / Chapter / Member / Liaison | Enum | G1, G2 |
| Entity full name | Official INCOSE name per governance docs | Text | G1, G2 |
| Charter / mandate summary | Formal tasks — critical for overlap detection | Text | G1, G2 |
| Current leadership / contact | President, chair, or primary point of contact | Text | G2 |
| Geographic scope | Global / Regional / National / Local | Enum | G2, G3 |
| Active sustainability initiatives | Current projects, papers, activities touching sustainability | Text | G1, G2 |
| Membership size / reach | Approximate number of members or practitioners reached | Number | G3 |
| Communication channels | Newsletter, Slack, mailing list, how to reach members | Text | G3 |
| Formal liaison status | Formal liaison agreement with SuWG | Boolean | G2 |

**Suggested fields** (refine after pilot data):
- SE maturity level (basic / practitioner / advanced)
- Budget / resource availability (for co-funding activities)
- Decision-making speed (how quickly can they commit)

### Outside INCOSE — Core Data Fields

| Field | Description | Type | Applicable Goals |
|-------|-------------|------|------------------|
| Organization name | Legal or commonly used name | Text | G1, G2 |
| Organization type | NGO / Research / Industrial / Consortium / Academia / Policy Body | Enum | G1, G2 |
| Geographic scope | Global / Regional / National + HQ country | Enum | G2, G3 |
| Primary domain / focus area | Circular economy, LCA, climate policy, eco-design, social sustainability | Text | G1 |
| Key publications / outputs | Landmark reports, standards, frameworks produced | Text | G1 |
| Website / contact | Primary online presence and entry point | URL | G2 |
| Key contact person | Name and role of best outreach contact | Text | G2 |
| Audience served | Who does this org speak to — practitioners, policymakers, companies, students | Text | G3 |
| Funding model | Public / Private / Membership / Grant-funded | Enum | G2 |

**Suggested fields** (synergy & network analysis):
- Standards or certifications issued
- Open data / publications policy (CC-licensed, open access, proprietary)
- Languages of operation
- SDG alignment (UN Sustainable Development Goals)
- SE awareness level (awareness / engagement with systems engineering)

### Relationship Fields — Between Any Two Stakeholders

| Field | Description | Type | Purpose |
|-------|-------------|------|---------|
| Relationship type | Formal / Informal / Aspirational / Historical | Enum | G2, Network |
| Direction | Unidirectional (A→B) or Bidirectional (A↔B) | Enum | Network |
| Strength / frequency | Strong / Weak / Dormant | Enum | Network |
| Relationship origin | How formed (event, publication, referral, liaison) | Text | G2 |
| Date established | When first formed — enables temporal analysis | Date | Network |
| Primary contact each side | Named person holding relationship on each side | Text | G2 |

**Suggested fields** (flow & synergy):
- Flow type (Knowledge / Funding / Co-authorship / Audience reach / Standards influence / Talent pipeline / Legitimacy / Data)
- Collaboration potential score (1–5)
- Blocker / gap (what prevents stronger relationship)
- Shared goals overlap (which of G1, G2, G3 this relationship serves)
- Last interaction date (identify dormant relationships)

### Synergy-Specific Fields — For Ecosystem Leverage Analysis

| Field | Description | Type | Notes |
|-------|-------------|------|-------|
| Broker potential | Does this org sit between otherwise disconnected clusters? | Computed | Derived from betweenness centrality |
| Audience overlap index | Estimated % overlap between org's audience and INCOSE SE practitioners | 0–100% | Start as expert estimate; refine with survey |
| Complementary capability | What does this org have that we lack, and vice versa | Text | Asymmetry = where synergy lives |
| Co-production readiness | Willingness and capacity to jointly produce content, tools, events | Low/Med/High | Assessed during outreach |
| Influence reach | Estimated practitioners/orgs this stakeholder can indirectly influence | Number | Proxy for indirect reach |
| Sustainability maturity | How advanced is their sustainability thinking | Lagging/Emerging/Leading | For targeted engagement strategy |
| Knowledge gap they have | What do they need that we could provide | Text | Unlocks two-way value exchange |
| Trigger event / window | Upcoming conference, publication, policy moment creating collaboration window | Date + Text | Time-sensitive catalysts |

### Engagement Tracking Fields

| Field | Description | Type |
|-------|-------------|------|
| Engagement status | Prospect / In outreach / Active / Inactive | Enum |
| Priority level | High / Medium / Low | Enum |
| Engagement score | 0–100% estimated engagement depth | Number |
| Notes | Free text — key contacts, context, next steps | Text |
| Last updated | Date of last data update | Date |

---

## Relationship Types & Flow

### Relationship Categories

| Type | Description | Direction |
|------|-------------|-----------|
| Formal liaison | Officially established INCOSE liaison agreement | Bidirectional |
| Collaboration (active) | Joint project, publication, or event underway | Bidirectional |
| Collaboration (planned) | Agreed but not yet started | Bidirectional |
| Knowledge flow | One org learns from / cites the other | Unidirectional |
| Audience overlap | Serve overlapping practitioner/stakeholder audiences | Bidirectional |
| Standards alignment | One org's standards inform or constrain the other | Unidirectional |
| Funding relationship | One org funds or grants to the other | Unidirectional |
| Membership / affiliation | One org is member body or affiliate of the other | Unidirectional |
| Alumni / spin-off | One org originated from or is staffed by alumni | Unidirectional |
| Competitive / overlapping mandate | Both orgs address similar problems — potential for merger of effort | Bidirectional |
| Aspirational / target | Relationship that should be created | Unidirectional |

### What Flows Across Relationships

Tagging each relationship with **flow type** enables synergy analysis:

- **Knowledge** — research, expertise, methodologies, frameworks
- **Funding** — grants, in-kind support, co-investment
- **Audience reach** — access to practitioners, members, decision-makers
- **Co-authorship** — joint publications, white papers, standards contributions
- **Standards influence** — one party shaping or being shaped by standards work
- **Talent pipeline** — students, early-career professionals, speakers
- **Legitimacy / endorsement** — association increases credibility
- **Data / evidence** — research data, survey results, case studies

---

## Network Science — Synergy Analysis

### Minimum Viable Dataset

- At least **30–40 stakeholder nodes** with complete role and goal fields
- At least **1.5 relationships per node** on average (~50+ edges for 30 nodes)
- **Relationship direction** and **flow type** tagged on all edges

### Key Metrics to Compute

| Metric | What it tells you | Tool |
|--------|------------------|------|
| Degree centrality | Which orgs have most direct connections | Gephi / NetworkX |
| Betweenness centrality | Which orgs bridge otherwise disconnected clusters (broker potential) | Gephi / NetworkX |
| Clustering coefficient | How tightly knit are sub-communities | NetworkX |
| Community detection | Which natural clusters / sub-ecosystems exist | Gephi (modularity) |
| Ego network analysis | What does immediate neighborhood of key org look like | NetworkX |
| Temporal analysis | How is network growing / changing over time | Gephi timeline |

### Finding Synergies

1. **Identify brokers** — nodes with high betweenness but low clustering. Engaging them unlocks cross-cluster collaboration.
2. **Find structural holes** — pairs of clusters with no current bridge. Opportunity for SuWG to become the bridge.
3. **Map flow asymmetries** — if knowledge flows one-way but not back, there is unexploited reciprocal value exchange.
4. **Detect emerging clusters** — new clusters around shared topics (circular economy + SE) signal emerging synergies to accelerate.
5. **Trigger event alignment** — overlay trigger dates with network map to identify which time windows activate high-potential relationships.

---

## Recommended Tooling

### Full Stack

| Tool | Purpose | Cost |
|------|---------|------|
| Airtable / Notion | Stakeholder registry and information stack | Free tier |
| Kumu.io | Relationship mapping and ecosystem visualization | Free (public maps) |
| Gephi | Network analysis and community detection | Open source |
| NetworkX (Python) | Programmatic graph analysis and metrics | Open source |
| VOSviewer | Bibliometric co-authorship and keyword maps | Open source |
| Tally / Google Forms | Audience needs surveys | Free |
| HubSpot CRM (free) | Outreach and engagement tracking | Free tier |

### Recommended Starting Stack (Volunteer WG)

1. **Airtable** — stakeholder registry + relationships
2. **Kumu.io** — visualization (once 30+ nodes)
3. **Tally** — audience survey (Goal 3 data)
4. **Gephi** — network analysis (when dataset mature)

---

## Data Model Summary

```
Stakeholder
├── id
├── name
├── category: Inside INCOSE | Outside INCOSE
├── role: [primary or suggested role]
├── geographic_scope
├── goals_relevant: [G1, G2, G3, Network]
├── priority: High | Medium | Low
├── engagement_status: Prospect | Outreach | Active | Inactive
├── engagement_score: 0–100
├── expertise / focus_area
├── audience_served
├── key_contact
├── communication_channels
├── active_sustainability_initiatives
├── se_awareness_level          # suggested
├── sdg_alignment               # suggested
├── sustainability_maturity     # suggested
├── audience_overlap_index      # synergy
├── complementary_capability    # synergy
├── co_production_readiness     # synergy
├── influence_reach             # synergy
├── knowledge_gap_they_have     # synergy
├── trigger_event               # synergy
├── notes
└── last_updated

Relationship (edge between two Stakeholders)
├── id
├── source_stakeholder_id
├── target_stakeholder_id
├── relationship_type
├── direction: Unidirectional | Bidirectional
├── strength: Strong | Weak | Dormant
├── flow_type: [Knowledge, Funding, Audience reach, Co-authorship, ...]
├── collaboration_potential_score: 1–5
├── blocker_gap
├── shared_goals_overlap
├── origin
├── date_established
├── last_interaction_date
├── primary_contact_source
├── primary_contact_target
└── notes
```

---

## Deliverables & Phases

### Phase 1 — Definition & Structure (Current)
- [x] Define goals and scope
- [x] Establish stakeholder role taxonomy
- [x] Design information stack (core + suggested fields)
- [x] Define relationship types and flow categories
- [ ] Select and configure tooling (Airtable + Kumu.io)
- [ ] Create data entry templates
- [ ] Validate with 5–10 pilot stakeholders

### Phase 2 — Build & Analyze (30–40 nodes)
- [ ] Populate stakeholder registry (core data)
- [ ] Map key relationships and flow types
- [ ] Visualize in Kumu.io (structural view)
- [ ] Run initial network metrics (Gephi)
- [ ] Identify brokers and structural holes
- [ ] Conduct audience needs survey (Tally)

### Phase 3 — Strategic Application
- [ ] Produce outreach roadmap based on priority tiers
- [ ] Develop collaboration playbook (with targeted orgs)
- [ ] Share findings with SuWG leadership
- [ ] Publish ecosystem health report (public or internal)

---

## Open Questions

1. **Individual members?** Should individual INCOSE SE practitioners be included as nodes, or only organizations?
2. **Minimum dataset size?** What constitutes "ready for network analysis"?
3. **Data ownership?** Who owns entry and maintenance within the WG — dedicated role or shared?
4. **Privacy?** Should the map be public (shareable with external stakeholders) or private (internal WG)?
5. **Update cadence?** How frequently should the network be re-analyzed for emerging synergies?
6. **Integration?** Is there existing INCOSE CRM or database that should be integrated or avoided?

---

## Related Projects

- **Understanding Industry Needs** — parallel effort defining what target stakeholders need
- **SustainableTogether** — parent sustainability initiative and modeling workspace

---

## How to Contribute

This is a collaborative mapping initiative. Contributions include:
- Stakeholder identification and research
- Relationship discovery and validation
- Taxonomy refinement
- Network analysis and pattern discovery
- Outreach and engagement
- Documentation and communication

---

**Project Status:** Phase 1 — Definition & Structure  
**Last Updated:** 2026-04-16  
**Maintained by:** INCOSE Sustainability Working Group
