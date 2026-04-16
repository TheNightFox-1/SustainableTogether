# Stakeholder Categorization Schemes

Beyond "Inside INCOSE" vs. "Outside INCOSE" — multiple meaningful ways to organize and analyze the ecosystem.

---

## Why Multiple Categorization Systems?

A single categorization (Inside/Outside INCOSE) is **binary and limited**. Different strategic questions require different lenses:

- *"Who can make standards binding?"* → Categorize by **Decision-Making Authority**
- *"Where are our biggest gaps?"* → Categorize by **SE Engagement Level**
- *"Which sectors are we in?"* → Categorize by **Industry/Domain**
- *"Who's ready to collaborate now?"* → Categorize by **Collaborative Readiness**
- *"What's their scale?"* → Categorize by **Size/Reach**

**Best practice:** Use **multiple overlapping categorizations** in Airtable. This enables filtering, segmentation, and discovery across different strategic dimensions.

---

## Proposed Categorization Schemes

### 1. Decision-Making Authority (Power & Influence)

**Purpose:** Identify who can mandate change vs. who advocates for it  
**Use for:** Understanding influence hierarchy and policy leverage points

| Category | Description | Examples | Strategic Value |
|----------|-------------|----------|-----------------|
| **Policy-Makers & Regulators** | Government agencies, ministries, regulatory bodies that can mandate compliance | EU Green Deal bodies, EPA, BundesUmweltamt | Set the rules others must follow; essential for regulatory strategy |
| **Standards-Setters** | Organizations that produce standards and specifications others adopt | ISO, IEC, IEEE, SAE | Define what compliance looks like; high leverage for embedding SE |
| **Market Leaders & Incumbents** | Large corporations that can set de facto standards through market power | Siemens, Dassault, BMW, Shell | Drive adoption at scale; influence supply chains |
| **Ecosystem Builders & Conveners** | Organizations that bring others together (think tanks, associations, consortia) | World Business Council on Sustainability, Ellen MacArthur Foundation, IEEE | Create forums for collaboration; bridge siloes |
| **Advocates & Thought Leaders** | NGOs, researchers, media that shape perception and agenda without decision authority | Greenpeace, WBCSD, academic institutes, LinkedIn influencers | Build momentum and urgency; influence opinion-makers |
| **Implementers & Practitioners** | Companies, consultancies, and professionals who execute decisions | Engineering firms, manufacturers, project managers | Validate feasibility; provide feedback for refinement |
| **Learners & Emerging Players** | Students, startups, early adopters without yet-established authority | University programs, deep-tech startups, early-career professionals | Future decision-makers; early adoption champions |

**Airtable Field Name:** `decision_authority_category`  
**Type:** Single Select (Enum)

**Use Cases:**
- Filter for "Policy-Makers" when designing regulatory alignment strategy
- Filter for "Standards-Setters" when identifying standards harmonization opportunities
- Combine "Market Leaders" + "Implementers" for supply-chain sustainability initiatives
- Track "Learners" as future pipeline for ecosystem maturation

---

### 2. SE Engagement Level (Systems Engineering Awareness & Practice)

**Purpose:** Identify who understands SE vs. who needs education  
**Use for:** Tailoring value propositions and engagement depth

| Category | Description | Indicators | Engagement Strategy |
|----------|-------------|-----------|-------------------|
| **SE Unaware** | Organization not familiar with systems engineering discipline; may not see relevance | No SE job titles; don't cite SE methods; focus on domain expertise | *Educate:* Short intro to SE value; concrete domain examples; start with concepts they know |
| **SE Aware** | Aware of SE; may recognize its relevance but not practicing systematically | Mention SE; may have 1–2 SE practitioners; don't systematize it | *Enable:* SE how-tos for their domain; show ROI; peer examples from similar orgs |
| **SE Engaged** | Actively practicing systems engineering; fluent in SE thinking and terminology | SE team/department; SE in job descriptions; cite SE methodologies | *Amplify:* Advanced topics; SE innovation; thought leadership; co-development |
| **SE Expert** | SE is core to identity and practice; leading-edge methodology and innovation | Dedicated SE research; publish on SE; advance SE discipline itself | *Partner:* Co-author standards; joint research; steering groups; deep collaboration |

