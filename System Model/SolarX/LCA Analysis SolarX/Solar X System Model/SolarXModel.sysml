package SolarXModel {
    occurrence def SolarXProject {
        private import SYSMODLibrary::*;
        private import Views::asTreeDiagram;
        private import Views::asInterconnectionDiagram;

        // ── Items ────────────────────────────────────────────────────────────
        package SolarX_Items {
            item def SolarIrradiation;
            item def DCElectricity;
            item def ACElectricity;
            item def MonitoringData;
            item def ControlCommand;
            item def ConfigurationData;
            item def CommissioningReport;
            item def DiagnosticsData;
            item def MaintenanceRequest;
        }

        // ── Port Definitions ─────────────────────────────────────────────────
        package SolarX_PortDefinitions {
            private import SolarX_Items::*;

            port def SunPort {
                in item irradiation : SolarIrradiation;
            }
            port def DCPort {
                out item dc : DCElectricity;
                // internal use: PVCollection → PowerConversion
            }
            port def ACPort {
                out item electricity : ACElectricity;
                // internal use: PowerConversion → EnergyManagement, EnergyManagement ↔ GridInterface
            }
            port def GridPort {
                inout item electricity : ACElectricity;
                // bidirectional: one port per side; ~GridPort is also inout
            }
            port def HouseholdPort {
                out item electricity : ACElectricity;
            }
            port def HomeownerPort {
                in item command : ControlCommand;
                out item data : MonitoringData;
            }
            port def InstallerPort {
                in item configuration : ConfigurationData;
                out item report : CommissioningReport;
            }
            port def MaintenancePort {
                in item request : MaintenanceRequest;
                out item diagnostics : DiagnosticsData;
            }
            port def MonitoringDataPort {
                out item data : MonitoringData;
                // internal use: EnergyManagement → MonitoringSubsystem
            }
            port def ControlPort {
                out item command : ControlCommand;
                // internal use: EnergyManagement → subsystems
            }
        }

        // ── Step 1+2 — Problem Space ─────────────────────────────────────────
        package SolarX_ProblemSpace {
            requirement problemStatement_SolarX {
                doc
                /* Buildings and households depend entirely on centralized,
                 * fossil-fuel-based grid electricity, leading to high energy
                 * costs, CO₂ emissions, and vulnerability to grid outages.
                 * There is no local generation, storage, or intelligent
                 * energy management in place.
                 */
            }

            part systemIdea_SolarX {
                doc
                /* SolarX converts solar energy into usable household
                 * electricity — reducing energy costs, CO₂ emissions,
                 * and grid dependency for buildings and households.
                 */
            }

            satisfy problemStatement_SolarX by systemIdea_SolarX;

            view problemSpaceView {
                expose SolarXModel::SolarXProject::SolarX_ProblemSpace;
                attribute depth = 2;
                attribute fileName = "step1_2_problem_space";
                attribute fileType = "PNG";
                attribute zoomLevel = 3.0;
                render asTreeDiagram;
            }
        }

        // ── Step 3 — Stakeholders ────────────────────────────────────────────
        package SolarX_Stakeholders {
            part homeowner : SYSMODLibrary::Stakeholder {
                doc
                /* Buys and uses the system; directly affected by energy costs,
                 * system reliability, and return on investment.
                 */
                attribute :>> risk = SYSMODLibrary::LevelKind::high;
                attribute :>> motivation = SYSMODLibrary::LevelKind::high;
            }

            part gridOperator : SYSMODLibrary::Stakeholder {
                doc
                /* Manages the public grid; affected by feed-in power quality
                 * and grid stability from distributed PV systems.
                 */
                attribute :>> risk = SYSMODLibrary::LevelKind::medium;
                attribute :>> motivation = SYSMODLibrary::LevelKind::low;
            }

            part installer : SYSMODLibrary::Stakeholder {
                doc
                /* Installs and commissions the system; concerned with
                 * ease of installation and technical documentation.
                 */
                attribute :>> risk = SYSMODLibrary::LevelKind::low;
                attribute :>> motivation = SYSMODLibrary::LevelKind::medium;
            }

            part energyRegulator : SYSMODLibrary::Stakeholder {
                doc
                /* Sets feed-in tariffs and grid connection standards;
                 * concerned with compliance, safety, and grid impact.
                 */
                attribute :>> risk = SYSMODLibrary::LevelKind::medium;
                attribute :>> motivation = SYSMODLibrary::LevelKind::medium;
            }

            part maintenanceTechnician : SYSMODLibrary::Stakeholder {
                doc
                /* Maintains and repairs the system; concerned with
                 * diagnostics, accessibility, and spare parts.
                 */
                attribute :>> risk = SYSMODLibrary::LevelKind::low;
                attribute :>> motivation = SYSMODLibrary::LevelKind::medium;
            }

            part government : SYSMODLibrary::Stakeholder {
                doc
                /* Provides subsidies and financing support for PV adoption;
                 * concerned with energy transition targets and CO₂ reduction.
                 */
                attribute :>> risk = SYSMODLibrary::LevelKind::medium;
                attribute :>> motivation = SYSMODLibrary::LevelKind::high;
            }
        }

        // ── Step 4 — Requirements ────────────────────────────────────────────
        package SolarX_Requirements {
            private import SolarX_Stakeholders::*;
            private import SolarX_Context::*;

            // Functional Requirements
            requirement <'REQ-F1'> 'Convert solar irradiation to AC electricity' {
                subject theSubject = solarXContext::solarX;
                stakeholder homeowner;
                doc
                /* The system shall convert solar irradiation received by the
                 * PV array into AC electricity usable by household loads.
                 */
            }

            requirement <'REQ-F2'> 'Store excess electricity locally' {
                subject theSubject = solarXContext::solarX;
                stakeholder homeowner;
                doc
                /* The system shall store excess generated electricity
                 * in a local battery for later use.
                 */
            }

            requirement <'REQ-F3'> 'Supply electricity to household loads' {
                subject theSubject = solarXContext::solarX;
                stakeholder homeowner;
                doc
                /* The system shall supply AC electricity to the connected
                 * building or household loads.
                 */
            }

            requirement <'REQ-F4'> 'Feed surplus electricity into the public grid' {
                subject theSubject = solarXContext::solarX;
                stakeholder homeowner;
                stakeholder gridOperator;
                doc
                /* The system shall feed surplus electricity into the public
                 * grid when local generation exceeds load and storage capacity.
                 */
            }

            requirement <'REQ-F5'> 'Draw electricity from the public grid as backup' {
                subject theSubject = solarXContext::solarX;
                stakeholder homeowner;
                doc
                /* The system shall draw electricity from the public grid
                 * when local generation and battery storage are insufficient
                 * to meet household demand.
                 */
            }

            requirement <'REQ-F6'> 'Monitor and control energy flow' {
                subject theSubject = solarXContext::solarX;
                stakeholder homeowner;
                doc
                /* The system shall continuously monitor and intelligently
                 * control the energy flow between PV array, battery,
                 * household loads, and the public grid.
                 */
            }

            // Non-Functional Requirements
            requirement <'REQ-NF1'> 'Reduce household CO₂ emissions' {
                subject theSubject = solarXContext::solarX;
                stakeholder homeowner;
                stakeholder government;
                doc
                /* The system shall reduce CO₂ emissions associated with
                 * household electricity consumption compared to full
                 * dependency on grid power.
                 */
            }

            requirement <'REQ-NF2'> 'Comply with grid connection standards' {
                subject theSubject = solarXContext::solarX;
                stakeholder energyRegulator;
                stakeholder gridOperator;
                doc
                /* The system shall comply with applicable grid connection
                 * and feed-in standards for distributed PV systems.
                 */
            }

            requirement <'REQ-NF3'> 'Provide homeowner monitoring access' {
                subject theSubject = solarXContext::solarX;
                stakeholder homeowner;
                doc
                /* The system shall provide the homeowner with access to
                 * real-time and historical energy generation, consumption,
                 * and storage data.
                 */
            }

            requirement <'REQ-NF4'> 'Support installation and commissioning' {
                subject theSubject = solarXContext::solarX;
                stakeholder installer;
                doc
                /* The system shall be installable and configurable by a
                 * certified installer without requiring specialist
                 * software beyond standard commissioning tools.
                 */
            }
        }

        // ── Step 5 — System Context & Actors ────────────────────────────────
        package SolarX_Context {
            private import SolarX_PortDefinitions::*;
            private import SolarX_Stakeholders::*;

            part solarXContext {
                // The system under design
                part solarX {
                    port sunPort : SunPort;
                    port gridPort : GridPort;       // bidirectional grid connection
                    port householdPort : HouseholdPort;
                    port homeownerPort : HomeownerPort;
                    port installerPort : InstallerPort;
                    port maintenancePort : MaintenancePort;
                }

                // External actors
                part sun {
                    doc
                    /* External environment providing solar irradiation to the PV array. */
                    port systemPort : ~SunPort;
                }

                part publicGrid {
                    doc
                    /* Public electricity grid; exchanges power bidirectionally with SolarX. */
                    port systemPort : ~GridPort;    // single bidirectional conjugate port
                }

                part household {
                    doc
                    /* Building or household consuming electricity produced by SolarX. */
                    port systemPort : ~HouseholdPort;
                }

                part homeownerActor :> homeowner {
                    doc
                    /* Monitors system status and sends control commands. */
                    port systemPort : ~HomeownerPort;
                }

                part installerActor :> installer {
                    doc
                    /* Installs, configures, and commissions the system on-site. */
                    port systemPort : ~InstallerPort;
                }

                part maintenanceTechnicianActor :> maintenanceTechnician {
                    doc
                    /* Diagnoses faults and repairs or replaces components during operation. */
                    port systemPort : ~MaintenancePort;
                }

                // Interfaces connecting actors to the system
                interface connect sun.systemPort to solarX.sunPort;
                interface connect solarX.gridPort to publicGrid.systemPort;
                interface connect household.systemPort to solarX.householdPort;
                interface connect homeownerActor.systemPort to solarX.homeownerPort;
                interface connect installerActor.systemPort to solarX.installerPort;
                interface connect maintenanceTechnicianActor.systemPort to solarX.maintenancePort;
            }
        }

        // ── Step 6 — Use Cases ───────────────────────────────────────────────
        package SolarX_UseCases {
            private import SolarX_Context::*;
            private import SolarX_Requirements::*;
            private import SolarX_FunctionalArchitecture::SolarX_Functions::*;

            // ── UC-1 ─────────────────────────────────────────────────────────
            use case def 'supply household electricity' {
                subject theSubject = solarXContext::solarX;
                actor theSun = solarXContext::sun;
                actor theHousehold = solarXContext::household;
                actor theGrid = solarXContext::publicGrid;
                objective {
                    doc
                    /* The household receives AC electricity from the best
                     * available source — solar generation first, then battery
                     * storage, then public grid as backup — managed automatically
                     * by the system controller.
                     * Trigger: household demand active.
                     */
                    satisfy 'Convert solar irradiation to AC electricity';
                    satisfy 'Store excess electricity locally';
                    satisfy 'Supply electricity to household loads';
                    satisfy 'Draw electricity from the public grid as backup';
                }
            }

            use case <'UC-1'> supplyHouseholdElectricity : 'supply household electricity' {
                // Controller selects source: solar first, then battery, then grid.
                first start then 'assess available energy sources';
                first 'assess available energy sources' then 'select and convert energy to AC';
                first 'select and convert energy to AC' then 'route AC electricity to household';
                first 'route AC electricity to household' then 'monitor and record energy flow';
                first 'monitor and record energy flow' then done;

                flow
                    from 'select and convert energy to AC'.acElectricity
                    to 'route AC electricity to household'.acElectricity;

                action 'assess available energy sources' : AssessAvailableEnergySources {}
                action 'select and convert energy to AC' : SelectAndConvertEnergyToAC {}
                action 'route AC electricity to household' : RouteACElectricityToHousehold {}
                action 'monitor and record energy flow' : MonitorAndRecordEnergyFlow {}
            }

            // ── UC-2 ─────────────────────────────────────────────────────────
            use case def 'feed surplus solar electricity to public grid' {
                subject theSubject = solarXContext::solarX;
                actor theGrid = solarXContext::publicGrid;
                objective {
                    doc
                    /* Surplus AC electricity is exported to the public grid
                     * when local generation exceeds household demand and
                     * battery storage is full.
                     * Trigger: generation > demand + battery full.
                     */
                    satisfy 'Feed surplus electricity into the public grid';
                }
            }

            use case <'UC-2'> feedSurplusSolarElectricityToPublicGrid : 'feed surplus solar electricity to public grid' {
                first start then 'detect surplus condition';
                first 'detect surplus condition' then 'prepare AC electricity for export';
                first 'prepare AC electricity for export' then 'open grid feed-in';
                first 'open grid feed-in' then 'export surplus electricity';
                first 'export surplus electricity' then 'monitor feed-in and record';
                first 'monitor feed-in and record' then done;

                flow
                    from 'prepare AC electricity for export'.acElectricity
                    to 'export surplus electricity'.acElectricity;

                action 'detect surplus condition' : DetectSurplusCondition {}
                action 'prepare AC electricity for export' : PrepareACElectricityForExport {}
                action 'open grid feed-in' : OpenGridFeedIn {}
                action 'export surplus electricity' : ExportSurplusElectricity {}
                action 'monitor feed-in and record' : MonitorFeedInAndRecord {}
            }

            // ── UC-3 ─────────────────────────────────────────────────────────
            use case def 'monitor energy generation and consumption' {
                subject theSubject = solarXContext::solarX;
                actor theHomeowner = solarXContext::homeownerActor;
                objective {
                    doc
                    /* The homeowner views real-time and historical data on
                     * solar generation, battery state, household consumption,
                     * and grid exchange via a monitoring interface.
                     * Trigger: homeowner requests monitoring data.
                     */
                    satisfy 'Provide homeowner monitoring access';
                }
            }

            use case <'UC-3'> monitorEnergyGenerationAndConsumption : 'monitor energy generation and consumption' {
                // Continuous use case — triggered at system start, loops indefinitely.
                merge continuousLoop;
                first start then continuousLoop;
                first continuousLoop then 'collect sensor data';
                first 'collect sensor data' then 'aggregate and format data';
                first 'aggregate and format data' then 'transmit monitoring data';
                first 'transmit monitoring data' then continuousLoop;

                flow
                    from 'aggregate and format data'.monitoringData
                    to 'transmit monitoring data'.monitoringData;

                action 'collect sensor data' : CollectSensorData {}
                action 'aggregate and format data' : AggregateAndFormatData {}
                action 'transmit monitoring data' : TransmitMonitoringData {}
            }

            // ── UC-4 ─────────────────────────────────────────────────────────
            use case def 'install and commission PV system' {
                subject theSubject = solarXContext::solarX;
                actor theInstaller = solarXContext::installerActor;
                objective {
                    doc
                    /* The installer physically mounts, connects, configures,
                     * and activates the SolarX system at the household site.
                     * Trigger: new system installation request.
                     */
                    satisfy 'Support installation and commissioning';
                }
            }

            use case <'UC-4'> installAndCommissionPVSystem : 'install and commission PV system' {
                first start then 'receive installation request';
                first 'receive installation request' then 'configure system parameters';
                first 'configure system parameters' then 'run self-test';
                first 'run self-test' then 'activate system';
                first 'activate system' then 'generate commissioning report';
                first 'generate commissioning report' then 'transmit report to installer';
                first 'transmit report to installer' then done;

                flow
                    from 'receive installation request'.configurationData
                    to 'configure system parameters'.configurationData;
                flow
                    from 'generate commissioning report'.commissioningReport
                    to 'transmit report to installer'.commissioningReport;

                action 'receive installation request' : ReceiveInstallationRequest {}
                action 'configure system parameters' : ConfigureSystemParameters {}
                action 'run self-test' : RunSelfTest {}
                action 'activate system' : ActivateSystem {}
                action 'generate commissioning report' : GenerateCommissioningReport {}
                action 'transmit report to installer' : TransmitReportToInstaller {}
            }

            // ── UC-5 ─────────────────────────────────────────────────────────
            use case def 'repair system component' {
                subject theSubject = solarXContext::solarX;
                actor theTechnician = solarXContext::maintenanceTechnicianActor;
                objective {
                    doc
                    /* A maintenance technician diagnoses a fault, replaces or
                     * repairs the affected component, and restores normal system
                     * operation.
                     * Trigger: fault detected by system controller or scheduled
                     * maintenance visit.
                     */
                }
            }

            use case <'UC-5'> repairSystemComponent : 'repair system component' {
                first start then 'detect fault or receive maintenance request';
                first 'detect fault or receive maintenance request' then 'run diagnostics';
                first 'run diagnostics' then 'transmit diagnostics to technician';
                first 'transmit diagnostics to technician' then 'repair or replace component';
                first 'repair or replace component' then 'verify system recovery';
                first 'verify system recovery' then 'resume normal operation';
                first 'resume normal operation' then done;

                flow
                    from 'detect fault or receive maintenance request'.maintenanceRequest
                    to 'run diagnostics'.maintenanceRequest;
                flow
                    from 'run diagnostics'.diagnosticsData
                    to 'transmit diagnostics to technician'.diagnosticsData;

                action 'detect fault or receive maintenance request' : DetectFaultOrReceiveMaintenanceRequest {}
                action 'run diagnostics' : RunDiagnostics {}
                action 'transmit diagnostics to technician' : TransmitDiagnosticsToTechnician {}
                action 'repair or replace component' : RepairOrReplaceComponent {}
                action 'verify system recovery' : VerifySystemRecovery {}
                action 'resume normal operation' : ResumeNormalOperation {}
            }

            view useCaseView {
                expose SolarXModel::SolarXProject::SolarX_UseCases;
                attribute depth = 2;
                attribute fileName = "step6_use_cases";
                attribute fileType = "PNG";
                attribute zoomLevel = 3.0;
                render asTreeDiagram;
            }
        }

        // ── Step 7 — Functional Architecture ─────────────────────────────────
        package SolarX_FunctionalArchitecture {

            package SolarX_Functions {

            // ── UC-1 functions ────────────────────────────────────────────────
            action def AssessAvailableEnergySources {
                doc /* Determines which energy sources (PV, battery, grid) are currently available. */
            }
            action def SelectAndConvertEnergyToAC {
                doc /* Selects the best available source and converts its output to AC electricity. */
                out item acElectricity : ACElectricity;
            }
            action def RouteACElectricityToHousehold {
                doc /* Routes converted AC electricity to the household load. */
                in item acElectricity : ACElectricity;
            }
            action def MonitorAndRecordEnergyFlow {
                doc /* Monitors and records the active energy flow during household supply. */
            }

            // ── UC-2 functions ────────────────────────────────────────────────
            action def DetectSurplusCondition {
                doc /* Detects when local generation exceeds demand and battery is full. */
            }
            action def PrepareACElectricityForExport {
                doc /* Prepares the surplus AC electricity for export to the public grid. */
                out item acElectricity : ACElectricity;
            }
            action def OpenGridFeedIn {
                doc /* Opens the grid feed-in connection to allow surplus export. */
            }
            action def ExportSurplusElectricity {
                doc /* Exports surplus AC electricity to the public grid. */
                in item acElectricity : ACElectricity;
            }
            action def MonitorFeedInAndRecord {
                doc /* Monitors the feed-in session and records export data. */
            }

            // ── UC-3 functions ────────────────────────────────────────────────
            action def CollectSensorData {
                doc /* Continuously reads sensor data from all subsystems. */
            }
            action def AggregateAndFormatData {
                doc /* Aggregates generation, storage and consumption metrics into a report. */
                out item monitoringData;
            }
            action def TransmitMonitoringData {
                doc /* Transmits the formatted monitoring report to the homeowner interface. */
                in item monitoringData;
            }

            // ── UC-4 functions ────────────────────────────────────────────────
            action def ReceiveInstallationRequest {
                doc /* Receives and parses the installer's installation request and configuration data. */
                out item configurationData;
            }
            action def ConfigureSystemParameters {
                doc /* Applies configuration data to system parameters. */
                in item configurationData;
            }
            action def RunSelfTest {
                doc /* Executes a self-test sequence to verify system integrity before activation. */
            }
            action def ActivateSystem {
                doc /* Activates the system and begins normal energy management operation. */
            }
            action def GenerateCommissioningReport {
                doc /* Generates a commissioning report summarising installation results. */
                out item commissioningReport;
            }
            action def TransmitReportToInstaller {
                doc /* Transmits the commissioning report to the installer interface. */
                in item commissioningReport;
            }

            // ── UC-5 functions ────────────────────────────────────────────────
            action def DetectFaultOrReceiveMaintenanceRequest {
                doc /* Detects a system fault or receives an incoming maintenance request. */
                out item maintenanceRequest;
            }
            action def RunDiagnostics {
                doc /* Runs diagnostic routines to identify the fault and its location. */
                in item maintenanceRequest;
                out item diagnosticsData;
            }
            action def TransmitDiagnosticsToTechnician {
                doc /* Transmits diagnostics data to the maintenance technician interface. */
                in item diagnosticsData;
            }
            action def RepairOrReplaceComponent {
                doc /* Coordinates repair or replacement of the affected component. */
            }
            action def VerifySystemRecovery {
                doc /* Verifies that the system has recovered and operates correctly after repair. */
            }
            action def ResumeNormalOperation {
                doc /* Resumes normal energy management operation after maintenance. */
            }

            } // end package SolarX_Functions

            view functionalArchitectureView {
                expose SolarXModel::SolarXProject::SolarX_FunctionalArchitecture::SolarX_Functions;
                attribute depth = 2;
                attribute fileName = "step7_functional_architecture";
                attribute fileType = "PNG";
                attribute zoomLevel = 3.0;
                render asTreeDiagram;
            }
        }

        // ── Step 8 — Logical Architecture ────────────────────────────────────
        package SolarX_LogicalArchitecture {
            private import SolarX_PortDefinitions::*;
            private import SolarX_FunctionalArchitecture::SolarX_Functions::*;
            private import SysML::*;

            part def PVCollectionSubsystem {
                doc
                /* Captures solar irradiation via PV panels and outputs DC electricity.
                 * No explicit perform action: PV collection is a continuous passive
                 * energy conversion (solar irradiation → DC electricity) that happens
                 * without a discrete trigger. It is a physical prerequisite that enables
                 * AssessAvailableEnergySources and SelectAndConvertEnergyToAC but is not
                 * itself a named action step in the UC flows — it runs as long as sunlight
                 * is available.
                 */
                port sunPort : SunPort;
                port dcOutPort : DCPort;              // DC out → PowerConversion
            }

            part def PowerConversionSubsystem {
                doc
                /* Converts DC power from PV collection into AC electricity
                 * for household supply and grid export.
                 * UC-1: select and convert energy to AC.
                 * UC-2: prepare AC electricity for export.
                 */
                port dcInPort : ~DCPort;              // DC in ← PVCollection
                port acOutPort : ACPort;              // AC out → EnergyManagement
                port controlInPort : ~ControlPort;    // control in ← EnergyManagement

                perform action selectAndConvertEnergyToAC : SelectAndConvertEnergyToAC;
                perform action prepareACElectricityForExport : PrepareACElectricityForExport;
            }

            part def EnergyStorageSubsystem {
                doc
                /* Stores excess AC electricity in battery and discharges
                 * when local generation is insufficient to meet demand.
                 * No explicit perform action: charging and discharging are commanded
                 * by EnergyManagementSubsystem — storage reacts to control signals
                 * rather than autonomously executing a named action step. Its function
                 * is to hold state (stored energy level) that AssessAvailableEnergySources
                 * reads; the decision of when to charge or discharge belongs to
                 * EnergyManagementSubsystem, not to storage itself.
                 */
                port acInPort : ~ACPort;              // AC in ← EnergyManagement (charge)
                port acOutPort : ACPort;              // AC out → EnergyManagement (discharge)
                port controlInPort : ~ControlPort;    // control in ← EnergyManagement
            }

            part def EnergyManagementSubsystem {
                doc
                /* Controls energy routing decisions using solar → battery → grid
                 * priority logic. Integrates monitoring data to determine routing.
                 * UC-1: route AC electricity to household, monitor and record energy flow.
                 * UC-2: detect surplus condition, open grid feed-in.
                 */
                port acInPort : ~ACPort;              // AC in ← PowerConversion
                port householdOutPort : HouseholdPort; // AC out → household boundary
                port acToGridPort : ACPort;           // AC out → GridInterface (feed-in)
                port acFromGridPort : ~ACPort;        // AC in ← GridInterface (draw)
                port acToStoragePort : ACPort;        // AC out → EnergyStorage (charge)
                port acFromStoragePort : ~ACPort;     // AC in ← EnergyStorage (discharge)
                port monitoringOutPort : MonitoringDataPort; // data out → MonitoringSubsystem
                port controlToConversionPort : ControlPort; // control out → PowerConversion
                port controlToStoragePort : ControlPort;    // control out → EnergyStorage
                port controlToGridPort : ControlPort;       // control out → GridInterface

                perform action assessAvailableEnergySources : AssessAvailableEnergySources;
                perform action routeACElectricityToHousehold : RouteACElectricityToHousehold;
                perform action monitorAndRecordEnergyFlow : MonitorAndRecordEnergyFlow;
                perform action detectSurplusCondition : DetectSurplusCondition;
                perform action openGridFeedIn : OpenGridFeedIn;
            }

            part def GridInterfaceSubsystem {
                doc
                /* Manages the bidirectional grid connection:
                 * surplus feed-in to grid and backup draw from grid.
                 * UC-2: export surplus electricity, monitor feed-in and record.
                 * UC-1: draw from grid as backup (implicit via bidirectional port).
                 */
                port acFromMgmtPort : ~ACPort;        // AC in ← EnergyManagement (feed-in path)
                port acToMgmtPort : ACPort;           // AC out → EnergyManagement (draw path)
                port gridPort : GridPort;              // bidirectional grid connection
                port controlInPort : ~ControlPort;    // control in ← EnergyManagement

                perform action exportSurplusElectricity : ExportSurplusElectricity;
                perform action monitorFeedInAndRecord : MonitorFeedInAndRecord;
            }

            part def MonitoringSubsystem {
                doc
                /* Continuously collects sensor data from all subsystems,
                 * aggregates and transmits monitoring reports to the homeowner.
                 * UC-3: collect sensor data, aggregate and format data,
                 *        transmit monitoring data.
                 */
                port monitoringInPort : ~MonitoringDataPort; // data in ← EnergyManagement
                port homeownerPort : HomeownerPort;          // data out → homeowner boundary

                perform action collectSensorData : CollectSensorData;
                perform action aggregateAndFormatData : AggregateAndFormatData;
                perform action transmitMonitoringData : TransmitMonitoringData;
            }

            part def CommissioningSubsystem {
                doc
                /* Handles system installation, parameter configuration,
                 * self-test and activation by the installer.
                 * UC-4: configure system parameters, run self-test, activate system,
                 *        generate and transmit commissioning report.
                 */
                port installerPort : InstallerPort;

                perform action receiveInstallationRequest : ReceiveInstallationRequest;
                perform action configureSystemParameters : ConfigureSystemParameters;
                perform action runSelfTest : RunSelfTest;
                perform action activateSystem : ActivateSystem;
                perform action generateCommissioningReport : GenerateCommissioningReport;
                perform action transmitReportToInstaller : TransmitReportToInstaller;
            }

            part def MaintenanceSubsystem {
                doc
                /* Handles fault detection, diagnostics generation and
                 * repair coordination with the maintenance technician.
                 * UC-5: run diagnostics, transmit diagnostics to technician,
                 *        verify system recovery.
                 */
                port maintenancePort : MaintenancePort;

                perform action detectFaultOrReceiveMaintenanceRequest : DetectFaultOrReceiveMaintenanceRequest;
                perform action runDiagnostics : RunDiagnostics;
                perform action transmitDiagnosticsToTechnician : TransmitDiagnosticsToTechnician;
                perform action repairOrReplaceComponent : RepairOrReplaceComponent;
                perform action verifySystemRecovery : VerifySystemRecovery;
                perform action resumeNormalOperation : ResumeNormalOperation;
            }

            // ── Top-level logical decomposition ──────────────────────────────
            part def SolarX_Logical {
                doc
                /* Logical decomposition of SolarX into functional subsystems.
                 * Ports mirror the system context boundary.
                 */
                port sunPort : SunPort;
                port gridPort : GridPort;
                port householdPort : HouseholdPort;
                port homeownerPort : HomeownerPort;
                port installerPort : InstallerPort;
                port maintenancePort : MaintenancePort;

                part pvCollection : PVCollectionSubsystem;
                part powerConversion : PowerConversionSubsystem;
                part energyStorage : EnergyStorageSubsystem;
                part energyManagement : EnergyManagementSubsystem;
                part gridInterface : GridInterfaceSubsystem;
                part monitoring : MonitoringSubsystem;
                part commissioning : CommissioningSubsystem;
                part maintenance : MaintenanceSubsystem;

                // ── Path 5: control commands ─────────────────────────────────
                interface connect energyManagement.controlToConversionPort to powerConversion.controlInPort;
                interface connect energyManagement.controlToStoragePort to energyStorage.controlInPort;
                interface connect energyManagement.controlToGridPort to gridInterface.controlInPort;

                // ── Path 4: commissioning and maintenance boundaries ─────────
                bind installerPort = commissioning.installerPort;
                bind maintenancePort = maintenance.maintenancePort;

                // ── Path 3: monitoring data flow ─────────────────────────────
                interface connect energyManagement.monitoringOutPort to monitoring.monitoringInPort;
                bind homeownerPort = monitoring.homeownerPort;

                // ── Path 2: energy storage loop ──────────────────────────────
                interface connect energyManagement.acToStoragePort to energyStorage.acInPort;
                interface connect energyStorage.acOutPort to energyManagement.acFromStoragePort;

                // ── Path 1: main energy path ──────────────────────────────────
                // Internal connections
                interface connect pvCollection.dcOutPort to powerConversion.dcInPort;
                interface connect powerConversion.acOutPort to energyManagement.acInPort;
                interface connect energyManagement.acToGridPort to gridInterface.acFromMgmtPort;
                interface connect gridInterface.acToMgmtPort to energyManagement.acFromGridPort;

                // Boundary bindings
                bind sunPort = pvCollection.sunPort;
                bind householdPort = energyManagement.householdOutPort;
                bind gridPort = gridInterface.gridPort;
            }

            view def StructureBreakDown {
                filter hastype PartUsage | hastype PartDefinition;
            }

            view logicalArchitectureView : StructureBreakDown {
                expose SolarXModel::SolarXProject::SolarX_LogicalArchitecture::SolarX_Logical::**;
                attribute depth = 2;
                attribute fileName = "step8_logical_architecture";
                attribute fileType = "PNG";
                attribute zoomLevel = 3.0;
                render Views::asTreeDiagram;
            }

            view logicalInterconnectionView : StructureBreakDown {
                expose SolarXModel::SolarXProject::SolarX_LogicalArchitecture::SolarX_Logical::**;
                attribute depth = 2;
                attribute fileName = "step8_logical_interconnection";
                attribute fileType = "PNG";
                attribute zoomLevel = 3.0;
                render Views::asInterconnectionDiagram;
            }
        }

        // ── Step 8b — Logical Behavior ───────────────────────────────────────
        package SolarX_LogicalBehavior {

            package SolarXStates {

                // ── Top-level state triggers ──────────────────────────────────
                item def InstallerInitiatesCommissioning;
                item def CommissioningComplete;
                item def FaultDetected;
                item def MaintenanceStarted;
                item def RepairComplete;
                item def SystemShutdown;

                // ── Operational sub-state triggers ────────────────────────────
                item def IrradiationAvailable;
                item def IrradiationUnavailable;
                item def ChargingRequired;
                item def StorageFull;
                item def DischargingRequired;
                item def StorageEmpty;
                item def SurplusAvailable;
                item def NoSurplus;
                item def GridDrawRequired;
                item def GridDrawSatisfied;

                state solarXStates {

                    first start then off;

                    state off;

                    state commissioning {
                        entry action 'initialize installer interface';
                        do action 'configure and activate system';
                        exit action 'hand over to homeowner';
                    }

                    state operational
                    parallel {
                        // Generation: tracks whether PV panels are actively producing
                        state generationModes {
                            entry; then standby;
                            state standby { do action 'await solar irradiation'; }
                            transition standby accept IrradiationAvailable then generating;
                            state generating { do action 'convert solar irradiation to DC'; }
                            transition generating accept IrradiationUnavailable then standby;
                        }
                        // Storage: tracks battery charge/discharge activity
                        state storageModes {
                            entry; then idle;
                            state idle;
                            transition idle accept ChargingRequired then charging;
                            transition idle accept DischargingRequired then discharging;
                            state charging { do action 'charge battery from AC bus'; }
                            transition charging accept StorageFull then idle;
                            state discharging { do action 'discharge battery to AC bus'; }
                            transition discharging accept StorageEmpty then idle;
                        }
                        // Grid: tracks whether SolarX is feeding to or drawing from grid
                        state gridModes {
                            entry; then disconnected;
                            state disconnected;
                            transition disconnected accept SurplusAvailable then feedingIn;
                            transition disconnected accept GridDrawRequired then drawingFromGrid;
                            state feedingIn { do action 'feed surplus AC to public grid'; }
                            transition feedingIn accept NoSurplus then disconnected;
                            state drawingFromGrid { do action 'draw AC from public grid'; }
                            transition drawingFromGrid accept GridDrawSatisfied then disconnected;
                        }
                    }

                    state fault {
                        entry action 'log fault and suspend energy routing';
                        do action 'notify homeowner of fault';
                    }

                    state maintenance {
                        entry action 'suspend normal operation';
                        do action 'run diagnostics';
                        exit action 'verify system recovery';
                    }

                    transition off accept InstallerInitiatesCommissioning then commissioning;
                    transition commissioning accept CommissioningComplete then operational;
                    transition operational accept FaultDetected then fault;
                    transition fault accept MaintenanceStarted then maintenance;
                    transition maintenance accept RepairComplete then operational;
                    transition operational accept SystemShutdown then off;
                }
            }
        }

        // ── Step 9 — Physical Architecture ───────────────────────────────────
        package SolarX_PhysicalArchitecture {
            private import SolarX_PortDefinitions::*;
            private import SolarX_LogicalArchitecture::*;
            private import SysML::*;

            // ── Physical component definitions ────────────────────────────────

            part def PVArray :> PVCollectionSubsystem {
                doc /* PV panel array — captures solar irradiation and outputs DC. */
                attribute peakPower : ScalarValues::Real;        // kWp
                attribute cellEfficiency : ScalarValues::Real;   // %
                attribute panelCount : ScalarValues::Integer;
                attribute dcOutputVoltage : ScalarValues::Real;  // V
            }

            part def SolarInverter :> PowerConversionSubsystem {
                doc /* Grid-tied inverter — converts DC from PV array to AC. */
                attribute ratedPower : ScalarValues::Real;        // kW
                attribute euroEfficiency : ScalarValues::Real;    // %
                attribute acOutputVoltage : ScalarValues::Real;   // V
                attribute acOutputFrequency : ScalarValues::Real; // Hz
                attribute mpptInputCount : ScalarValues::Integer;
            }

            part def BatteryStorage :> EnergyStorageSubsystem {
                doc /* Battery pack — stores and releases AC electricity. */
                attribute capacity : ScalarValues::Real;          // kWh
                attribute nominalVoltage : ScalarValues::Real;    // V
                attribute maxChargeRate : ScalarValues::Real;     // C
                attribute maxDischargeRate : ScalarValues::Real;  // C
                attribute depthOfDischarge : ScalarValues::Real;  // %
                attribute chemistry : ScalarValues::String;       // e.g. LFP, Li-ion
            }

            part def EnergyManagementController :> EnergyManagementSubsystem {
                doc /* Embedded controller — executes routing and priority logic. */
                attribute processorSpeed : ScalarValues::Real;    // MHz
                attribute ioCount : ScalarValues::Integer;
                attribute communicationProtocols : ScalarValues::String;
            }

            part def GridConnection :> GridInterfaceSubsystem {
                doc /* Grid interface unit — manages feed-in and draw with protection. */
                attribute gridVoltage : ScalarValues::Real;       // V
                attribute gridFrequency : ScalarValues::Real;     // Hz
                attribute gridStandard : ScalarValues::String;    // e.g. EN50549
                attribute maxFeedInPower : ScalarValues::Real;    // kW
            }

            part def MonitoringUnit :> MonitoringSubsystem {
                doc /* Monitoring module — collects, aggregates and reports energy data. */
                attribute samplingRate : ScalarValues::Real;      // Hz
                attribute dataRetentionPeriod : ScalarValues::Real; // days
                attribute communicationProtocols : ScalarValues::String;
            }

            part def CommissioningInterface :> CommissioningSubsystem {
                doc /* Commissioning interface — installer configuration and activation tool. */
                attribute interfaceType : ScalarValues::String;   // e.g. RS485, Ethernet
                attribute supportedProtocols : ScalarValues::String;
            }

            part def MaintenanceDiagnosticsUnit :> MaintenanceSubsystem {
                doc /* Diagnostics unit — fault detection and maintenance coordination. */
                attribute diagnosticsProtocol : ScalarValues::String;
                attribute faultLogCapacity : ScalarValues::Integer; // entries
            }

            // ── Top-level physical system ─────────────────────────────────────
            part def SolarX :> SolarX_Logical {
                doc
                /* Physical SolarX system — composes all physical components.
                 * Specializes SolarX_Logical: inherits all ports, connections
                 * and bindings. Each part redefines its logical counterpart.
                 */
                part pvArray : PVArray :>> pvCollection;
                part solarInverter : SolarInverter :>> powerConversion;
                part batteryStorage : BatteryStorage :>> energyStorage;
                part energyMgmtController : EnergyManagementController :>> energyManagement;
                part gridConnection : GridConnection :>> gridInterface;
                part monitoringUnit : MonitoringUnit :>> monitoring;
                part commissioningInterface : CommissioningInterface :>> commissioning;
                part maintenanceDiagnosticsUnit : MaintenanceDiagnosticsUnit :>> maintenance;
            }

            view def StructureBreakDown {
                filter hastype PartUsage | hastype PartDefinition;
            }

            view solarXBreakdown : StructureBreakDown {
                expose SolarXModel::SolarXProject::SolarX_PhysicalArchitecture::SolarX::**;
                attribute depth = 3;
                attribute fileName = "step9_physical_breakdown";
                attribute fileType = "PNG";
                attribute zoomLevel = 3.0;
                render Views::asTreeDiagram;
            }

            view solarXInterconnection : StructureBreakDown {
                expose SolarXModel::SolarXProject::SolarX_PhysicalArchitecture::SolarX::**;
                attribute depth = 2;
                attribute fileName = "step9_physical_interconnection";
                attribute fileType = "PNG";
                attribute zoomLevel = 3.0;
                render Views::asInterconnectionDiagram;
            }
        }

        
    }
}



// ── Methodology Library (reusable, not SolarX-specific) ──────────────────────
package SYSMODLibrary {
    enum def LevelKind :> ScalarValues::Integer {
        enum high = 3;
        enum medium = 2;
        enum low = 1;
    }
    part def Stakeholder {
        attribute priority = risk * motivation;
        attribute risk : LevelKind [0..1];
        attribute motivation : LevelKind [0..1];
    }
}
