// ============================================================================
// Stakeholder Mapping Library — SysML v2 Model
// INCOSE Sustainability Working Group
// ============================================================================
// Single consolidated file with three packages:
//   1. StakeholderMapping_Enums — 26 enumeration definitions
//   2. StakeholderMapping_Defs — Entity definitions (Stakeholder, Relationship, ComputedMetrics)
//   3. StakeholderMapping_Registry — Registry container
// ============================================================================

package StakeholderMapping_Enums {
    doc /* Stakeholder Mapping — All Enumeration Definitions
         * 26 enums covering entity classification, operational attributes,
         * relationship types, and 9 categorization dimensions.
         */

    private import ScalarValues::*;

    // --- Primary Entity Classification (3 enums) ---

    enum def Category :> ScalarValues::Integer {
        enum InsideINCOSE = 1;
        enum OutsideINCOSE = 2;
    }

    enum def IncoseEntityType :> ScalarValues::Integer {
        enum WorkingGroup = 1;
        enum TechOps = 2;
        enum LeadershipBoardExecutive = 3;
        enum Chapter = 4;
        enum MemberCommunity = 5;
        enum Liaison = 6;
    }

    enum def OrgType :> ScalarValues::Integer {
        enum NGO = 1;
        enum ResearchGroupInstitute = 2;
        enum IndustrialCompany = 3;
        enum IndustryConsortiumSectorialAlliance = 4;
        enum ConsultingFirm = 5;
        enum EducationAcademia = 6;
        enum StandardsBody = 7;
        enum PolicyMakerRegulator = 8;
        enum ThinkTank = 9;
        enum FundingBodyGrantAgency = 10;
        enum ProfessionalAssociation = 11;
        enum TechnologyProvider = 12;
        enum IndustryFederation = 13;
        enum MediaCommunicationChannel = 14;
    }

    // --- Geographic & Scope (1 enum) ---

    enum def GeographicScope :> ScalarValues::Integer {
        enum Global = 1;
        enum Regional = 2;
        enum National = 3;
        enum Local = 4;
    }

    // --- Operational Attributes (3 enums) ---

    enum def FundingModel :> ScalarValues::Integer {
        enum Public = 1;
        enum Private = 2;
        enum Membership = 3;
        enum Grant = 4;
        enum Mixed = 5;
    }

    enum def EngagementStatus :> ScalarValues::Integer {
        enum Prospect = 1;
        enum InOutreach = 2;
        enum Active = 3;
        enum Inactive = 4;
    }

    enum def PriorityLevel :> ScalarValues::Integer {
        enum High = 1;
        enum Medium = 2;
        enum Low = 3;
    }

    // --- Capability Assessment (3 enums) ---

    enum def SEMaturityLevel :> ScalarValues::Integer {
        enum Basic = 1;
        enum Practitioner = 2;
        enum Advanced = 3;
    }

    enum def BudgetResourceAvailability :> ScalarValues::Integer {
        enum Limited = 1;
        enum Moderate = 2;
        enum Strong = 3;
    }

    enum def DecisionMakingSpeed :> ScalarValues::Integer {
        enum Slow = 1;
        enum Moderate = 2;
        enum Fast = 3;
    }

    // --- Knowledge & Policy (4 enums) ---

    enum def OpenDataPublicationsPolicy :> ScalarValues::Integer {
        enum CCLicensed = 1;
        enum OpenAccess = 2;
        enum Proprietary = 3;
        enum Mixed = 4;
    }

    enum def SEAwarenessLevel :> ScalarValues::Integer {
        enum Unaware = 1;
        enum Aware = 2;
        enum Engaged = 3;
        enum Expert = 4;
    }

    enum def SustainabilityMaturity :> ScalarValues::Integer {
        enum Leader = 1;
        enum Committed = 2;
        enum Aware = 3;
        enum Lagging = 4;
    }

    enum def CoProductionReadiness :> ScalarValues::Integer {
        enum Low = 1;
        enum Medium = 2;
        enum High = 3;
    }

    // --- Relationship Types (4 enums) ---

    enum def RelationshipType :> ScalarValues::Integer {
        enum FormalLiaison = 1;
        enum CollaborationActive = 2;
        enum CollaborationPlanned = 3;
        enum KnowledgeFlow = 4;
        enum AudienceOverlap = 5;
        enum StandardsAlignment = 6;
        enum FundingRelationship = 7;
        enum MembershipAffiliation = 8;
        enum AlumniSpinoff = 9;
        enum CompetitiveOverlap = 10;
        enum AspirationalTarget = 11;
    }

    enum def RelationshipDirection :> ScalarValues::Integer {
        enum Unidirectional = 1;
        enum Bidirectional = 2;
    }

    enum def StrengthFrequency :> ScalarValues::Integer {
        enum Strong = 1;
        enum Weak = 2;
        enum Dormant = 3;
    }

    enum def FlowType :> ScalarValues::Integer {
        enum Knowledge = 1;
        enum Funding = 2;
        enum AudienceReach = 3;
        enum CoAuthorship = 4;
        enum StandardsInfluence = 5;
        enum TalentPipeline = 6;
        enum LegitimacyEndorsement = 7;
        enum DataEvidence = 8;
    }

    // --- 9 Categorization Dimensions (9 enums) ---

    enum def DecisionAuthorityCategory :> ScalarValues::Integer {
        enum PolicyMakersRegulators = 1;
        enum StandardsSetters = 2;
        enum MarketLeadersIncumbents = 3;
        enum EcosystemBuildersConveners = 4;
        enum AdvocatesThoughtLeaders = 5;
        enum ImplementersPractitioners = 6;
        enum LearnersEmergingPlayers = 7;
    }

    enum def SEEngagementLevel :> ScalarValues::Integer {
        enum SEUnaware = 1;
        enum SEAware = 2;
        enum SEEngaged = 3;
        enum SEExpert = 4;
    }

    enum def SectorDomain :> ScalarValues::Integer {
        enum Energy = 1;
        enum Transportation = 2;
        enum BuiltEnvironment = 3;
        enum CircularEconomy = 4;
        enum FoodAgriculture = 5;
        enum ConsumerProductsRetail = 6;
        enum ChemicalsMaterials = 7;
        enum WaterSanitation = 8;
        enum GovernancePolicyStandards = 9;
        enum EducationResearch = 10;
        enum FinanceResponsibleInvestment = 11;
        enum ITDigitalSolutions = 12;
        enum ConsultingProfessionalServices = 13;
        enum HealthPharmaceuticals = 14;
    }

    enum def ScaleCategory :> ScalarValues::Integer {
        enum GlobalMegaOrg = 1;
        enum LargeRegional = 2;
        enum MidMarket = 3;
        enum SmallFocused = 4;
        enum MicroStartup = 5;
        enum NetworkAssociation = 6;
    }

    enum def CollaborativeReadiness :> ScalarValues::Integer {
        enum ReadyToCoDevelop = 1;
        enum OpenAndInterested = 2;
        enum PoliteCautious = 3;
        enum DistantReluctant = 4;
        enum ActivelyResistant = 5;
    }

    enum def EngagementStage :> ScalarValues::Integer {
        enum Identified = 1;
        enum Prospect = 2;
        enum Engaged = 3;
        enum ActivePartnership = 4;
        enum Dormant = 5;
        enum Concluded = 6;
    }

    enum def GeographyCategory :> ScalarValues::Integer {
        enum Global = 1;
        enum Continental = 2;
        enum National = 3;
        enum RegionalLocal = 4;
        enum DistributedNetworked = 5;
    }

    enum def FlowContributionType :> ScalarValues::Integer {
        enum KnowledgeExpertise = 1;
        enum StandardsRegulation = 2;
        enum FundingResources = 3;
        enum MarketAudience = 4;
        enum ImplementationValidation = 5;
        enum AdvocacyVoice = 6;
        enum TalentTraining = 7;
    }
}