**Airtable Field Name:** `se_engagement_level`  
**Type:** Single Select (Enum)

**Use Cases:**
- Design differentiated messaging: awareness campaign for "Unaware", capability-building for "Aware", co-innovation for "Engaged/Expert"
- Identify where SuWG can teach (unaware/aware) vs. learn (engaged/expert)
- Track progression of individual organizations through levels (indicator of relationship maturation)

---

### 3. Sector/Domain Focus (Industry & Thematic Clusters)

**Purpose:** Organize by what problems organizations solve  
**Use for:** Community detection, sector-specific initiatives, cross-sector synergy finding

| Category | Subcategories | Examples | Relevance to Sustainability |
|----------|---------------|----------|---------------------------|
| **Energy** | Solar, Wind, Grid, Battery, Fossil, Nuclear, Efficiency | Sunrun, NextEra, EnergyTech startups | Direct climate & resource impact; circular materials essential |
| **Transportation** | Automotive, Aviation, Maritime, Public Transit, Mobility | BMW, Airbus, Tesla, Rolls-Royce, Siemens Mobility | Massive carbon footprint; supply chain complexity; regulation driver |
| **Built Environment** | Buildings, Construction, Real Estate, Materials, Infrastructure | Skanska, Holcim, Architecture firms | Embodied carbon; lifecycle focus; long asset life |
| **Circular Economy** | Recycling, Remanufacturing, Design for Disassembly, Product Stewardship, Waste | Patagonia, Ellen MacArthur Foundation, 3R initiatives | Direct alignment with sustainability; growing policy driver |
| **Food & Agriculture** | Food Production, Distribution, Packaging, Agri-tech, Land Use | Nestlé, Unilever, Organic certifiers, Agtech startups | Biodiversity; soil health; supply chain complexity |
| **Consumer Products & Retail** | Fashion, Apparel, Electronics, Home Goods, E-commerce | H&M, Apple, Amazon, Adidas | High visibility; supply chain exposure; consumer pressure |
| **Chemicals & Materials** | Pharmaceuticals, Chemicals, Metals, Polymers, Batteries | BASF, AstraZeneca, Albemarle, Covestro | Hazardous inputs; long supply chains; substitution opportunities |
| **Water & Sanitation** | Water Treatment, Utilities, Agriculture Water, Ocean Health | Veolia, Xylem, Water nonprofits | Resource scarcity; freshwater depletion; emerging regulation |
| **Governance, Policy & Standards** | Government, Ministries, Policy Think Tanks, Standards Bodies, Certification | ISO, IEC, IEEE, EU Directorate, NGOs in policy | Set rules others follow; upstream leverage |
| **Education & Research** | Universities, Research Institutes, Vocational Schools, Think Tanks | MIT, Caltech, NREL, EIT Climate-KIC | Shape next generation; fundamental research; credibility bridge |
| **Finance & Responsible Investment** | Banks, Investment Funds, ESG Raters, Impact Investors | BlackRock, MSCI ESG, GIC, B-Corps | Capital allocation; incentive structures; mainstream adoption |
| **IT & Digital Solutions** | Software, Cloud, AI/ML, Digital Twin, IoT, Blockchain | Salesforce, Microsoft, Capgemini, Autodesk, Siemens Digital | Enabler technologies; measurement & monitoring; data infrastructure |
| **Consulting & Professional Services** | Engineering Firms, Management Consultancy, Sustainability Consultants | McKinsey, Accenture, Atos, Arcadis | Translate strategy to implementation; reach across sectors |
| **Health & Pharmaceuticals** | Medical Devices, Pharmaceuticals, Healthcare Systems, Health Tech | Johnson & Johnson, Pfizer, Hospital networks, MedTech startups | Health-environment nexus; regulated industry; lifecycle thinking |

