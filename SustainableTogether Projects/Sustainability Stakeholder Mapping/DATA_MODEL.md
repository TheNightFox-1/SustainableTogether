# Sustainability WG Stakeholder Mapping — Data Model

This document defines the complete data structure for the stakeholder mapping registry. Use this when configuring Airtable, designing a database schema, or building an SysML model.

---

## Entity: Stakeholder

A stakeholder is any organization (Inside INCOSE) or external entity (Outside INCOSE) relevant to the SuWG's mission.

### Metadata
| Field | Type | Required | Applicable Goals |
|-------|------|----------|------------------|
| id | String (UUID) | Yes | — |
| name | String | Yes | G1, G2 |
| category | Enum (Inside INCOSE, Outside INCOSE) | Yes | — |
| last_updated | Date | Yes | — |
| notes | Text (free-form) | No | G2 |

### Inside INCOSE — Role & Structure
| Field | Type | Required | Applicable Goals |
|-------|------|----------|------------------|
| incose_entity_type | Enum | Yes | G1, G2 |
| charter_mandate | Text | Yes | G1, G2 |
| current_leadership_name | String | Yes | G2 |
| current_leadership_title | String | Yes | G2 |
| current_leadership_email | Email | No | G2 |
| geographic_scope | Enum (Global, Regional, National, Local) | Yes | G2, G3 |

**INCOSE Entity Types (Enum):**
- Working Group
- TechOps
- Leadership (Board/Executive)
- Chapter
- Member/Community
- Liaison

### Inside INCOSE — Activity & Reach
| Field | Type | Required | Applicable Goals |
|-------|------|----------|------------------|
| active_sustainability_initiatives | Text | No | G1, G2 |
| membership_size_estimate | Integer | No | G3 |
| communication_channels | String (comma-separated) | No | G3 |
| has_formal_liaison_with_suwg | Boolean | No | G2 |

**Suggested:**
| Field | Type | Optional | Purpose |
|-------|------|----------|---------|
| se_maturity_level | Enum (Basic, Practitioner, Advanced) | Yes | G3 |
| budget_resource_availability | Enum (Limited, Moderate, Strong) | Yes | G2 |
| decision_making_speed | Enum (Slow, Moderate, Fast) | Yes | G2 |

### Outside INCOSE — Organization Profile
| Field | Type | Required | Applicable Goals |
|-------|------|----------|------------------|
| org_type | Enum | Yes | G1, G2 |
| hq_country | String (ISO 3166 code) | No | G2, G3 |
| geographic_scope | Enum (Global, Regional, National) | Yes | G2, G3 |
| primary_domain_focus | String | Yes | G1 |
| key_publications_outputs | Text | No | G1 |
| website_url | URL | No | G2 |
| key_contact_name | String | Yes | G2 |
| key_contact_title | String | No | G2 |
| key_contact_email | Email | No | G2 |
| audience_served | String | Yes | G3 |
| funding_model | Enum (Public, Private, Membership, Grant, Mixed) | Yes | G2 |

**Organization Types (Enum):**
- NGO
- Research Group / Institute
- Industrial Company
- Industry Consortium / Sectorial Alliance
- Consulting Firm
- Education / Academia
- Standards Body
- Policy Maker / Regulator
- Think Tank
- Funding Body / Grant Agency
- Professional Association (Adjacent Field)
- Technology Provider / Tool Vendor
- Industry Federation
- Media / Communication Channel

**Suggested:**
| Field | Type | Optional | Purpose |
|-------|------|----------|---------|
| standards_certifications_issued | String | Yes | G1, Network |
| open_data_publications_policy | Enum (CC-licensed, Open Access, Proprietary, Mixed) | Yes | G1 |
| languages_of_operation | String (comma-separated: en, de, fr, ...) | Yes | G3 |
| sdg_alignment | String (comma-separated: SDG-1, SDG-7, ...) | Yes | G1, G2 |
| se_awareness_level | Enum (Unaware, Aware, Engaged, Expert) | Yes | G1, G3 |

### All Stakeholders — Engagement & Synergy
| Field | Type | Required | Applicable Goals |
|-------|------|----------|------------------|
| engagement_status | Enum (Prospect, In Outreach, Active, Inactive) | Yes | — |
| priority_level | Enum (High, Medium, Low) | Yes | G2 |
| engagement_score | Integer (0–100) | No | — |

