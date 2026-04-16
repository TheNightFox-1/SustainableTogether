# Stakeholder Mapping — Complete Field Reference

This document consolidates all data fields for the stakeholder mapping registry, organized by entity type and field category. Use this as the authoritative reference when configuring Airtable, databases, or SysML models.

---

## Field Organization

Fields are categorized as:
- **Core** (⭐) — Required for Phase 1 pilot; foundational for all three goals
- **Suggested** (⭐⭐) — Add after 10-node pilot; refines strategy and enables network analysis
- **Computed** (🔧) — Derived from graph structure; computed by network analysis tools (Gephi, NetworkX)

---

## Inside INCOSE Stakeholder

### Identification & Structure

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| id | String (UUID) | Yes | Core ⭐ | — | Unique identifier |
| name | String | Yes | Core ⭐ | G1, G2 | Official INCOSE entity name |
| incose_entity_type | Enum | Yes | Core ⭐ | G1, G2 | WG / TechOps / Leadership / Chapter / Member / Liaison |
| category | Enum | Yes | Core ⭐ | — | "Inside INCOSE" (fixed) |
| last_updated | Date | Yes | Core ⭐ | — | Date of last data update |

### Mandate & Strategic Context

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| charter_mandate | Text | Yes | Core ⭐ | G1, G2 | What is this entity formally tasked to do? Critical for overlap detection |
| active_sustainability_initiatives | Text | No | Core ⭐ | G1, G2 | Current projects, papers, activities touching sustainability |
| geographic_scope | Enum | Yes | Core ⭐ | G2, G3 | Global / Regional / National / Local |

### Leadership & Contact

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| current_leadership_name | String | Yes | Core ⭐ | G2 | Primary point of contact (name) |
| current_leadership_title | String | No | Core ⭐ | G2 | Title/role of leader |
| current_leadership_email | Email | No | Core ⭐ | G2 | Email for outreach |

### Reach & Communication

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| membership_size_estimate | Integer | No | Core ⭐ | G3 | Approximate practitioners reached |
| communication_channels | String | No | Core ⭐ | G3 | Newsletter, Slack, mailing list, etc. — how to reach members |
| has_formal_liaison_with_suwg | Boolean | No | Core ⭐ | G2 | Does a formal liaison agreement exist? |

### Engagement Tracking

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| engagement_status | Enum | Yes | Core ⭐ | — | Prospect / In Outreach / Active / Inactive |
| priority_level | Enum | Yes | Core ⭐ | G2 | High / Medium / Low |
| engagement_score | Integer (0–100) | No | Core ⭐ | — | Estimated engagement depth |
| notes | Text | No | Core ⭐ | G2 | Free text — contacts, context, next steps |

### Capability & Resource Assessment

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| se_maturity_level | Enum | No | Suggested ⭐⭐ | G3 | Basic / Practitioner / Advanced |
| budget_resource_availability | Enum | No | Suggested ⭐⭐ | G2 | Limited / Moderate / Strong — can they co-fund? |
| decision_making_speed | Enum | No | Suggested ⭐⭐ | G2 | Slow / Moderate / Fast — how quickly can they commit? |

---

## Outside INCOSE Stakeholder

### Identification & Classification

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| id | String (UUID) | Yes | Core ⭐ | — | Unique identifier |
| name | String | Yes | Core ⭐ | G1, G2 | Legal or commonly used name |
| org_type | Enum | Yes | Core ⭐ | G1, G2 | NGO / Research / Industrial / Consortium / Academia / Policy / Think Tank / Funding / Professional Association / Technology Provider / Federation / Media |
| category | Enum | Yes | Core ⭐ | — | "Outside INCOSE" (fixed) |
| hq_country | String | No | Core ⭐ | G2, G3 | ISO 3166 country code |
| geographic_scope | Enum | Yes | Core ⭐ | G2, G3 | Global / Regional / National |
| last_updated | Date | Yes | Core ⭐ | — | Date of last data update |