**Airtable Field Names:** `primary_sector`, `secondary_sectors` (allow multi-select)  
**Type:** Single Select + Multi-Select Enum

**Use Cases:**
- Run network analysis **per sector** to identify sector-specific brokers and clusters
- Design sector-specific working groups or task forces
- Cross-sector initiative: find organizations across multiple sectors addressing the same sustainability challenge
- Identify underrepresented sectors in current network (gap analysis)

---

### 4. Organization Size & Scale (Reach & Leverage)

**Purpose:** Understand impact magnitude and influence sphere  
**Use for:** Prioritizing based on reach; tailoring engagement bandwidth

| Category | Definition | Reach | Examples | Engagement Implication |
|----------|-----------|-------|----------|----------------------|
| **Global Mega-Org** | 10,000+ employees or members; operates in 50+ countries; sets global standards | 100,000+ practitioners indirectly influenced | Siemens, Shell, ISO, INCOSE | High leverage but long sales cycles; needs C-suite engagement |
| **Large Regional** | 1,000–10,000 employees/members; operates in multiple countries/regions; regional influence | 10,000–100,000 indirectly | BMW (Europe), Nestlé regional units, regional chambers | Moderate leverage; director/VP level decisions |
| **Mid-Market** | 100–1,000 employees; operates in 1–3 countries; niche leadership | 1,000–10,000 indirectly | Mid-sized consulting firms, regional manufacturers, sector alliances | Agile; can move fast; middle management decisions |
| **Small & Focused** | 10–100 employees; deep expertise in narrow domain; thought leadership in niche | 100–1,000 indirectly | Specialty engineering firms, boutique consultancies, research labs | Fast decision-making; high expertise; founder-driven |
| **Micro & Startup** | <10 people; early-stage; high innovation; limited reach but fast evolution | 10–100 directly; potential to scale | Deep-tech startups, early-stage NGOs, solo consultants | Innovative but resource-constrained; co-development potential |
| **Network/Association** | No single org size; distributed membership model; influence through collective voice | Varies widely by membership | INCOSE, IEEE, WBCSD, industry associations | Influence through network leverage; need multi-stakeholder approach |

**Airtable Field Name:** `scale_category`  
**Type:** Single Select (Enum)

**Use Cases:**
- Identify "Global Mega-Org" brokers (high leverage, can unlock supply chains)
- Find "Micro & Startup" innovation partners (first-mover advantage; lower risk pilots)
- Assess engagement bandwidth: Global Mega requires executive sponsors; Micro can iterate rapidly
- Balance portfolio: mix of high-leverage orgs + agile innovators + thought leaders

---

### 5. Sustainability Maturity (Sophistication & Advancement)

**Purpose:** Identify who's ahead vs. behind on sustainability; design learning transfer  
**Use for:** Sequencing partnerships; identifying thought leaders vs. learners

| Category | Definition | Indicators | Role in SuWG Engagement |
|----------|-----------|-----------|------------------------|
| **Sustainability Leader (Innovative)** | Sustainability is core strategy; embedding SE into sustainability; publishing research; setting benchmarks | B-Corp certified; science-based targets; publish sustainability reports; conduct LCA; design for circularity; employee engagement | *Learn from them:* What works at scale? Host workshops; cite as case study; co-author. They validate SuWG's methodology. |
| **Sustainability Committed (Established)** | Sustainability program exists; meeting regulatory compliance; voluntary certifications; tracking metrics | Formal CSR/ESG department; meet GRI standards; ISO 14001 certified; supplier engagement; emissions reduction targets | *Enable advancement:* SE can strengthen their programs. Ideal for joint working groups. |
| **Sustainability Aware (Emerging)** | Recognize importance; starting programs; not yet systematic; reactive to regulation | Sustainability task force; initial reporting; compliance-driven; supply chain pressure | *Educate & support:* Show quick wins. Peer benchmarking. SE as accelerator. |
| **Sustainability Lagging (Resistant)** | Low awareness; compliance-only mindset; see sustainability as cost/risk; not engaged | Minimal reporting; no voluntary initiatives; defensive; GHG accounting incomplete | *Overcome resistance:* Business case evidence. Regulatory outlook. Competitor analysis. Lowest priority for engagement. |

