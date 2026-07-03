# LCA + Financial Integration

**Purpose:** Cross-group integration point. The LCA connects ecological performance to financial performance. This is where the "regeneration is more profitable than extraction" thesis is actually tested with numbers.

---

## Current state

**LCA:** An openLCA integration PoC exists in the SolarX model (`../System Model/SolarX/The IS-state of the System/SimpleLCAIntegration/`, plus a `SimpleLCAIntegration2/`). It prototypes a SysML → TTL → OWL → SPARQL pipeline. Not yet extended to the full regenerative PV system. Confirm the exact scope of the PoC against those folders before building on it.

**Financial model:** Specified in the SustainaSun BM (Output 3) as a 30-year parametric project-finance model in EUR. The Excel file (`04-business-model/business-model/SustainaSun_PV_Financial_Model.xlsx`) needs to be opened and verified as built vs. still a spec.

**The gap:** There is no regenerative-scenario LCA. The BM uses IEA PVPS Task 12 baseline data (conventional c-Si, EU average). A regenerative scenario would change:
- Module sourcing (low-carbon EPD-verified TOPCon/HJT from EU manufacturers)
- Construction (low-disturbance protocol reduces embodied carbon of civil works)
- Operation (agrivoltaic land use changes the site's carbon balance — potentially net-positive)
- EOL (95%+ mass recovery via FRELP/ROSI-class processes vs. current 80% mass recovery to insulation)

---

## What this folder needs

1. **LCA scope definition** — system boundary for the regenerative PV LCA (where does the analysis start and end? Grid connection? Land? Community energy access?)
2. **LCA dataset** — openLCA database entries or links to existing EPDs for low-carbon modules (Meyer Burger, Aiko, or equivalent)
3. **Regenerative scenario delta analysis** — quantify the LCA difference between SolarX (conventional) and SustainaSun (regenerative) across the 8 lifecycle stages
4. **Financial model validation** — open the Excel file, confirm the 30-year parametric model is built, verify key formulas against the BM spec
5. **Connection script** — extend the openLCA/SysML pipeline to pull the regenerative scenario LCA results and feed them into the financial model's GHG performance line

---

## Integration path

```
Group 2 (SysML model)
    → material definitions, lifecycle stages, system functions
        → openLCA pipeline
            → regenerative LCA scenario
                → verified gCO2eq/kWh figure
                    → Group 1 financial model
                        → low-carbon premium eligibility confirmed
                            → IRR recalculated
```

This loop, once closed, is the technical proof of the Task-Force's central claim.