### Expertise & Focus

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| primary_domain_focus | String | Yes | Core ⭐ | G1 | Circular economy, LCA, climate policy, eco-design, social sustainability, etc. |
| key_publications_outputs | Text | No | Core ⭐ | G1 | Landmark reports, standards, frameworks they have produced |
| standards_certifications_issued | String | No | Suggested ⭐⭐ | G1, Network | Do they produce standards SE practitioners must comply with? |
| se_awareness_level | Enum | No | Suggested ⭐⭐ | G1, G3 | Unaware / Aware / Engaged / Expert — are they aware of SE as a discipline? |

### Contact & Online Presence

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| website_url | URL | No | Core ⭐ | G2 | Primary online presence |
| key_contact_name | String | Yes | Core ⭐ | G2 | Best entry point for outreach |
| key_contact_title | String | No | Core ⭐ | G2 | Contact's title/role |
| key_contact_email | Email | No | Core ⭐ | G2 | Contact email for outreach |

### Audience & Impact

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| audience_served | String | Yes | Core ⭐ | G3 | Who do they speak to — practitioners, policymakers, companies, students, etc.? |
| funding_model | Enum | Yes | Core ⭐ | G2 | Public / Private / Membership / Grant / Mixed — affects collaboration dynamics |
| audience_overlap_index | Integer (0–100%) | No | Suggested ⭐⭐ | G3, Network | Estimated % overlap with INCOSE SE practitioners |
| influence_reach_estimate | Integer | No | Suggested ⭐⭐ | G3, Network | Estimated practitioners/orgs they influence indirectly |

### Knowledge & Values Alignment

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| open_data_publications_policy | Enum | No | Suggested ⭐⭐ | G1 | CC-licensed / Open Access / Proprietary / Mixed — affects knowledge reuse |
| languages_of_operation | String | No | Suggested ⭐⭐ | G3 | Comma-separated (en, de, fr, etc.) — for non-anglophone reach |
| sdg_alignment | String | No | Suggested ⭐⭐ | G1, G2 | Which UN Sustainable Development Goals do they address? (SDG-1, SDG-7, etc.) |
| sustainability_maturity | Enum | No | Suggested ⭐⭐ | G1, G3 | Lagging / Emerging / Leading — how advanced is their sustainability thinking? |

### Engagement & Synergy

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| engagement_status | Enum | Yes | Core ⭐ | — | Prospect / In Outreach / Active / Inactive |
| priority_level | Enum | Yes | Core ⭐ | G2 | High / Medium / Low |
| engagement_score | Integer (0–100) | No | Core ⭐ | — | Estimated engagement depth |
| complementary_capability | Text | No | Suggested ⭐⭐ | G1, G2, Network | What do they have that we lack? Asymmetry = where synergy lives |
| co_production_readiness | Enum | No | Suggested ⭐⭐ | G2 | Low / Medium / High — willingness + capacity to jointly produce |
| knowledge_gap_they_have | Text | No | Suggested ⭐⭐ | G2, G3 | What do they need that we could provide? Unlocks two-way value |
| trigger_event_date | Date | No | Suggested ⭐⭐ | G2 | Upcoming conference, publication, policy moment |
| trigger_event_description | Text | No | Suggested ⭐⭐ | G2 | What is the trigger and why is it significant? |
| notes | Text | No | Core ⭐ | G2 | Free text — contacts, context, next steps |

---

## Relationship (Edge Between Two Stakeholders)