**Airtable Field Name:** `sustainability_maturity`  
**Type:** Single Select (Enum)

**Use Cases:**
- Pair "Leaders" with "Emerging" organizations for peer mentoring
- Design case studies and thought leadership with "Leaders"
- Identify "Committed" organizations as implementers for SE methodologies
- Deprioritize "Lagging" until external pressure (regulation, investor, competitor) changes their calculus

---

### 6. Collaborative Readiness (Willingness & Capacity for Partnership)

**Purpose:** Assess who's ready to collaborate now vs. needs nurturing  
**Use for:** Engagement sequencing; realistic partnership scoping

| Category | Definition | Signals | Next Steps |
|----------|-----------|---------|-----------|
| **Ready to Co-Develop** | Explicitly seeking partnerships; have dedicated resources; aligned goals; past collaboration track record | Initiated contact; mentioned partnership; have innovation budget; named partnership lead; moving fast | Fast-track: Propose pilot project; negotiate MOU; identify quick win |
| **Open & Interested** | Positive response to outreach; willing to explore; may need resource confirmation | Attended meeting; asked good questions; introduced you to colleagues; scheduled follow-up | Nurture: Joint workshop; small exploratory project; build internal champion |
| **Polite but Cautious** | Not opposed; need convincing; resource constraints or internal skepticism | Slow response; "interesting, keep us posted"; no budget allocated; need more proof points | Patient: Share case studies; invite to events; periodic check-ins; await catalyst |
| **Distant/Reluctant** | Not engaging; may not see value; bandwidth constraints or strategic misalignment | No response; deflecting; "not right now"; competitive concern; organizational conflict | Back-burner: Monitor for status change; add to annual outreach list; revisit when trigger event occurs |
| **Actively Resistant** | Opposes collaboration; may see SuWG as competitive or threatening; entrenched interests | Explicit "no"; competitive positioning; turf protection; ideological disagreement | Avoid: Focus resources elsewhere; unless strategic importance is very high |

**Airtable Field Name:** `collaborative_readiness`  
**Type:** Single Select (Enum)

**Use Cases:**
- Prioritize "Ready to Co-Develop" for immediate resource allocation
- Track progression from "Cautious" → "Interested" → "Ready" as indicator of relationship maturation
- For "Resistant" orgs: identify trigger events (policy change, investor pressure) that might shift stance
- Balance pipeline: 20% Ready + 30% Open + 30% Cautious + 20% Distant

---

### 7. Relationship Maturity & Stage (SuWG Engagement Journey)

**Purpose:** Track where each organization is in the engagement funnel  
**Use for:** Workflow management; setting engagement expectations; measuring progress

| Stage | Description | Duration | Activities | Success Metrics |
|-------|-------------|----------|-----------|-----------------|
| **Identified** | In database; no contact yet | Varies | Research; validate existence; collect basic info | Accurate contact information |
| **Prospect** | Initial outreach made; organization aware of SuWG | 1–3 months | Introductory calls; send overview materials; assess fit | Response rate; interest level |
| **Engaged** | Active conversation; exploring collaboration; information exchange | 3–9 months | Deeper meetings; joint workshops; proposal development | Clarity on mutual value; identified opportunity |
| **Active Partnership** | Formal agreement or active project underway | Ongoing | Joint work; regular communication; co-development | Deliverables; knowledge exchange; relationship growth |
| **Dormant** | Was active; now infrequent contact; relationship exists but inactive | Variable | Periodic check-ins; trigger event monitoring; seasonal re-engagement | Reactivation when conditions change |
| **Concluded** | Relationship completed; project finished; no further planned engagement | Post-project | Documentation; lessons learned; maintain goodwill for future | Alumni network; testimonial |

