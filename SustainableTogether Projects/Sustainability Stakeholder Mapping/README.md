# Sustainability WG — Stakeholder Mapping Project

Systematic identification, categorization, and analysis of organizations and networks relevant to sustainable systems engineering within INCOSE.

---

## Project Goals

| Goal | Description | Feeds Into |
|------|-------------|-----------|
| **Goal 1** | Identify organizations whose expertise can inform and strengthen the SuWG's work | Strategic positioning |
| **Goal 2** | Map organizations and networks for partnership on sustainable solutions, publications, events, tools | Collaboration roadmap |
| **Goal 3** | Understand target audience (SE practitioners, industries, educators) and their needs | Industry Needs project |

---

## Scope & Deliverables

| Phase | Timeline | Key Activities | Output |
|-------|----------|-----------------|--------|
| **Phase 1: Definition** | Months 1–2 | Define taxonomy, information stack, relationship types; configure tooling; pilot 5–10 stakeholders | Data schema; Airtable configured; 10-node pilot |
| **Phase 2: Build & Analyze** | Months 3–6 | Populate 30–40 stakeholders; map relationships; visualize in Kumu; run network metrics (Gephi) | Registry (30–40 nodes); network visualizations; initial metrics |
| **Phase 3: Strategic Action** | Months 7–9 | Interpret findings; develop outreach roadmap; negotiate partnerships; publish insights | Engagement strategy; partnership agreements; ecosystem report |

---

## Stakeholder Taxonomy

### Organization Classification System

Use **9 overlapping categorization dimensions** to analyze stakeholders from multiple angles. See **CATEGORIZATION.md** for full definitions.

| Dimension | Categories | Use For |
|-----------|------------|---------|
| **Decision Authority** | Policy-Maker, Standards-Setter, Market Leader, Ecosystem Builder, Advocate, Implementer, Learner | Who has power to mandate change? |
| **SE Engagement** | Unaware, Aware, Engaged, Expert | How much SE knowledge do they have? |
| **Sector/Domain** | Energy, Transportation, Circular Economy, Finance, IT, Governance, Education, Health, etc. | What problems do they solve? |
| **Scale** | Global Mega, Large Regional, Mid-Market, Small, Startup, Network | How large is their reach? |
| **Sustainability Maturity** | Leader, Committed, Aware, Lagging | How advanced is their practice? |
| **Collaborative Readiness** | Ready to Co-Develop, Open, Cautious, Distant, Resistant | How willing to partner? |
| **Engagement Stage** | Identified, Prospect, Engaged, Active, Dormant, Concluded | Where in our journey? |
| **Geography** | Global, Continental, National, Regional, Distributed | Where do they operate? |
| **Flow Contribution** | Knowledge, Standards, Funding, Audience, Implementation, Advocacy, Talent | What do they bring? |

**Recommended Implementation:** Add all 9 dimensions to Airtable. Use multi-dimensional filtering to identify high-value targets.

---

## Information Architecture

### Stakeholder Fields

| Category | Core Fields | Suggested Fields | Phase |
|----------|------------|-----------------|-------|
| **Identification** | name, organization_type, category | — | 1 |
| **Strategic Context** | charter_mandate, primary_domain, geographic_scope | standards_issued, sdg_alignment | 1, 2 |
| **Contact** | key_contact_name, key_contact_email, website | — | 1 |
| **Engagement** | engagement_status, priority_level, engagement_score | collaborative_readiness | 1, 2 |
| **Reach & Influence** | audience_served, funding_model | audience_overlap_index, influence_reach | 1, 2 |
| **Sustainability** | active_initiatives | sustainability_maturity, se_awareness_level | 1, 2 |

**Total:** 36 core fields (Phase 1) + 16 suggested fields (Phase 2)

See **FIELDS.md** for complete field reference with types and definitions.

### Relationship Fields

| Type | Core (Phase 1) | Suggested (Phase 2) |
|------|----------|---------|
| **Definition** | relationship_type, direction, strength_frequency, date_established | flow_type, collaboration_potential_score |
| **Contact** | primary_contact_source, primary_contact_target | — |
| **Classification** | origin_description | blocker_gap, shared_goals_overlap |

### Relationship Types

| Type | Direction | Meaning |
|------|-----------|---------|
| Formal Liaison | Bidirectional | Officially established agreement |
| Collaboration (Active) | Bidirectional | Joint work underway |
| Collaboration (Planned) | Bidirectional | Agreed but not yet started |
| Knowledge Flow | Unidirectional | One org learns from the other |
| Audience Overlap | Bidirectional | Serve overlapping practitioners |
| Standards Alignment | Unidirectional | One org's standards inform the other |
| Funding Relationship | Unidirectional | One funds the other |
| Membership/Affiliation | Unidirectional | Structural relationship |
| Alumni/Spin-off | Unidirectional | Historical origin |
| Competitive Overlap | Bidirectional | Both address similar problems |
| Aspirational Target | Unidirectional | Relationship to be created |

