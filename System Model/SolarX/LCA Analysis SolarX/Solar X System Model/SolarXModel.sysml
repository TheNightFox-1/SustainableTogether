package SolarXModel {
    occurrence def SolarXProject {
        private import SYSMODLibrary::*;

        // ── Port Definitions ─────────────────────────────────────────────────
        package SolarX_PortDefinitions {
            port def SunPort; // solar irradiation in
            port def GridPort; // AC electricity — bidirectional (feed-in and draw)
            port def HouseholdPort; // AC electricity out to building loads
            port def HomeownerPort; // control commands in / monitoring data out
            port def InstallerPort; // configuration and commissioning interface
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
                    port gridPort : GridPort;
                    port householdPort : HouseholdPort;
                    port homeownerPort : HomeownerPort;
                    port installerPort : InstallerPort;
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
                    port systemPort : ~GridPort;
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

                // Interfaces connecting actors to the system
                interface connect sun.systemPort to solarX.sunPort;
                interface connect publicGrid.systemPort to solarX.gridPort;
                interface connect household.systemPort to solarX.householdPort;
                interface connect homeownerActor.systemPort to solarX.homeownerPort;
                interface connect installerActor.systemPort to solarX.installerPort;
            }
        }

        // ── Step 6 — Use Cases ───────────────────────────────────────────────
        package SolarX_UseCases {
            private import SolarX_Context::*;
            private import SolarX_Requirements::*;

            use case <'UC-1'> 'supply household electricity from solar generation' {
                subject theSubject = solarXContext::solarX;
                actor theSun = solarXContext::sun;
                actor theHousehold = solarXContext::household;
                objective {
                    doc
                    /* The household receives AC electricity directly converted
                     * from solar irradiation by the PV array and inverter.
                     * Trigger: solar irradiation available, household demand active.
                     */
                    satisfy 'Convert solar irradiation to AC electricity';
                    satisfy 'Supply electricity to household loads';
                }
            }

            use case <'UC-2'> 'supply household electricity from battery storage' {
                subject theSubject = solarXContext::solarX;
                actor theHousehold = solarXContext::household;
                objective {
                    doc
                    /* The household receives AC electricity discharged from
                     * the local battery when solar generation is insufficient.
                     * Trigger: solar generation below demand, battery charged.
                     */
                    satisfy 'Store excess electricity locally';
                    satisfy 'Supply electricity to household loads';
                }
            }

            use case <'UC-3'> 'draw backup electricity from public grid' {
                subject theSubject = solarXContext::solarX;
                actor theHousehold = solarXContext::household;
                actor theGrid = solarXContext::publicGrid;
                objective {
                    doc
                    /* The household receives AC electricity drawn from the
                     * public grid when both solar generation and battery
                     * are insufficient to meet demand.
                     * Trigger: solar and battery both below demand threshold.
                     */
                    satisfy 'Draw electricity from the public grid as backup';
                }
            }

            use case <'UC-4'> 'feed surplus solar electricity to public grid' {
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

            use case <'UC-5'> 'monitor energy generation and consumption' {
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

            use case <'UC-6'> 'install and commission PV system' {
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
        }

        // ── Step 6b — Use Case Action Flows ─────────────────────────────────
        package SolarX_ActionFlows {
            action def 'supply household electricity from solar generation flow' {
                first start then 'receive solar irradiation';
                first 'receive solar irradiation' then 'convert irradiation to DC electricity';
                first 'convert irradiation to DC electricity' then 'convert DC to AC electricity';
                first 'convert DC to AC electricity' then 'route AC electricity to household';
                first 'route AC electricity to household' then 'monitor and record energy flow';
                first 'monitor and record energy flow' then done;

                flow
                    from 'receive solar irradiation'.irradiation
                    to 'convert irradiation to DC electricity'.irradiation;
                flow
                    from 'convert irradiation to DC electricity'.dcPower
                    to 'convert DC to AC electricity'.dcPower;
                flow
                    from 'convert DC to AC electricity'.acPower
                    to 'route AC electricity to household'.acPower;

                action 'receive solar irradiation' {
                    out item irradiation;
                }
                action 'convert irradiation to DC electricity' {
                    in item irradiation;
                    out item dcPower;
                }
                action 'convert DC to AC electricity' {
                    in item dcPower;
                    out item acPower;
                }
                action 'route AC electricity to household' {
                    in item acPower;
                }
                action 'monitor and record energy flow' {}
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