**Airtable Field Names:** `engagement_stage`, `stage_entered_date`, `next_action`, `next_action_date`  
**Type:** Single Select + Dates + Text

**Use Cases:**
- Filter for "Prospect" stage to track outreach pipeline
- Identify organizations stuck in "Engaged" for 9+ months; escalate or deprioritize
- Reactivate "Dormant" relationships when trigger events occur (policy change, new funding, personnel change)
- Measure conversion rates (Identified → Prospect → Active Partnership)

---

### 8. Geographic/Regional Focus (Where They Operate)

**Purpose:** Understand geographic distribution of ecosystem; identify regional gaps  
**Use for:** Regional strategy; localization of initiatives

| Category | Description | Relevance |
|----------|-------------|-----------|
| **Global** | Operates across continents; global standards focus; global supply chains | Highest leverage for global standards; lowest for local implementation |
| **Continental** (e.g., Europe, Asia, Americas) | Strong in one region; significant cross-border work | Regional initiatives; regulatory alignment by region |
| **National** | Strong single-country focus; national regulation; domestic supply chains | Local implementation; policy alignment |
| **Regional/Local** | Sub-national focus; local communities; grassroots initiatives | Community engagement; local pilot programs |
| **Distributed/Networked** | Members across multiple geographies; not centralized | Hard to classify; requires understanding network structure |

**Airtable Field Names:** `primary_geography`, `secondary_geographies`  
**Type:** Single Select + Multi-Select

**Use Cases:**
- Identify geographic clusters (EU-concentrated vs. Asia-concentrated vs. truly global)
- Find geographic brokers (orgs bridging regions)
- Design regional working groups or initiatives
- Assess coverage: which regions are underrepresented?

---

### 9. Flow Type Specialization (What They Bring)

**Purpose:** Understand what each organization contributes to ecosystem  
**Use for:** Partnership design; identifying value exchange asymmetries

| Category | Description | Examples |
|----------|-------------|----------|
| **Knowledge & Expertise** | Produce research, frameworks, methodologies, best practices | Research institutes, think tanks, consultancies, academic centers |
| **Standards & Regulation** | Set or influence rules, compliance frameworks, certifications | Standards bodies (ISO, IEEE), policy makers, regulators |
| **Funding & Resources** | Provide capital, grants, in-kind support, infrastructure | Funding agencies, impact investors, corporate sponsors |
| **Market & Audience** | Access to practitioners, customers, members, communities | Trade associations, large corporations, media, industry leaders |
| **Implementation & Validation** | Can pilot, test, implement, validate solutions at scale | Large companies, consultancies, implementation partners |
| **Advocacy & Voice** | Amplify messages; shape public opinion; drive urgency | NGOs, media, thought leaders, policy advocates |
| **Talent & Training** | Educate next generation; develop workforce; nurture innovation | Universities, vocational schools, corporate training, mentorship programs |

**Airtable Field Names:** `primary_flow_contribution`, `secondary_flow_contributions`  
**Type:** Single Select + Multi-Select

**Use Cases:**
- Find orgs with complementary flows to create balanced partnerships
- Identify "Funding & Resources" orgs to support scaling
- Partner "Knowledge" orgs with "Implementation" orgs to translate research to practice
- Find "Advocacy & Voice" orgs to amplify SuWG messaging

---

## Recommendation: Multi-Dimensional Model

**Don't choose one categorization. Use all of them.**

Airtable supports unlimited custom fields. Add these as additional dimensions:

