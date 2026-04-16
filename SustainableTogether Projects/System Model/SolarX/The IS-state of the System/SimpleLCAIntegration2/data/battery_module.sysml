package SolarXBatteryModel {
    private import SI::*;
    private import ScalarValues::*;

    // ─────────────────────────────────────────────────────────────
    //  SolarX home energy system — top-level container
    //  Corresponds to: ex:solarXSystem in battery.ttl
    // ─────────────────────────────────────────────────────────────
    part def SolarXHomeEnergySystem {
        doc /* Residential photovoltaic and battery storage system.
               Geography: DE */

        part batteryModule : NMCBatteryModule;
    }

    // ─────────────────────────────────────────────────────────────
    //  NMC Battery Module
    //  Corresponds to: ex:batteryModule in battery.ttl
    //
    //  LCA link (ELCD):
    //    Material flow : "Lithium, ion"
    //    Amount        : mass (4.2 kg)
    //    Geography     : DE
    // ─────────────────────────────────────────────────────────────
    part def NMCBatteryModule {
        doc /* 48 V / 15 Ah NMC battery module.
               Cells + module housing, without BMS board.
               ELCD material flow: "Lithium, ion", 4.2 kg, DE. */

        // nominal voltage — 48 V
        attribute nominalVoltage = 48.0 [V];

        // capacity — 15 Ah  (= 0.72 kWh at nominal voltage)
        attribute capacity = 15.0 [A];

        // total mass — 4.2 kg  ← drives the ELCD "Lithium, ion" exchange
        attribute mass = 4.2 [kg];
    }
}
