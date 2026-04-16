// ============================================================================
// Stakeholder Mapping Instances — SysML v2 Model
// INCOSE Sustainability Working Group
// ============================================================================
// Phase 2: Actual stakeholder and relationship data instances from the network diagram
// Populated: 2026-04-16
// ============================================================================

package StakeholderMapping_Instances {
    doc /* Stakeholder Mapping Instances
         * Part usages conforming to StakeholderMapping_Library definitions.
         * Data entry covers:
         * - 11 external stakeholder organizations
         * - 1 INCOSE entity (Sustainability Working Group)
         * - 10+ relationships mapping the network ecosystem
         */

    private import StakeholderMapping_Library::StakeholderMapping_Enums::*;
    private import StakeholderMapping_Library::StakeholderMapping_Defs::*;

    // --- INCOSE Internal Stakeholder ---

    part suWG : IncoseStakeholder {
        attribute id = "incose-suwg-001";
        attribute name = "Sustainability Working Group";
        attribute category = Category::InsideINCOSE;
        attribute incoseEntityType = IncoseEntityType::WorkingGroup;
        attribute charterMandate = "Advance sustainable systems engineering practice and standards within INCOSE and broader industry ecosystem";
        attribute geographicScope = GeographicScope::Global;
        attribute activeSustainabilityInitiatives = "Stakeholder Mapping, Industry Needs Analysis, Standards Development";
        attribute currentLeadershipName = "INCOSE SuWG Leadership Team";
        attribute currentLeadershipEmail = "sustainability@incose.org";
        attribute engagementStatus = EngagementStatus::Active;
        attribute priorityLevel = PriorityLevel::High;
        attribute engagementScore = 95;
        attribute decisionAuthorityCategory = DecisionAuthorityCategory::StandardsSetters;
        attribute seEngagementLevel = SEEngagementLevel::SEExpert;
        attribute primarySector = SectorDomain::GovernancePolicyStandards;
        attribute scaleCategory = ScaleCategory::GlobalMegaOrg;
        attribute collaborativeReadiness = CollaborativeReadiness::ReadyToCoDevelop;
        attribute engagementStage = EngagementStage::ActivePartnership;
        attribute primaryGeography = GeographyCategory::Global;
        attribute primaryFlowContribution = FlowContributionType::KnowledgeExpertise;
        attribute seMaturityLevel = SEMaturityLevel::Advanced;
        attribute budgetResourceAvailability = BudgetResourceAvailability::Strong;
        attribute decisionMakingSpeed = DecisionMakingSpeed::Moderate;
        attribute lastUpdated = "2026-04-16";
        attribute notes = "Central node in ecosystem mapping; coordinates with all major stakeholder organizations";
    }

    // --- External Stakeholders ---

    part wfeo : ExternalStakeholder {
        attribute id = "ext-wfeo-001";
        attribute name = "World Federation of Engineering Organizations";
        attribute category = Category::OutsideINCOSE;
        attribute orgType = OrgType::ProfessionalAssociation;
        attribute hqCountry = "Switzerland";
        attribute geographicScope = GeographicScope::Global;
        attribute primaryDomainFocus = "Engineering practice, standards, and education globally";
        attribute keyContactName = "WFEO Secretariat";
        attribute websiteUrl = "https://www.wfeo.org";
        attribute audienceServed = "Engineering practitioners, organizations, policy makers worldwide";
        attribute fundingModel = FundingModel::Membership;
        attribute engagementStatus = EngagementStatus::Prospect;
        attribute priorityLevel = PriorityLevel::High;
        attribute engagementScore = 70;
        attribute audienceOverlapIndex = 65;
        attribute complementaryCapability = "Global engineering federation network; standards influence and member reach";
        attribute coProductionReadiness = CoProductionReadiness::Medium;
        attribute influenceReachEstimate = 500000;
        attribute sustainabilityMaturity = SustainabilityMaturity::Aware;
        attribute seEngagementLevel = SEEngagementLevel::SEAware;
        attribute primarySector = SectorDomain::GovernancePolicyStandards;
        attribute scaleCategory = ScaleCategory::GlobalMegaOrg;
        attribute collaborativeReadiness = CollaborativeReadiness::OpenAndInterested;
        attribute engagementStage = EngagementStage::Prospect;
        attribute primaryGeography = GeographyCategory::Global;
        attribute primaryFlowContribution = FlowContributionType::StandardsRegulation;
        attribute seAwarenessLevel = SEAwarenessLevel::Aware;
        attribute openDataPublicationsPolicy = OpenDataPublicationsPolicy::OpenAccess;
        attribute sdgAlignment = "SDG-4 (Education), SDG-9 (Industry Innovation)";
        attribute lastUpdated = "2026-04-16";
        attribute notes = "Key partner for reaching global engineering community; standards alignment potential";
    }

    part gfse : ExternalStakeholder {
        attribute id = "ext-gfse-001";
        attribute name = "Gesellschaft für Systems Engineering (GfSE)";
        attribute category = Category::OutsideINCOSE;
        attribute orgType = OrgType::ProfessionalAssociation;
        attribute hqCountry = "Germany";
        attribute geographicScope = GeographicScope::Regional;
        attribute primaryDomainFocus = "Systems engineering practice and standards in German-speaking region";
        attribute keyContactName = "GfSE Leadership";
        attribute websiteUrl = "https://www.gfse.de";
        attribute audienceServed = "SE practitioners, companies, educators in DACH region";
        attribute fundingModel = FundingModel::Membership;
        attribute engagementStatus = EngagementStatus::Active;
        attribute priorityLevel = PriorityLevel::High;
        attribute engagementScore = 80;
        attribute audienceOverlapIndex = 75;
        attribute complementaryCapability = "Strong regional SE community; standards expertise";
        attribute coProductionReadiness = CoProductionReadiness::High;
        attribute influenceReachEstimate = 50000;
        attribute sustainabilityMaturity = SustainabilityMaturity::Committed;
        attribute seEngagementLevel = SEEngagementLevel::SEExpert;
        attribute primarySector = SectorDomain::GovernancePolicyStandards;
        attribute scaleCategory = ScaleCategory::LargeRegional;
        attribute collaborativeReadiness = CollaborativeReadiness::ReadyToCoDevelop;
        attribute engagementStage = EngagementStage::ActivePartnership;
        attribute primaryGeography = GeographyCategory::Continental;
        attribute primaryFlowContribution = FlowContributionType::StandardsRegulation;
        attribute seAwarenessLevel = SEAwarenessLevel::Expert;
        attribute languagesOfOperation = "German, English";
        attribute lastUpdated = "2026-04-16";
        attribute notes = "Active collaboration opportunity; strong SE maturity and sustainability commitment";
    }

    part ieee : ExternalStakeholder {
        attribute id = "ext-ieee-001";
        attribute name = "IEEE";
        attribute category = Category::OutsideINCOSE;
        attribute orgType = OrgType::ProfessionalAssociation;
        attribute hqCountry = "United States";
        attribute geographicScope = GeographicScope::Global;
        attribute primaryDomainFocus = "Electrical engineering, computing, technology innovation and standards";
        attribute keyContactName = "IEEE Sustainability Initiative";
        attribute websiteUrl = "https://www.ieee.org";
        attribute audienceServed = "Technologists, engineers, academics, industry practitioners worldwide";
        attribute fundingModel = FundingModel::Membership;
        attribute engagementStatus = EngagementStatus::Active;
        attribute priorityLevel = PriorityLevel::High;
        attribute engagementScore = 75;
        attribute audienceOverlapIndex = 60;
        attribute complementaryCapability = "Standards bodies; technology community; sustainability initiatives (IEEE Positive 50)";
        attribute coProductionReadiness = CoProductionReadiness::Medium;
        attribute influenceReachEstimate = 400000;
        attribute sustainabilityMaturity = SustainabilityMaturity::Aware;
        attribute seEngagementLevel = SEEngagementLevel::SEAware;
        attribute primarySector = SectorDomain::ITDigitalSolutions;
        attribute secondarySectors = SectorDomain::Energy;
        attribute scaleCategory = ScaleCategory::GlobalMegaOrg;
        attribute collaborativeReadiness = CollaborativeReadiness::OpenAndInterested;
        attribute engagementStage = EngagementStage::Engaged;
        attribute primaryGeography = GeographyCategory::Global;
        attribute primaryFlowContribution = FlowContributionType::StandardsRegulation;
        attribute secondaryFlowContributions = FlowContributionType::KnowledgeExpertise;
        attribute seAwarenessLevel = SEAwarenessLevel::Aware;
        attribute openDataPublicationsPolicy = OpenDataPublicationsPolicy::OpenAccess;
        attribute sdgAlignment = "SDG-7 (Clean Energy), SDG-9 (Innovation)";
        attribute lastUpdated = "2026-04-16";
        attribute notes = "Established sustainability initiative (IEEE Positive 50); strong standards influence";
    }

    part incoseGlobal : ExternalStakeholder {
        attribute id = "ext-incose-global-001";
        attribute name = "INCOSE (Global Organization)";
        attribute category = Category::OutsideINCOSE;
        attribute orgType = OrgType::ProfessionalAssociation;
        attribute hqCountry = "United States";
        attribute geographicScope = GeographicScope::Global;
        attribute primaryDomainFocus = "Systems engineering education, standards, and professional practice";
        attribute keyContactName = "INCOSE Global Leadership";
        attribute websiteUrl = "https://www.incose.org";
        attribute audienceServed = "SE practitioners, organizations, educators, students worldwide";
        attribute fundingModel = FundingModel::Membership;
        attribute engagementStatus = EngagementStatus::Active;
        attribute priorityLevel = PriorityLevel::High;
        attribute engagementScore = 100;
        attribute audienceOverlapIndex = 100;
        attribute complementaryCapability = "Systems engineering discipline; standards; global reach";
        attribute coProductionReadiness = CoProductionReadiness::High;
        attribute influenceReachEstimate = 25000;
        attribute sustainabilityMaturity = SustainabilityMaturity::Committed;
        attribute seEngagementLevel = SEEngagementLevel::SEExpert;
        attribute primarySector = SectorDomain::GovernancePolicyStandards;
        attribute scaleCategory = ScaleCategory::GlobalMegaOrg;
        attribute collaborativeReadiness = CollaborativeReadiness::ReadyToCoDevelop;
        attribute engagementStage = EngagementStage::ActivePartnership;
        attribute primaryGeography = GeographyCategory::Global;
        attribute primaryFlowContribution = FlowContributionType::KnowledgeExpertise;
        attribute secondaryFlowContributions = FlowContributionType::StandardsRegulation;
        attribute seAwarenessLevel = SEAwarenessLevel::Expert;
        attribute openDataPublicationsPolicy = OpenDataPublicationsPolicy::OpenAccess;
        attribute sdgAlignment = "SDG-4 (Education), SDG-9 (Industry Innovation), SDG-12 (Sustainable Consumption)";
        attribute lastUpdated = "2026-04-16";
        attribute notes = "Parent organization; ensures SuWG initiatives align with broader INCOSE strategy";
    }

    part circularEconomyCoops : ExternalStakeholder {
        attribute id = "ext-circ-coop-001";
        attribute name = "Circular Economy - CoOps (Platform)";
        attribute category = Category::OutsideINCOSE;
        attribute orgType = OrgType::IndustryConsortiumSectorialAlliance;
        attribute hqCountry = "Netherlands";
        attribute geographicScope = GeographicScope::Global;
        attribute primaryDomainFocus = "Circular economy models, cooperative business, platform ecosystems";
        attribute keyContactName = "CoOps Platform Coordination";
        attribute websiteUrl = "https://coops.org";
        attribute audienceServed = "Enterprises, cooperatives, social enterprises, policymakers";
        attribute fundingModel = FundingModel::Mixed;
        attribute engagementStatus = EngagementStatus::Prospect;
        attribute priorityLevel = PriorityLevel::Medium;
        attribute engagementScore = 65;
        attribute audienceOverlapIndex = 55;
        attribute complementaryCapability = "Circular economy expertise; platform and business model innovation";
        attribute coProductionReadiness = CoProductionReadiness::Medium;
        attribute influenceReachEstimate = 200000;
        attribute sustainabilityMaturity = SustainabilityMaturity::Leader;
        attribute seEngagementLevel = SEEngagementLevel::SEUnaware;
        attribute primarySector = SectorDomain::CircularEconomy;
        attribute secondarySectors = SectorDomain::GovernancePolicyStandards;
        attribute scaleCategory = ScaleCategory::MidMarket;
        attribute collaborativeReadiness = CollaborativeReadiness::OpenAndInterested;
        attribute engagementStage = EngagementStage::Prospect;
        attribute primaryGeography = GeographyCategory::Global;
        attribute primaryFlowContribution = FlowContributionType::KnowledgeExpertise;
        attribute seAwarenessLevel = SEAwarenessLevel::Unaware;
        attribute openDataPublicationsPolicy = OpenDataPublicationsPolicy::Mixed;
        attribute sdgAlignment = "SDG-8 (Decent Work), SDG-12 (Responsible Consumption), SDG-13 (Climate Action)";
        attribute lastUpdated = "2026-04-16";
        attribute notes = "Knowledge gap: SE awareness; opportunity to introduce SE maturity to circular economy community";
    }

    part netPositiveAdvisory : ExternalStakeholder {
        attribute id = "ext-netpos-001";
        attribute name = "Net-Positive Advisory Panel";
        attribute category = Category::OutsideINCOSE;
        attribute orgType = OrgType::ThinkTank;
        attribute hqCountry = "United Kingdom";
        attribute geographicScope = GeographicScope::Regional;
        attribute primaryDomainFocus = "Net-positive business models, regenerative sustainability, corporate strategy";
        attribute keyContactName = "Net-Positive Advisory Leadership";
        attribute websiteUrl = "https://netpositive.org";
        attribute audienceServed = "Corporations, policy makers, impact investors, sustainability leaders";
        attribute fundingModel = FundingModel::Mixed;
        attribute engagementStatus = EngagementStatus::Prospect;
        attribute priorityLevel = PriorityLevel::Medium;
        attribute engagementScore = 60;
        attribute audienceOverlapIndex = 50;
        attribute complementaryCapability = "Corporate sustainability strategy; net-positive business innovation";
        attribute coProductionReadiness = CoProductionReadiness::Low;
        attribute influenceReachEstimate = 100000;
        attribute sustainabilityMaturity = SustainabilityMaturity::Leader;
        attribute seEngagementLevel = SEEngagementLevel::SEUnaware;
        attribute primarySector = SectorDomain::GovernancePolicyStandards;
        attribute scaleCategory = ScaleCategory::SmallFocused;
        attribute collaborativeReadiness = CollaborativeReadiness::PoliteCautious;
        attribute engagementStage = EngagementStage::Identified;
        attribute primaryGeography = GeographyCategory::Continental;
        attribute primaryFlowContribution = FlowContributionType::AdvocacyVoice;
        attribute seAwarenessLevel = SEAwarenessLevel::Unaware;
        attribute sdgAlignment = "SDG-12 (Responsible Consumption), SDG-13 (Climate Action)";
        attribute lastUpdated = "2026-04-16";
        attribute notes = "Thought leader in net-positive strategy; potential knowledge exchange partner";
    }

    part flourishingBusiness : ExternalStakeholder {
        attribute id = "ext-flourish-001";
        attribute name = "Flourishing Business Model Community";
        attribute category = Category::OutsideINCOSE;
        attribute orgType = OrgType::ResearchGroupInstitute;
        attribute hqCountry = "Netherlands";
        attribute geographicScope = GeographicScope::Regional;
        attribute primaryDomainFocus = "Business model innovation, stakeholder value creation, systems thinking";
        attribute keyContactName = "Flourishing Business Community Leadership";
        attribute websiteUrl = "https://flourishingbusiness.org";
        attribute audienceServed = "Enterprises, entrepreneurs, academics, management practitioners";
        attribute fundingModel = FundingModel::Grant;
        attribute engagementStatus = EngagementStatus::Prospect;
        attribute priorityLevel = PriorityLevel::Medium;
        attribute engagementScore = 55;
        attribute audienceOverlapIndex = 45;
        attribute complementaryCapability = "Business model design; stakeholder systems thinking";
        attribute coProductionReadiness = CoProductionReadiness::Medium;
        attribute influenceReachEstimate = 80000;
        attribute sustainabilityMaturity = SustainabilityMaturity::Committed;
        attribute seEngagementLevel = SEEngagementLevel::SEUnaware;
        attribute primarySector = SectorDomain::GovernancePolicyStandards;
        attribute scaleCategory = ScaleCategory::SmallFocused;
        attribute collaborativeReadiness = CollaborativeReadiness::OpenAndInterested;
        attribute engagementStage = EngagementStage::Identified;
        attribute primaryGeography = GeographyCategory::Continental;
        attribute primaryFlowContribution = FlowContributionType::KnowledgeExpertise;
        attribute seAwarenessLevel = SEAwarenessLevel::Unaware;
        attribute openDataPublicationsPolicy = OpenDataPublicationsPolicy::OpenAccess;
        attribute sdgAlignment = "SDG-8 (Decent Work), SDG-12 (Responsible Consumption)";
        attribute lastUpdated = "2026-04-16";
        attribute notes = "Aligned on systems thinking; bridging opportunity for SE + business model innovation";
    }

    part cooperativeBusiness : ExternalStakeholder {
        attribute id = "ext-coop-business-001";
        attribute name = "Cooperative Business Models";
        attribute category = Category::OutsideINCOSE;
        attribute orgType = OrgType::IndustryConsortiumSectorialAlliance;
        attribute hqCountry = "Belgium";
        attribute geographicScope = GeographicScope::Regional;
        attribute primaryDomainFocus = "Cooperative business structures, social economy, equitable stakeholder models";
        attribute keyContactName = "Cooperative Models Network";
        attribute websiteUrl = "https://coopmodels.org";
        attribute audienceServed = "Worker cooperatives, social enterprises, policy makers, civil society";
        attribute fundingModel = FundingModel::Membership;
        attribute engagementStatus = EngagementStatus::Prospect;
        attribute priorityLevel = PriorityLevel::Low;
        attribute engagementScore = 50;
        attribute audienceOverlapIndex = 35;
        attribute complementaryCapability = "Cooperative governance and stakeholder value models";
        attribute coProductionReadiness = CoProductionReadiness::Low;
        attribute influenceReachEstimate = 50000;
        attribute sustainabilityMaturity = SustainabilityMaturity::Committed;
        attribute seEngagementLevel = SEEngagementLevel::SEUnaware;
        attribute primarySector = SectorDomain::GovernancePolicyStandards;
        attribute scaleCategory = ScaleCategory::SmallFocused;
        attribute collaborativeReadiness = CollaborativeReadiness::PoliteCautious;
        attribute engagementStage = EngagementStage::Identified;
        attribute primaryGeography = GeographyCategory::Continental;
        attribute primaryFlowContribution = FlowContributionType::AdvocacyVoice;
        attribute seAwarenessLevel = SEAwarenessLevel::Unaware;
        attribute openDataPublicationsPolicy = OpenDataPublicationsPolicy::OpenAccess;
        attribute sdgAlignment = "SDG-5 (Gender Equality), SDG-8 (Decent Work), SDG-10 (Reduced Inequality)";
        attribute lastUpdated = "2026-04-16";
        attribute notes = "Niche interest; potential for long-term value co-creation in governance models";
    }

    part commonEarthEducation : ExternalStakeholder {
        attribute id = "ext-education-001";
        attribute name = "Common Earth Education Initiative";
        attribute category = Category::OutsideINCOSE;
        attribute orgType = OrgType::EducationAcademia;
        attribute hqCountry = "United Kingdom";
        attribute geographicScope = GeographicScope::Regional;
        attribute primaryDomainFocus = "Education for sustainable development, systems literacy, school curriculum";
        attribute keyContactName = "Education Initiative Team";
        attribute websiteUrl = "https://commonearthleducation.org";
        attribute audienceServed = "Educators, schools, students, policy makers in education sector";
        attribute fundingModel = FundingModel::Grant;
        attribute engagementStatus = EngagementStatus::Prospect;
        attribute priorityLevel = PriorityLevel::Low;
        attribute engagementScore = 45;
        attribute audienceOverlapIndex = 30;
        attribute complementaryCapability = "Systems literacy education; early-career practitioner pipeline";
        attribute coProductionReadiness = CoProductionReadiness::Low;
        attribute influenceReachEstimate = 100000;
        attribute sustainabilityMaturity = SustainabilityMaturity::Aware;
        attribute seEngagementLevel = SEEngagementLevel::SEUnaware;
        attribute primarySector = SectorDomain::EducationResearch;
        attribute scaleCategory = ScaleCategory::SmallFocused;
        attribute collaborativeReadiness = CollaborativeReadiness::OpenAndInterested;
        attribute engagementStage = EngagementStage::Identified;
        attribute primaryGeography = GeographyCategory::Continental;
        attribute primaryFlowContribution = FlowContributionType::TalentTraining;
        attribute seAwarenessLevel = SEAwarenessLevel::Unaware;
        attribute openDataPublicationsPolicy = OpenDataPublicationsPolicy::OpenAccess;
        attribute sdgAlignment = "SDG-4 (Quality Education), SDG-12 (Responsible Consumption)";
        attribute lastUpdated = "2026-04-16";
        attribute notes = "Education & talent pipeline opportunity; long-term value for SE practitioner development";
    }

    part sarbau : ExternalStakeholder {
        attribute id = "ext-sarbau-001";
        attribute name = "Sarbau for Solutions";
        attribute category = Category::OutsideINCOSE;
        attribute orgType = OrgType::ConsultingFirm;
        attribute hqCountry = "Germany";
        attribute geographicScope = GeographicScope::Regional;
        attribute primaryDomainFocus = "Sustainable architecture, building design, circular construction";
        attribute keyContactName = "Sarbau Leadership";
        attribute websiteUrl = "https://sarbau.org";
        attribute audienceServed = "Architects, building professionals, sustainability consultants";
        attribute fundingModel = FundingModel::Mixed;
        attribute engagementStatus = EngagementStatus::Prospect;
        attribute priorityLevel = PriorityLevel::Low;
        attribute engagementScore = 40;
        attribute audienceOverlapIndex = 25;
        attribute complementaryCapability = "Built environment sustainability expertise";
        attribute coProductionReadiness = CoProductionReadiness::Low;
        attribute influenceReachEstimate = 30000;
        attribute sustainabilityMaturity = SustainabilityMaturity::Leader;
        attribute seEngagementLevel = SEEngagementLevel::SEUnaware;
        attribute primarySector = SectorDomain::BuiltEnvironment;
        attribute scaleCategory = ScaleCategory::SmallFocused;
        attribute collaborativeReadiness = CollaborativeReadiness::PoliteCautious;
        attribute engagementStage = EngagementStage::Identified;
        attribute primaryGeography = GeographyCategory::Regional;
        attribute primaryFlowContribution = FlowContributionType::KnowledgeExpertise;
        attribute seAwarenessLevel = SEAwarenessLevel::Unaware;
        attribute sdgAlignment = "SDG-11 (Sustainable Cities), SDG-12 (Responsible Consumption), SDG-13 (Climate Action)";
        attribute lastUpdated = "2026-04-16";
        attribute notes = "Sustainability maturity high; SE awareness low — potential for capability building partnership";
    }

    part afis : ExternalStakeholder {
        attribute id = "ext-afis-001";
        attribute name = "AFIS";
        attribute category = Category::OutsideINCOSE;
        attribute orgType = OrgType::ProfessionalAssociation;
        attribute hqCountry = "France";
        attribute geographicScope = GeographicScope::Regional;
        attribute primaryDomainFocus = "Systems engineering and information systems in French-speaking regions";
        attribute keyContactName = "AFIS Leadership";
        attribute websiteUrl = "https://www.afis.org";
        attribute audienceServed = "SE practitioners, organizations, academia in France and Francophone regions";
        attribute fundingModel = FundingModel::Membership;
        attribute engagementStatus = EngagementStatus::Active;
        attribute priorityLevel = PriorityLevel::High;
        attribute engagementScore = 75;
        attribute audienceOverlapIndex = 70;
        attribute complementaryCapability = "French SE community; language and cultural bridge";
        attribute coProductionReadiness = CoProductionReadiness::High;
        attribute influenceReachEstimate = 35000;
        attribute sustainabilityMaturity = SustainabilityMaturity::Aware;
        attribute seEngagementLevel = SEEngagementLevel::SEExpert;
        attribute primarySector = SectorDomain::GovernancePolicyStandards;
        attribute scaleCategory = ScaleCategory::MidMarket;
        attribute collaborativeReadiness = CollaborativeReadiness::ReadyToCoDevelop;
        attribute engagementStage = EngagementStage::Engaged;
        attribute primaryGeography = GeographyCategory::Continental;
        attribute primaryFlowContribution = FlowContributionType::StandardsRegulation;
        attribute seAwarenessLevel = SEAwarenessLevel::Expert;
        attribute languagesOfOperation = "French, English";
        attribute sdgAlignment = "SDG-4 (Education), SDG-9 (Industry Innovation)";
        attribute lastUpdated = "2026-04-16";
        attribute notes = "Active engagement; partner for European SE community coordination";
    }

    // --- Relationships (10+ edges mapping the network) ---

    part rel_suWG_incoseGlobal : Relationship {
        attribute id = "rel-001";
        attribute sourceStakeholderId = "incose-suwg-001";
        attribute targetStakeholderId = "ext-incose-global-001";
        attribute relationshipType = RelationshipType::FormalLiaison;
        attribute direction = RelationshipDirection::Bidirectional;
        attribute strengthFrequency = StrengthFrequency::Strong;
        attribute originDescription = "SuWG is working group within INCOSE structure";
        attribute dateEstablished = "2020-01-01";
        attribute primaryContactSourceName = "INCOSE SuWG Chair";
        attribute primaryContactTargetName = "INCOSE Global President";
        attribute flowTypes = { FlowType::Knowledge, FlowType::StandardsInfluence, FlowType::AudienceReach };
        attribute collaborationPotentialScore = 5;
        attribute sharedGoalsOverlap = { "G1", "G2", "G3" };
        attribute lastInteractionDate = "2026-04-15";
        attribute notes = "Governance alignment; ensures SuWG initiatives funded and supported";
    }

    part rel_suWG_gfse : Relationship {
        attribute id = "rel-002";
        attribute sourceStakeholderId = "incose-suwg-001";
        attribute targetStakeholderId = "ext-gfse-001";
        attribute relationshipType = RelationshipType::CollaborationActive;
        attribute direction = RelationshipDirection::Bidirectional;
        attribute strengthFrequency = StrengthFrequency::Strong;
        attribute originDescription = "Joint SE standards alignment initiatives";
        attribute dateEstablished = "2023-06-01";
        attribute primaryContactSourceName = "INCOSE SuWG Co-Chair";
        attribute primaryContactTargetName = "GfSE Executive Director";
        attribute flowTypes = { FlowType::Knowledge, FlowType::StandardsInfluence, FlowType::CoAuthorship };
        attribute collaborationPotentialScore = 5;
        attribute sharedGoalsOverlap = { "G1", "G2" };
        attribute lastInteractionDate = "2026-04-10";
        attribute notes = "Strong regional partnership; co-developing sustainability + SE standards";
    }

    part rel_suWG_ieee : Relationship {
        attribute id = "rel-003";
        attribute sourceStakeholderId = "incose-suwg-001";
        attribute targetStakeholderId = "ext-ieee-001";
        attribute relationshipType = RelationshipType::KnowledgeFlow;
        attribute direction = RelationshipDirection::Bidirectional;
        attribute strengthFrequency = StrengthFrequency::Weak;
        attribute originDescription = "IEEE Positive 50 sustainability initiative alignment";
        attribute dateEstablished = "2024-01-15";
        attribute primaryContactSourceName = "SuWG Liaison to Standards Bodies";
        attribute primaryContactTargetName = "IEEE Sustainability Officer";
        attribute flowTypes = { FlowType::Knowledge, FlowType::StandardsInfluence };
        attribute collaborationPotentialScore = 4;
        attribute sharedGoalsOverlap = { "G1", "G3" };
        attribute lastInteractionDate = "2026-03-20";
        attribute notes = "Early-stage knowledge exchange; mutual interest in sustainability + technology standards";
    }

    part rel_suWG_wfeo : Relationship {
        attribute id = "rel-004";
        attribute sourceStakeholderId = "incose-suwg-001";
        attribute targetStakeholderId = "ext-wfeo-001";
        attribute relationshipType = RelationshipType::AspirationalTarget;
        attribute direction = RelationshipDirection::Unidirectional;
        attribute strengthFrequency = StrengthFrequency::Dormant;
        attribute originDescription = "Target for broader engineering federation engagement";
        attribute dateEstablished = "2025-01-01";
        attribute primaryContactSourceName = "INCOSE SuWG External Affairs";
        attribute primaryContactTargetName = "WFEO Secretary General";
        attribute flowTypes = { FlowType::AudienceReach, FlowType::StandardsInfluence };
        attribute collaborationPotentialScore = 4;
        attribute sharedGoalsOverlap = { "G2", "G3" };
        attribute blockerGapDescription = "WFEO coordination required; multiple federation stakeholders to align";
        attribute lastInteractionDate = "2024-12-01";
        attribute notes = "High-potential partnership; reach global engineering community; currently prospecting";
    }

    part rel_suWG_circEconomy : Relationship {
        attribute id = "rel-005";
        attribute sourceStakeholderId = "incose-suwg-001";
        attribute targetStakeholderId = "ext-circ-coop-001";
        attribute relationshipType = RelationshipType::KnowledgeFlow;
        attribute direction = RelationshipDirection::Bidirectional;
        attribute strengthFrequency = StrengthFrequency::Weak;
        attribute originDescription = "Cross-sector sustainability learning exchange";
        attribute dateEstablished = "2024-09-01";
        attribute primaryContactSourceName = "SuWG Circular Economy Lead";
        attribute primaryContactTargetName = "CoOps Platform Director";
        attribute flowTypes = { FlowType::Knowledge, FlowType::AudienceReach };
        attribute collaborationPotentialScore = 3;
        attribute sharedGoalsOverlap = { "G1", "G3" };
        attribute blockerGapDescription = "SE awareness gap; need education on SE value to circular economy";
        attribute lastInteractionDate = "2026-02-15";
        attribute notes = "Knowledge asymmetry opportunity: SuWG introduces SE maturity; CoOps shares circular economy expertise";
    }

    part rel_gfse_ieee : Relationship {
        attribute id = "rel-006";
        attribute sourceStakeholderId = "ext-gfse-001";
        attribute targetStakeholderId = "ext-ieee-001";
        attribute relationshipType = RelationshipType::AudienceOverlap;
        attribute direction = RelationshipDirection::Bidirectional;
        attribute strengthFrequency = StrengthFrequency::Weak;
        attribute originDescription = "Overlapping professional communities; standards work";
        attribute dateEstablished = "2020-01-01";
        attribute primaryContactSourceName = "GfSE Standards Lead";
        attribute primaryContactTargetName = "IEEE Standards Coordination";
        attribute flowTypes = { FlowType::StandardsInfluence };
        attribute collaborationPotentialScore = 2;
        attribute sharedGoalsOverlap = { "G1" };
        attribute lastInteractionDate = "2023-06-01";
        attribute notes = "Indirect relationship; both active in SE + IT standards";
    }

    part rel_gfse_afis : Relationship {
        attribute id = "rel-007";
        attribute sourceStakeholderId = "ext-gfse-001";
        attribute targetStakeholderId = "ext-afis-001";
        attribute relationshipType = RelationshipType::CollaborationActive;
        attribute direction = RelationshipDirection::Bidirectional;
        attribute strengthFrequency = StrengthFrequency::Strong;
        attribute originDescription = "European SE association coordination";
        attribute dateEstablished = "2022-01-01";
        attribute primaryContactSourceName = "GfSE President";
        attribute primaryContactTargetName = "AFIS President";
        attribute flowTypes = { FlowType::Knowledge, FlowType::StandardsInfluence, FlowType::CoAuthorship };
        attribute collaborationPotentialScore = 5;
        attribute sharedGoalsOverlap = { "G1", "G2" };
        attribute lastInteractionDate = "2026-04-05";
        attribute notes = "Peer regional SE organizations; natural partners for coordinated outreach";
    }

    part rel_flourishing_netPositive : Relationship {
        attribute id = "rel-008";
        attribute sourceStakeholderId = "ext-flourish-001";
        attribute targetStakeholderId = "ext-netpos-001";
        attribute relationshipType = RelationshipType::AudienceOverlap;
        attribute direction = RelationshipDirection::Bidirectional;
        attribute strengthFrequency = StrengthFrequency::Weak;
        attribute originDescription = "Aligned on business model and corporate sustainability";
        attribute dateEstablished = "2023-01-01";
        attribute primaryContactSourceName = "Flourishing Business Network Lead";
        attribute primaryContactTargetName = "Net-Positive Advisory Director";
        attribute flowTypes = { FlowType::Knowledge };
        attribute collaborationPotentialScore = 3;
        attribute sharedGoalsOverlap = { "G1", "G3" };
        attribute lastInteractionDate = "2025-12-15";
        attribute notes = "Both focused on sustainable value creation; potential co-learning";
    }

    part rel_circEcon_coopBusiness : Relationship {
        attribute id = "rel-009";
        attribute sourceStakeholderId = "ext-circ-coop-001";
        attribute targetStakeholderId = "ext-coop-business-001";
        attribute relationshipType = RelationshipType::CollaborationActive;
        attribute direction = RelationshipDirection::Bidirectional;
        attribute strengthFrequency = StrengthFrequency::Strong;
        attribute originDescription = "Shared interest in cooperative and circular economic models";
        attribute dateEstablished = "2021-01-01";
        attribute primaryContactSourceName = "CoOps Platform Coordination";
        attribute primaryContactTargetName = "Cooperative Models Network Lead";
        attribute flowTypes = { FlowType::Knowledge, FlowType::AudienceReach, FlowType::CoAuthorship };
        attribute collaborationPotentialScore = 5;
        attribute sharedGoalsOverlap = { "G1", "G3" };
        attribute lastInteractionDate = "2026-03-30";
        attribute notes = "Natural partners; joint advocacy on equitable, circular models";
    }

    part rel_education_wfeo : Relationship {
        attribute id = "rel-010";
        attribute sourceStakeholderId = "ext-education-001";
        attribute targetStakeholderId = "ext-wfeo-001";
        attribute relationshipType = RelationshipType::KnowledgeFlow;
        attribute direction = RelationshipDirection::Unidirectional;
        attribute strengthFrequency = StrengthFrequency::Weak;
        attribute originDescription = "Curriculum alignment; learning from WFEO engineering education standards";
        attribute dateEstablished = "2023-06-01";
        attribute primaryContactSourceName = "Education Initiative Curriculum Lead";
        attribute primaryContactTargetName = "WFEO Education Committee";
        attribute flowTypes = { FlowType::Knowledge };
        attribute collaborationPotentialScore = 2;
        attribute sharedGoalsOverlap = { "G3" };
        attribute lastInteractionDate = "2025-12-01";
        attribute notes = "One-way knowledge pull; education initiative learning from WFEO standards";
    }

    part rel_sarbau_circEcon : Relationship {
        attribute id = "rel-011";
        attribute sourceStakeholderId = "ext-sarbau-001";
        attribute targetStakeholderId = "ext-circ-coop-001";
        attribute relationshipType = RelationshipType::KnowledgeFlow;
        attribute direction = RelationshipDirection::Bidirectional;
        attribute strengthFrequency = StrengthFrequency::Weak;
        attribute originDescription = "Circular economy application in built environment";
        attribute dateEstablished = "2024-01-01";
        attribute primaryContactSourceName = "Sarbau Sustainability Director";
        attribute primaryContactTargetName = "CoOps Built Environment Lead";
        attribute flowTypes = { FlowType::Knowledge, FlowType::DataEvidence };
        attribute collaborationPotentialScore = 3;
        attribute sharedGoalsOverlap = { "G1" };
        attribute lastInteractionDate = "2025-11-01";
        attribute notes = "Domain-specific knowledge exchange on circular building design";
    }

}