### Core Relationship Definition

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| id | String (UUID) | Yes | Core ⭐ | — | Unique identifier |
| source_stakeholder_id | UUID | Yes | Core ⭐ | — | First stakeholder (INCOSE or external) |
| target_stakeholder_id | UUID | Yes | Core ⭐ | — | Second stakeholder (INCOSE or external) |
| relationship_type | Enum | Yes | Core ⭐ | G2, Network | See Relationship Types table below |
| direction | Enum | Yes | Core ⭐ | Network | Unidirectional (A→B) / Bidirectional (A↔B) |
| strength_frequency | Enum | Yes | Core ⭐ | Network | Strong / Weak / Dormant |
| date_established | Date | Yes | Core ⭐ | Network | When was relationship first formed? |
| last_updated | Date | Yes | Core ⭐ | — | Date of last data update |

### Contact & Origin

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| origin_description | Text | No | Core ⭐ | G2 | How did this connection form? (Event, publication, referral, liaison) |
| primary_contact_source_name | String | Yes | Core ⭐ | G2 | Named person holding relationship on source side |
| primary_contact_source_email | Email | No | Core ⭐ | G2 | Email for contact on source side |
| primary_contact_target_name | String | Yes | Core ⭐ | G2 | Named person holding relationship on target side |
| primary_contact_target_email | Email | No | Core ⭐ | G2 | Email for contact on target side |

### Flow & Collaboration Potential

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| flow_type | String (multi-select) | No | Suggested ⭐⭐ | G2, Network | Knowledge / Funding / Audience reach / Co-authorship / Standards influence / Talent / Legitimacy / Data |
| collaboration_potential_score | Integer (1–5) | No | Suggested ⭐⭐ | G2, Network | How productively could these two work together? |
| blocker_gap_description | Text | No | Suggested ⭐⭐ | G2 | What prevents a stronger relationship? |
| shared_goals_overlap | String (multi-select) | No | Suggested ⭐⭐ | G1, G2, G3 | Which project goals (G1, G2, G3) does this relationship serve? |
| last_interaction_date | Date | No | Suggested ⭐⭐ | G2 | When was last contact made? (Identifies dormant relationships) |

### Notes

| Field | Type | Required | Level | Goals | Notes |
|-------|------|----------|-------|-------|-------|
| notes | Text | No | Core ⭐ | G2 | Free text — relationship context, plans, outcomes |

---

## Computed Metrics (Network Analysis)

These fields are **derived** by running network analysis on the graph (Gephi, NetworkX). Do not enter manually.

### Graph Centrality Metrics

| Field | Type | Level | Computed By | Use For |
|-------|------|-------|-------------|---------|
| degree_centrality | Float (0–1) | 🔧 | Degree / (n-1) | Identify highly connected organizations |
| betweenness_centrality | Float (0–1) | 🔧 | (Shortest paths through node) / (total shortest paths) | Identify brokers and structural bridges |
| closeness_centrality | Float (0–1) | 🔧 | (n-1) / (sum of distances) | Identify organizations close to all others |

### Clustering & Community

| Field | Type | Level | Computed By | Use For |
|-------|------|-------|-------------|---------|
| clustering_coefficient | Float (0–1) | 🔧 | (Triangles in ego network) / (possible triangles) | Identify tightly knit sub-communities |
| community_id | Integer | 🔧 | Modularity optimization (Gephi) | Identify natural clusters and sub-ecosystems |
| structural_hole_score | Float (0–1) | 🔧 | 1 - avg(correlation to ego neighbors) | Identify high-leverage bridge positions |

### Temporal & Growth

| Field | Type | Level | Computed By | Use For |
|-------|------|-------|-------------|---------|
| network_growth_rate | Float (edges/month) | 🔧 | Edges added per 30-day window | Track network expansion velocity |
| dormancy_score | Float (0–1) | 🔧 | Days since last_interaction_date / 365 | Identify relationships needing reactivation |
| broker_potential | Float (0–1) | 🔧 | betweenness_centrality | Rank organizations by leverage potential |

---

## Relationship Types Reference