**Synergy Fields (for Network Analysis):**
| Field | Type | Optional | Purpose |
|-------|------|----------|---------|
| audience_overlap_index | Integer (0–100%) | Yes | G3, Network |
| complementary_capability | Text | Yes | G1, G2, Network |
| co_production_readiness | Enum (Low, Medium, High) | Yes | G2 |
| influence_reach_estimate | Integer | Yes | G3, Network |
| sustainability_maturity | Enum (Lagging, Emerging, Leading) | Yes | G1, G3 |
| knowledge_gap_they_have | Text | Yes | G2, G3 |
| trigger_event_date | Date | Yes | G2 |
| trigger_event_description | Text | Yes | G2 |
| broker_potential_computed | Float (0–1) | No | Network |

---

## Entity: Relationship

A relationship (edge) connects two stakeholders and describes the nature of their interaction and flow.

### Core Fields
| Field | Type | Required | Applicable Goals |
|-------|------|----------|------------------|
| id | String (UUID) | Yes | — |
| source_stakeholder_id | UUID | Yes | — |
| target_stakeholder_id | UUID | Yes | — |
| relationship_type | Enum | Yes | G2, Network |
| direction | Enum (Unidirectional, Bidirectional) | Yes | Network |
| strength_frequency | Enum (Strong, Weak, Dormant) | Yes | Network |
| origin_description | Text | No | G2 |
| date_established | Date | Yes | Network |
| primary_contact_source_name | String | Yes | G2 |
| primary_contact_source_email | Email | No | G2 |
| primary_contact_target_name | String | Yes | G2 |
| primary_contact_target_email | Email | No | G2 |
| last_updated | Date | Yes | — |
| notes | Text (free-form) | No | G2 |

### Relationship Types (Enum)

- `formal_liaison` — Officially established INCOSE liaison agreement
- `collaboration_active` — Joint project, publication, or event underway
- `collaboration_planned` — Agreed but not yet started
- `knowledge_flow` — One org learns from / cites the other
- `audience_overlap` — Serve overlapping practitioner/stakeholder audiences
- `standards_alignment` — One org's standards inform or constrain the other
- `funding_relationship` — One org funds or grants resources to the other
- `membership_affiliation` — One org is member body or affiliate of the other
- `alumni_spinoff` — One org originated from or is staffed by alumni of the other
- `competitive_overlap` — Both orgs address similar problems
- `aspirational_target` — Relationship that should be created

### Suggested Fields (Flow & Synergy)
| Field | Type | Optional | Purpose |
|-------|------|----------|---------|
| flow_type | String (comma-separated enum) | Yes | G2, Network |
| collaboration_potential_score | Integer (1–5) | Yes | G2, Network |
| blocker_gap_description | Text | Yes | G2 |
| shared_goals_overlap | String (comma-separated: G1, G2, G3) | Yes | G1, G2, G3 |
| last_interaction_date | Date | Yes | G2 |

### Flow Types (Multi-Select Enum)

Pick any combination that applies:
- `knowledge` — research, expertise, methodologies, frameworks
- `funding` — grants, in-kind support, co-investment
- `audience_reach` — access to practitioners, members, decision-makers
- `co_authorship` — joint publications, white papers, standards
- `standards_influence` — shaping or being shaped by standards work
- `talent_pipeline` — students, early-career professionals, speakers
- `legitimacy_endorsement` — credibility by association
- `data_evidence` — research data, survey results, case studies

---

## Computed Fields (Network Analysis)

These fields are derived from the graph structure after running network analysis (Gephi, NetworkX):