```
Stakeholder Record:
  ├─ Name & Contact (core)
  ├─ Category: Inside/Outside INCOSE (original)
  ├─ Decision Authority (NEW)
  ├─ SE Engagement Level (NEW)
  ├─ Sector/Domain (NEW)
  ├─ Scale Category (NEW)
  ├─ Sustainability Maturity (NEW)
  ├─ Collaborative Readiness (NEW)
  ├─ Engagement Stage (NEW)
  ├─ Geography (NEW)
  ├─ Flow Contribution (NEW)
  └─ ... other fields from FIELDS.md
```

### Benefits of Multi-Dimensional Model

| Question | Filter Needed |
|----------|---------------|
| "Which policy-makers are ready to collaborate?" | Decision Authority = "Policy-Makers" + Collaborative Readiness = "Ready to Co-Develop" |
| "Which organizations can teach us about circular economy?" | Sector = "Circular Economy" + Sustainability Maturity = "Leader" + SE Engagement = "Engaged/Expert" |
| "Who are the brokers between Energy and SE?" | Sector includes "Energy" + SE Engagement = "Engaged" + Network Analysis Betweenness > 0.4 |
| "Which startups are innovating in our space?" | Scale = "Micro/Startup" + Sector matches our focus + Collaborative Readiness = "Open" |
| "Are we geographically balanced?" | Group by Geography; count by region; identify gaps |
| "What's our engagement pipeline health?" | Filter by Engagement Stage; count by stage; track conversion rates |

---

## Implementation Roadmap

### Phase 1: Essential Categories
- ✅ Inside/Outside INCOSE (current)
- ✅ Add: **SE Engagement Level**
- ✅ Add: **Sector/Domain**
- ✅ Add: **Engagement Stage**

### Phase 2: Strategic Categories
- ✅ Add: **Decision-Making Authority**
- ✅ Add: **Scale Category**
- ✅ Add: **Collaborative Readiness**

### Phase 3: Advanced Categories
- ✅ Add: **Sustainability Maturity**
- ✅ Add: **Geography**
- ✅ Add: **Flow Contribution Type**

### Phase 3+: Computed/Derived
- ✅ Network metrics (degree, betweenness, clustering, community)
- ✅ Engagement velocity (trend over time)
- ✅ Sector health (cluster connectivity, diversity)

---

## Transition Recommendation

**Keep the Inside/Outside INCOSE categorization** (useful distinction for governance/membership questions), but **add these new dimensions immediately** (Phase 1).

The system becomes more powerful when you can answer multi-dimensional questions:

> "Show me Global Mega-Orgs in the Energy sector that are Sustainability Leaders with high Collaborative Readiness and no existing SuWG partnership"

That query reveals **high-value targets** in one filter.

---

## Airtable Configuration Example

```
Stakeholder Fields (Suggested):
  - Name (Text)
  - Contact (Email)
  - Organization Type (Single Select: NGO, Research, Industrial, etc.)
  
  [CATEGORIZATION DIMENSIONS]
  - Inside/Outside INCOSE (Single Select)
  - Decision Authority (Single Select)
  - SE Engagement Level (Single Select)
  - Primary Sector (Single Select)
  - Secondary Sectors (Multi-Select)
  - Scale Category (Single Select)
  - Sustainability Maturity (Single Select)
  - Collaborative Readiness (Single Select)
  - Engagement Stage (Single Select)
  - Primary Geography (Single Select)
  - Secondary Geographies (Multi-Select)
  - Primary Flow Contribution (Single Select)
  - Secondary Flow Contributions (Multi-Select)
  
  [ENGAGEMENT & METRICS]
  - Priority Level (Single Select)
  - Engagement Score (Number 0–100)
  - Stage Entered Date (Date)
  - Last Updated (Date)
  - Notes (Long Text)
```

---

**Benefits:** You move from **flat, binary thinking** (In/Out) to **rich, multi-dimensional analysis** that reveals patterns invisible in 1D.

