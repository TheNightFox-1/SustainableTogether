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
                out item electricity : ACElectricity;
                // draw direction (grid → SolarX): use ~GridPort
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
                    port gridFeedInPort : GridPort; // SolarX → grid (surplus feed-in)
                    port gridDrawPort : ~GridPort; // grid → SolarX (backup draw)
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
                    port feedInSystemPort : ~GridPort; // receives surplus from SolarX
                    port drawSystemPort : GridPort; // provides backup to SolarX
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
                interface connect solarX.gridFeedInPort to publicGrid.feedInSystemPort;
                interface connect publicGrid.drawSystemPort to solarX.gridDrawPort;
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

            use case <'UC-1'> 'supply household electricity' {
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

            use case <'UC-2'> 'feed surplus solar electricity to public grid' {
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

            use case <'UC-3'> 'monitor energy generation and consumption' {
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

            use case <'UC-4'> 'install and commission PV system' {
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

            use case <'UC-5'> 'repair system component' {
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
        }

        // ── Step 6b — Use Case Action Flows ─────────────────────────────────
        package SolarX_ActionFlows {
            action def 'supply household electricity flow' {
                // Controller selects source: solar first, then battery, then grid.
                // Decision logic is described in UC-1 objective; modeled here as sequential steps.
                first start then 'assess available energy sources';
                first 'assess available energy sources' then 'select and convert energy to AC';
                first 'select and convert energy to AC' then 'route AC electricity to household';
                first 'route AC electricity to household' then 'monitor and record energy flow';
                first 'monitor and record energy flow' then done;

                flow
                    from 'select and convert energy to AC'.acPower
                    to 'route AC electricity to household'.acPower;

                action 'assess available energy sources' {}
                action 'select and convert energy to AC' { out item acPower; }
                action 'route AC electricity to household' { in item acPower; }
                action 'monitor and record energy flow' {}
            }

            action def 'feed surplus solar electricity to public grid flow' {
                first start then 'detect surplus condition';
                first 'detect surplus condition' then 'prepare AC electricity for export';
                first 'prepare AC electricity for export' then 'open grid feed-in';
                first 'open grid feed-in' then 'export surplus electricity';
                first 'export surplus electricity' then 'monitor feed-in and record';
                first 'monitor feed-in and record' then done;

                flow
                    from 'prepare AC electricity for export'.acPower
                    to 'export surplus electricity'.acPower;

                action 'detect surplus condition' {}
                action 'prepare AC electricity for export' { out item acPower; }
                action 'open grid feed-in' {}
                action 'export surplus electricity' { in item acPower; }
                action 'monitor feed-in and record' {}
            }

            action def 'monitor energy generation and consumption flow' {
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

                action 'collect sensor data' {}
                action 'aggregate and format data' { out item monitoringData; }
                action 'transmit monitoring data' { in item monitoringData; }
            }

            action def 'install and commission PV system flow' {
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

                action 'receive installation request' { out item configurationData; }
                action 'configure system parameters' { in item configurationData; }
                action 'run self-test' {}
                action 'activate system' {}
                action 'generate commissioning report' { out item commissioningReport; }
                action 'transmit report to installer' { in item commissioningReport; }
            }

            action def 'repair system component flow' {
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

                action 'detect fault or receive maintenance request' {
                    out item maintenanceRequest;
                }
                action 'run diagnostics' {
                    in item maintenanceRequest;
                    out item diagnosticsData;
                }
                action 'transmit diagnostics to technician' { in item diagnosticsData; }
                action 'repair or replace component' {}
                action 'verify system recovery' {}
                action 'resume normal operation' {}
            }

            view functionalTreeView {
                expose SolarXModel::SolarXProject::SolarX_ActionFlows;
                attribute depth = 2;
                attribute fileName = "functional_tree";
                attribute fileType = "PNG";
                attribute zoomLevel = 3.0;
                render asTreeDiagram;
            }
        }

        // ── Step 7 — Functional Architecture ─────────────────────────────────
        package SolarX_FunctionalArchitecture {

            // Individual function definitions
            action def CollectSolarEnergy {
                doc
                /* Captures solar irradiation via the PV array
                 * and outputs DC electricity.
                 */
            }

            action def ConvertToAC {
                doc
                /* Converts DC power from PV collection into AC electricity
                 * for household supply and grid export.
                 */
            }

            action def StoreEnergy {
                doc
                /* Stores excess electricity in the battery and discharges
                 * when local generation is insufficient to meet demand.
                 */
            }

            action def RouteElectricity {
                doc
                /* Routes AC electricity to the household, battery, or grid
                 * based on energy management control decisions.
                 */
            }

            action def ControlEnergyFlow {
                doc
                /* Applies solar → battery → grid priority logic to determine
                 * the routing of available electricity at any given moment.
                 */
            }

            action def MonitorEnergyFlow {
                doc
                /* Continuously reads sensor data from all subsystems and
                 * aggregates generation, storage and consumption metrics.
                 */
            }

            action def InterfaceWithGrid {
                doc
                /* Manages the bidirectional grid connection:
                 * surplus feed-in to the public grid and backup draw from it.
                 */
            }

            action def CommissionSystem {
                doc
                /* Handles installer-driven configuration, self-test and
                 * system activation at installation time.
                 */
            }

            action def DiagnoseAndRepair {
                doc
                /* Detects faults, generates diagnostics and coordinates
                 * component repair with the maintenance technician.
                 */
            }

            // ── Functional tree — top-level composition ───────────────────────
            action def SolarX_Functions {
                doc /* Functional decomposition of SolarX — all system functions. */

                action collectSolarEnergy : CollectSolarEnergy;
                action convertToAC : ConvertToAC;
                action storeEnergy : StoreEnergy;
                action routeElectricity : RouteElectricity;
                action controlEnergyFlow : ControlEnergyFlow;
                action monitorEnergyFlow : MonitorEnergyFlow;
                action interfaceWithGrid : InterfaceWithGrid;
                action commissionSystem : CommissionSystem;
                action diagnoseAndRepair : DiagnoseAndRepair;
            }

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

            part def PVCollectionSubsystem {
                doc
                /* Captures solar irradiation via PV panels and outputs DC electricity.
                 * UC-1: assess available energy sources, select and convert energy to AC.
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
            }

            part def EnergyStorageSubsystem {
                doc
                /* Stores excess AC electricity in battery and discharges
                 * when local generation is insufficient to meet demand.
                 * UC-1: assess available energy sources.
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
            }

            part def GridInterfaceSubsystem {
                doc
                /* Manages the bidirectional grid connection:
                 * surplus feed-in to grid and backup draw from grid.
                 * UC-2: export surplus electricity.
                 * UC-1: draw from grid as backup.
                 */
                port acFromMgmtPort : ~ACPort;        // AC in ← EnergyManagement (feed-in path)
                port acToMgmtPort : ACPort;           // AC out → EnergyManagement (draw path)
                port gridFeedInPort : GridPort;        // AC out → public grid
                port gridDrawPort : ~GridPort;         // AC in ← public grid
                port controlInPort : ~ControlPort;    // control in ← EnergyManagement
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
            }

            part def CommissioningSubsystem {
                doc
                /* Handles system installation, parameter configuration,
                 * self-test and activation by the installer.
                 * UC-4: configure system parameters, run self-test, activate system,
                 *        generate and transmit commissioning report.
                 */
                port installerPort : InstallerPort;
            }

            part def MaintenanceSubsystem {
                doc
                /* Handles fault detection, diagnostics generation and
                 * repair coordination with the maintenance technician.
                 * UC-5: run diagnostics, transmit diagnostics to technician,
                 *        verify system recovery.
                 */
                port maintenancePort : MaintenancePort;
            }

            // ── Top-level logical decomposition ──────────────────────────────
            part def SolarX_Logical {
                doc
                /* Logical decomposition of SolarX into functional subsystems.
                 * Ports mirror the system context boundary.
                 */
                port sunPort : SunPort;
                port gridFeedInPort : GridPort;
                port gridDrawPort : ~GridPort;
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
                bind gridFeedInPort = gridInterface.gridFeedInPort;
                bind gridDrawPort = gridInterface.gridDrawPort;
            }

            view logicalArchitectureView {
                expose SolarXModel::SolarXProject::SolarX_LogicalArchitecture::SolarX_Logical;
                attribute depth = 2;
                attribute fileName = "step8_logical_architecture";
                attribute fileType = "PNG";
                attribute zoomLevel = 3.0;
                render asTreeDiagram;
            }

            view logicalInterconnectionView {
                expose SolarXModel::SolarXProject::SolarX_LogicalArchitecture::SolarX_Logical;
                attribute depth = 2;
                attribute fileName = "step8_logical_interconnection";
                attribute fileType = "PNG";
                attribute zoomLevel = 3.0;
                render asInterconnectionDiagram;
            }
        }

        // ── Step 8b — Logical Behavior ───────────────────────────────────────
       package SolarX_LogicalBehavior {

            // ── Lifecycle Stages ──────────────────────────────────────────────
            package SolarX_LifecycleStages {

                // Trigger event definitions
                item def InstallerInitiatesCommissioning;
                item def CommissioningComplete;
                item def FaultDetected;
                item def MaintenanceStarted;
                item def RepairComplete;
                item def SystemShutdown;

                // Operational mode trigger signals (attribute def — used with bare accept syntax)
                attribute def IrradiationAvailable;
                attribute def IrradiationUnavailable;
                attribute def ChargingRequired;
                attribute def StorageFull;
                attribute def DischargingRequired;
                attribute def StorageEmpty;
                attribute def SurplusAvailable;
                attribute def NoSurplus;
                attribute def GridDrawRequired;
                attribute def GridDrawSatisfied;

                state solarXLifecycleStages {

                    first start then off;

                    state off;
                    state commissioning {
                        entry action 'initialize installer interface';
                        do action 'configure and activate system';
                        exit action 'hand over to homeowner';
                    }

                    state operational {
                        doc /* Three concurrent sub-machines are active in this state:
                             * generationModes, storageModes, gridModes — defined below.
                             */
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

                    entry; then off;
                    transition off accept InstallerInitiatesCommissioning then commissioning;
                    transition commissioning accept CommissioningComplete then operational;
                    transition operational accept FaultDetected then fault;
                    transition fault accept MaintenanceStarted then maintenance;
                    transition maintenance accept RepairComplete then operational;
                    transition operational accept SystemShutdown then off;
                }

                // ── Operational sub-machines (concurrent during 'operational') ───

                // Generation: tracks whether PV panels are actively producing power
                state generationModes {
                    doc /* Active while solarXLifecycleStages is in 'operational'. */
                    entry; then standby;
                    state standby { do action 'await solar irradiation'; }
                    accept IrradiationAvailable then generating;
                    state generating { do action 'convert solar irradiation to DC'; }
                    accept IrradiationUnavailable then standby;
                }

                // Storage: tracks battery charge/discharge activity
                state storageModes {
                    doc /* Active while solarXLifecycleStages is in 'operational'. */
                    entry; then idle;
                    state idle;
                    accept ChargingRequired then charging;
                    accept DischargingRequired then discharging;
                    state charging { do action 'charge battery from AC bus'; }
                    accept StorageFull then idle;
                    state discharging { do action 'discharge battery to AC bus'; }
                    accept StorageEmpty then idle;
                }

                // Grid: tracks whether SolarX is feeding to or drawing from the grid
                state gridModes {
                    doc /* Active while solarXLifecycleStages is in 'operational'. */
                    entry; then disconnected;
                    state disconnected;
                    accept SurplusAvailable then feedingIn;
                    accept GridDrawRequired then drawingFromGrid;
                    state feedingIn { do action 'feed surplus AC to public grid'; }
                    accept NoSurplus then disconnected;
                    state drawingFromGrid { do action 'draw AC from public grid'; }
                    accept GridDrawSatisfied then disconnected;
                }
            }
        }

        // ── Step 9 — Physical Architecture ───────────────────────────────────
        package SolarX_PhysicalArchitecture {
            private import SolarX_PortDefinitions::*;
            private import SolarX_LogicalArchitecture::*;

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

            view physicalArchitectureView {
                expose SolarXModel::SolarXProject::SolarX_PhysicalArchitecture::SolarX;
                attribute depth = 2;
                attribute fileName = "step9_physical_architecture";
                attribute fileType = "PNG";
                attribute zoomLevel = 3.0;
                render asTreeDiagram;
            }

            view physicalInterconnectionView {
                expose SolarXModel::SolarXProject::SolarX_PhysicalArchitecture::SolarX;
                attribute depth = 2;
                attribute fileName = "step9_physical_interconnection";
                attribute fileType = "PNG";
                attribute zoomLevel = 3.0;
                render asInterconnectionDiagram;
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
        enum undefined = 0;
    }
    part def Stakeholder {
        attribute priority = risk * motivation;
        attribute risk : LevelKind;
        attribute motivation : LevelKind;
    }
}