| Field | Type | How Computed | Useful For |
|-------|------|--------------|-----------|
| degree_centrality | Float (0–1) | Number of direct connections / (n-1) | Which orgs are most connected |
| betweenness_centrality | Float (0–1) | (# shortest paths through node) / (# total shortest paths) | Identify brokers / structural bridges |
| clustering_coefficient | Float (0–1) | (# triangles in ego network) / (# possible triangles) | How tightly knit local communities are |
| community_id | Integer | Community detection algorithm (modularity) | Identify clusters and sub-ecosystems |
| structural_hole_score | Float | (1 - avg(correlation to neighbors)) | Identify high-leverage bridge positions |
| temporal_growth_rate | Float | Edges added per month | Trend analysis |

---

## Airtable Configuration (Starting Stack)

### Tables
1. **Stakeholders** (primary table)
   - All fields above, linked to Relationships via source/target
   - Views: By Category (Inside/Outside), By Priority, By Engagement Status, By Org Type

2. **Relationships** (edge table)
   - All fields above, linked to Stakeholders (source/target)
   - Views: By Relationship Type, By Flow Type, By Strength, Active Only

3. **Computed Metrics** (for network analysis results)
   - Stakeholder ID, Betweenness Centrality, Degree Centrality, Community ID, Broker Potential Score

### Recommended Field Sequence (Data Entry Order)

**For each Stakeholder:**
1. name, category, incose_entity_type (or org_type)
2. geographic_scope, primary_contact info
3. key_publications_outputs, website, charter_mandate
4. active_sustainability_initiatives, engagement_status, priority_level
5. (Suggested fields after pilot validation)

**For each Relationship:**
1. source_stakeholder_id, target_stakeholder_id
2. relationship_type, direction, strength_frequency
3. date_established, origin_description
4. primary_contact on each side
5. (flow_type, collaboration_potential after core data complete)

---

## SysML Implementation (Optional)

If modeling this in SysML v2, use a relational structure:

```sysml
package StakeholderMapping {
    private import SI::*;

    // Enumerations
    enum def Category { enum inside = 1; enum outside = 2; }
    enum def IncoseEntityType { enum wg = 1; enum techops = 2; ... }
    enum def RelationshipType { enum formal_liaison = 1; enum collab_active = 2; ... }
    enum def FlowType { enum knowledge = 1; enum funding = 2; ... }

    // Stakeholder Definition
    structure def Stakeholder {
        attribute id : String;
        attribute name : String;
        attribute category : Category;
        attribute engagement_status : String;
        attribute priority_level : String;
        // ... other attributes
    }

    // Inside INCOSE Stakeholder
    structure def IncoseStakeholder :> Stakeholder {
        attribute entity_type : IncoseEntityType;
        attribute charter_mandate : String;
        attribute geographic_scope : String;
        // ... other Inside INCOSE attributes
    }

    // Outside INCOSE Stakeholder
    structure def ExternalStakeholder :> Stakeholder {
        attribute org_type : String;
        attribute primary_domain : String;
        attribute hq_country : String;
        // ... other Outside INCOSE attributes
    }

    // Relationship Definition
    structure def Relationship {
        attribute id : String;
        attribute source : Stakeholder;
        attribute target : Stakeholder;
        attribute relationship_type : RelationshipType;
        attribute flow_types : FlowType[*];
        attribute direction : String;
        attribute strength : String;
        // ... other relationship attributes
    }

    // Registry (top-level part holding all data)
    part def StakeholderRegistry {
        part stakeholders : Stakeholder[*];
        part relationships : Relationship[*];
    }
}
```

---

## Validation Rules

**Stakeholder:**
- `name` cannot be empty
- `category` must be Inside INCOSE or Outside INCOSE
- If Inside INCOSE: incose_entity_type is required
- If Outside INCOSE: org_type is required
- `engagement_status` must be one of: Prospect, In Outreach, Active, Inactive
- `priority_level` must be one of: High, Medium, Low

**Relationship:**
- `source_stakeholder_id` and `target_stakeholder_id` must be different
- `relationship_type` must be one of the 11 defined types
- `direction` must be Unidirectional or Bidirectional
- `date_established` cannot be in the future
- If relationship_type = `aspirational_target`, then direction must be Unidirectional

---

## Query Examples

### "Who are our highest-priority collaborators?"
```
Stakeholders where:
  - priority_level = "High"
  - engagement_status = "Active"
  - category = "Outside INCOSE"
order by engagement_score DESC
```

### "Which organizations bridge otherwise disconnected clusters?"
```
Computed Metrics where:
  - betweenness_centrality > 0.3
  - clustering_coefficient < 0.5
order by betweenness_centrality DESC
```

### "What knowledge flows between X and Y?"
```
Relationships where:
  - (source = X AND target = Y) OR (source = Y AND target = X)
  - flow_type contains "knowledge"
```

### "Which orgs have high audience overlap with us but no collaboration yet?"
```
Stakeholders where:
  - audience_overlap_index > 70%
  - engagement_status != "Active"
order by collaboration_potential_score DESC
```

---

## Notes for Data Stewards

1. **Start minimal** — populate core fields first. Suggested fields can be added after 10-node pilot validation.
2. **Relationship direction matters** — be explicit about whether flow is one-way (unidirectional) or mutual (bidirectional).
3. **Trigger events are time-sensitive** — review monthly to identify windows of collaboration opportunity.
4. **Synergy fields require judgment** — use expert estimate + refine iteratively as engagement deepens.
5. **Network analysis requires 30+ nodes** — don't run Gephi until core dataset is sufficiently dense.
6. **Temporal data is valuable** — always record date_established and last_interaction_date; this enables decay analysis of dormant relationships.