package StakeholderMapping_Defs {
    doc /* Stakeholder Mapping — Entity Definitions
         * Abstract base Stakeholder with two specializations (IncoseStakeholder, ExternalStakeholder),
         * Relationship definition for edges, and ComputedMetrics value record.
         */

    private import ScalarValues::*;
    private import StakeholderMapping_Enums::*;

    // --- Abstract Base Stakeholder ---

    abstract part def Stakeholder {
        doc /* Base class for all stakeholders (both Inside and Outside INCOSE).
             * Do not instantiate directly — use IncoseStakeholder or ExternalStakeholder.
             * Contains 36+ shared attributes across core, suggested, and categorization dimensions.
             */

        // --- Core Identification ---
        attribute id : String;
        attribute name : String;
        attribute category : Category;
        attribute lastUpdated : String;
        attribute notes : String;

        // --- Core Engagement ---
        attribute engagementStatus : EngagementStatus;
        attribute priorityLevel : PriorityLevel;
        attribute engagementScore : Integer;

        // --- Suggested: Synergy & Strategic Context ---
        attribute audienceOverlapIndex : Integer;
        attribute complementaryCapability : String;
        attribute coProductionReadiness : CoProductionReadiness;
        attribute influenceReachEstimate : Integer;
        attribute sustainabilityMaturity : SustainabilityMaturity;
        attribute knowledgeGapTheyHave : String;
        attribute triggerEventDate : String;
        attribute triggerEventDescription : String;

        // --- Categorization Dimension 1: Decision Authority ---
        attribute decisionAuthorityCategory : DecisionAuthorityCategory;

        // --- Categorization Dimension 2: SE Engagement Level ---
        attribute seEngagementLevel : SEEngagementLevel;

        // --- Categorization Dimension 3: Primary Sector + Secondary Sectors ---
        attribute primarySector : SectorDomain;
        attribute secondarySectors : SectorDomain[*];

        // --- Categorization Dimension 4: Organization Scale ---
        attribute scaleCategory : ScaleCategory;

        // --- Categorization Dimension 5: Collaborative Readiness ---
        attribute collaborativeReadiness : CollaborativeReadiness;

        // --- Categorization Dimension 6: Engagement Stage (Relationship Maturity) ---
        attribute engagementStage : EngagementStage;
        attribute stageEnteredDate : String;
        attribute nextAction : String;
        attribute nextActionDate : String;

        // --- Categorization Dimension 7: Primary Geography + Secondary Geographies ---
        attribute primaryGeography : GeographyCategory;
        attribute secondaryGeographies : GeographyCategory[*];

        // --- Categorization Dimensions 8 & 9: Flow Contributions ---
        attribute primaryFlowContribution : FlowContributionType;
        attribute secondaryFlowContributions : FlowContributionType[*];
    }

    // --- INCOSE Stakeholder Specialization ---

    part def IncoseStakeholder :> Stakeholder {
        doc /* Stakeholder within INCOSE organizational structure.
             * Includes charter/mandate, leadership, membership, and INCOSE-specific maturity metrics.
             */

        // --- INCOSE-specific Core Fields ---
        attribute incoseEntityType : IncoseEntityType;
        attribute charterMandate : String;
        attribute geographicScope : GeographicScope;
        attribute activeSustainabilityInitiatives : String;
        attribute currentLeadershipName : String;
        attribute currentLeadershipTitle : String;
        attribute currentLeadershipEmail : String;
        attribute membershipSizeEstimate : Integer;
        attribute communicationChannels : String;
        attribute hasFormalLiaisonWithSuWG : Boolean;

        // --- INCOSE-specific Suggested Fields ---
        attribute seMaturityLevel : SEMaturityLevel;
        attribute budgetResourceAvailability : BudgetResourceAvailability;
        attribute decisionMakingSpeed : DecisionMakingSpeed;
    }

    // --- External Stakeholder Specialization ---

    part def ExternalStakeholder :> Stakeholder {
        doc /* Stakeholder outside INCOSE organizational structure.
             * Includes organization type, domain focus, contact, funding model, and external-specific attributes.
             */

        // --- External-specific Core Fields ---
        attribute orgType : OrgType;
        attribute hqCountry : String;
        attribute geographicScope : GeographicScope;
        attribute primaryDomainFocus : String;
        attribute keyPublicationsOutputs : String;
        attribute websiteUrl : String;
        attribute keyContactName : String;
        attribute keyContactTitle : String;
        attribute keyContactEmail : String;
        attribute audienceServed : String;
        attribute fundingModel : FundingModel;

        // --- External-specific Suggested Fields ---
        attribute standardsCertificationsIssued : String;
        attribute seAwarenessLevel : SEAwarenessLevel;
        attribute openDataPublicationsPolicy : OpenDataPublicationsPolicy;
        attribute languagesOfOperation : String;
        attribute sdgAlignment : String;
    }

    // --- Relationship (Edge) Definition ---

    part def Relationship {
        doc /* Directed or undirected edge between two stakeholders.
             * sourceStakeholderId and targetStakeholderId are UUID strings
             * referencing Stakeholder.id in the registry.
             * The semantic type of referenced entities is: Stakeholder (abstract base).
             * Validation: sourceStakeholderId != targetStakeholderId (no self-loops).
             * Validation: if relationshipType = AspirationalTarget, then direction = Unidirectional.
             */

        // --- Core Fields ---
        attribute id : String;
        attribute sourceStakeholderId : String;
        attribute targetStakeholderId : String;
        attribute relationshipType : RelationshipType;
        attribute direction : RelationshipDirection;
        attribute strengthFrequency : StrengthFrequency;
        attribute originDescription : String;
        attribute dateEstablished : String;
        attribute primaryContactSourceName : String;
        attribute primaryContactSourceEmail : String;
        attribute primaryContactTargetName : String;
        attribute primaryContactTargetEmail : String;
        attribute lastUpdated : String;
        attribute notes : String;

        // --- Suggested Fields (Flow & Collaboration) ---
        attribute flowTypes : FlowType[*];
        attribute collaborationPotentialScore : Integer;
        attribute blockerGapDescription : String;
        attribute sharedGoalsOverlap : String[*];
        attribute lastInteractionDate : String;
    }

    // --- Computed Metrics Value Record ---

    attribute def ComputedMetrics {
        doc /* Network analysis results derived from graph structure.
             * Computed by NetworkX pipeline; keyed to a Stakeholder by stakeholderId.
             * All fields are 0-1 floats (normalized centrality metrics) except communityId (Integer).
             */

        attribute stakeholderId : String;
        attribute degreeCentrality : Real;
        attribute betweennessCentrality : Real;
        attribute closenessCentrality : Real;
        attribute clusteringCoefficient : Real;
        attribute communityId : Integer;
        attribute structuralHoleScore : Real;
        attribute networkGrowthRate : Real;
        attribute dormancyScore : Real;
        attribute brokerPotential : Real;
    }
}

package StakeholderMapping_Registry {
    doc /* Stakeholder Mapping — Registry Container
         * Top-level part def holding all three collections: stakeholders, relationships, and computed metrics.
         * This mirrors the Airtable three-table design (Stakeholders, Relationships, Computed Metrics).
         */

    private import StakeholderMapping_Defs::*;

    part def StakeholderRegistry {
        doc /* Container for the complete stakeholder ecosystem registry.
             * In practice, instances are entered as part usages conforming to this definition,
             * and read via the SysML v2 REST API for network analysis.
             */

        part stakeholders : Stakeholder[*];
        part relationships : Relationship[*];
        attribute computedMetrics : ComputedMetrics[*];
    }
}