| Type | Description | Direction | Use Case |
|------|-------------|-----------|----------|
| formal_liaison | Officially established INCOSE liaison agreement | Bidirectional | Formal partnerships with governance |
| collaboration_active | Joint project, publication, or event underway | Bidirectional | Current active work |
| collaboration_planned | Agreed but not yet started | Bidirectional | Pipeline opportunities |
| knowledge_flow | One org learns from / cites the other | Unidirectional | Learning from expertise |
| audience_overlap | Serve overlapping practitioner/stakeholder audiences | Bidirectional | Potential co-communication |
| standards_alignment | One org's standards inform or constrain the other | Unidirectional | Standards influence |
| funding_relationship | One org funds or grants resources to the other | Unidirectional | Resource dependency |
| membership_affiliation | One org is member body or affiliate of the other | Unidirectional | Structural membership |
| alumni_spinoff | One org originated from or is staffed by alumni of the other | Unidirectional | Historical connection |
| competitive_overlap | Both orgs address similar problems | Bidirectional | Potential merger or differentiation |
| aspirational_target | Relationship that should be created | Unidirectional | Future engagement goal |

---

## Flow Types Reference (Multi-Select)

Pick any combination that applies to a relationship:

| Flow Type | Description | Examples |
|-----------|-------------|----------|
| knowledge | Research, expertise, methodologies, frameworks | Research partnerships, literature citations, methodology adoption |
| funding | Grants, in-kind support, co-investment | Joint projects, co-funding events, shared resources |
| audience_reach | Access to practitioners, members, decision-makers | Speaking slots, newsletter features, member outreach |
| co_authorship | Joint publications, white papers, standards contributions | Co-authored papers, standards working groups |
| standards_influence | Shaping or being shaped by standards work | Standards body membership, compliance influence |
| talent_pipeline | Students, early-career professionals, speakers | Training programs, speaker networks, recruitment |
| legitimacy_endorsement | Credibility by association | Endorsed partnerships, co-branded initiatives |
| data_evidence | Research data, survey results, case studies | Data sharing agreements, evidence collaborations |

---

## Quick Reference: Data Entry Order

### For Each New INSIDE INCOSE Stakeholder (Phase 1)
1. **name**, **incose_entity_type**, **charter_mandate**
2. **geographic_scope**, **current_leadership_name**, **current_leadership_email**
3. **active_sustainability_initiatives**
4. **engagement_status**, **priority_level**
5. *(After pilot)* Suggested fields: **se_maturity_level**, **budget_resource_availability**, **decision_making_speed**

### For Each New OUTSIDE INCOSE Stakeholder (Phase 1)
1. **name**, **org_type**, **primary_domain_focus**
2. **geographic_scope**, **hq_country**
3. **key_contact_name**, **key_contact_email**, **website_url**
4. **audience_served**, **funding_model**
5. **engagement_status**, **priority_level**
6. *(After pilot)* Suggested fields: **se_awareness_level**, **sdg_alignment**, **sustainability_maturity**, **audience_overlap_index**, **complementary_capability**, **knowledge_gap_they_have**

### For Each Relationship (Phase 1)
1. **source_stakeholder_id**, **target_stakeholder_id**
2. **relationship_type**, **direction**, **strength_frequency**
3. **date_established**, **origin_description**
4. **primary_contact_source_name**, **primary_contact_target_name**
5. *(After pilot)* Suggested fields: **flow_type**, **collaboration_potential_score**, **blocker_gap_description**, **shared_goals_overlap**

---

## Field Summary Statistics

| Category | Core Fields | Suggested Fields | Total |
|----------|-------------|------------------|-------|
| Inside INCOSE | 11 | 3 | 14 |
| Outside INCOSE | 13 | 8 | 21 |
| Relationship | 12 | 5 | 17 |
| **Computed Metrics** | — | — | **9** |
| **TOTAL** | **36** | **16** | **61** |

**Recommended Phase 1 entry:** 36 core fields  
**Phase 2 expansion:** +16 suggested fields  
**Phase 3 analysis:** +9 computed metrics from network analysis