### Flow Types (What Travels on Relationships)

| Flow Type | Description |
|-----------|-------------|
| Knowledge | Research, expertise, frameworks, methodologies |
| Funding | Grants, in-kind support, co-investment |
| Audience Reach | Access to practitioners, members, communities |
| Co-authorship | Joint publications, standards contributions |
| Standards Influence | Shaping compliance and regulatory frameworks |
| Talent Pipeline | Students, speakers, early-career professionals |
| Legitimacy/Endorsement | Credibility by association |
| Data/Evidence | Research data, survey results, case studies |

---

## Network Analysis Metrics

Apply network science to ecosystem structure at Phase 2 (30–40 nodes). See **NETWORK_SCIENCE.md** for methodology.

| Metric | Definition | Use For |
|--------|-----------|---------|
| **Degree Centrality** | Number of direct connections | Identify well-integrated organizations |
| **Betweenness Centrality** | Frequency on shortest paths between nodes | Find brokers and structural bridges |
| **Clustering Coefficient** | How densely connected are local neighborhoods | Identify tight sub-communities |
| **Community Detection** | Natural clusters in the network (modularity) | Segment ecosystem into sectors/clusters |
| **Ego Network Analysis** | Immediate neighborhood of key organizations | Understand influence sphere and reach |
| **Temporal Metrics** | Network growth, dormancy, evolution | Track momentum and readiness for scaling |

---

## Tooling

| Tool | Purpose | Cost | Status |
|------|---------|------|--------|
| **Airtable** | Stakeholder registry + relationship tracking | Free tier | Configure Phase 1 |
| **Kumu.io** | Interactive network visualization | Free (public) | Ready at 20+ nodes |
| **Gephi** | Network analysis & metrics computation | Free (open source) | Ready at 40+ nodes |
| **Tally/Google Forms** | Audience needs survey | Free | Phase 2 |

---

## Data Entry Checklist

### For Each Stakeholder (Phase 1)
- [ ] Name, type, geographic scope
- [ ] Key contact (name, email)
- [ ] Primary domain/focus area
- [ ] Charter/mandate (or key initiatives)
- [ ] Audience served
- [ ] Funding model
- [ ] Engagement status, priority level
- [ ] Notes

### For Each Relationship (Phase 1)
- [ ] Source & target stakeholder IDs
- [ ] Relationship type
- [ ] Direction (uni/bidirectional)
- [ ] Strength (strong/weak/dormant)
- [ ] Date established
- [ ] Primary contacts on each side
- [ ] Origin description

---

## Key Questions We Can Answer

| Question | Analysis Required |
|----------|-------------------|
| Which organizations are most critical to our strategy? | Betweenness centrality + domain expertise |
| Where are collaboration opportunities we're missing? | Structural hole detection (disconnected clusters) |
| Who is most ready to partner with us now? | Filter: Collaborative Readiness = Ready + Engagement Stage = Prospect |
| How do we reach practitioners in Energy sector? | Community detection + sector filtering + degree centrality |
| What's our geographic coverage? | Group by Geography; identify gaps |
| Are we representing all decision-making levels? | Filter by Decision Authority; assess distribution |
| Which relationships have gone dormant? | Filter: Engagement Stage = Dormant + Last Interaction > 6 months |

---

## Documentation Reference

| Document | Purpose |
|----------|---------|
| **FIELDS.md** | 61-field catalog (core + suggested + computed); data entry guide |
| **DATA_MODEL.md** | Technical spec: Airtable schema, SysML patterns, validation rules, queries |
| **NETWORK_SCIENCE.md** | Methodology guide: 6 key metrics, 7 strategic outputs, prerequisites |
| **CATEGORIZATION.md** | 9 categorization dimensions; multi-dimensional filtering strategies |

---

## Success Metrics

| Phase | Metric | Target |
|-------|--------|--------|
| **Phase 1** | Stakeholders registered | 10 (pilot) → 30 (end) |
| **Phase 1** | Data completeness (core fields) | 100% |
| **Phase 2** | Stakeholders registered | 40+ |
| **Phase 2** | Edges in network | 50+; 1.5+ per node |
| **Phase 2** | Key relationships mapped | All major connections captured |
| **Phase 3** | Partnerships initiated | 3+ new active collaborations |
| **Phase 3** | Outreach roadmap complete | Prioritized, evidence-based plan |

---

## Related Projects

- **Understanding Industry Needs** — Parallel effort; feeds Goal 3 data
- **SustainableTogether** — Parent sustainability initiative

---

**Project Status:** Phase 1 — Foundation & Tooling  
**Last Updated:** 2026-04-16  
**Maintained by:** INCOSE Sustainability Working Group
