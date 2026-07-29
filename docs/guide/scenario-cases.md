# Scenario Cases

The OMNIA model is delivered with two modelling case scenarios:

1. **The Base-NoPolicy scenario** aims to showcase the functionality of the OMNIA model. The outputs of this scenario are not intended to interpret the possible future pathway of the global energy system, but rather to evaluate the core model functionalities.

2. The **Baseline policy scenario** aims to have a common scenario for intercomparison work among the IAMs developed under the project DIAMOND. The core approach is based on modelling emissions targets, to reflect the latest mitigation efforts based on officially submitted, specifically: i) the Nationally Determined Contributions (NDCs) and their latest updates as of and after COP30 for non-EU regions; and ii) Long-term targets (LTT) for both EU (member state level) and non-EU regions.

The SuppXLS folder contains all the regular scenario files (called Scenario Files in the VEDA nomenclature) in which the inputs and assumptions for the different modelling scenarios can be managed.

These scenario files can include definitions of parameters necessary to run the model (**Root parameters**) or assumptions regarding the customised scenarios (**Scenario parameters**). The files containing the Root parameters must always be selected to run the model, whereas the Scenario parameters can be selected based on the scenario characteristics. Scenario parameters can include the implementation of policy constraint scenarios (as in the *baseline policy scenario*), or they have been added to ensure that the results are not solely driven by cost optimisation, which could lead to a rapid switch in technology or fuel that does not reflect realistic trends or historical years.

The table below summarizes the files included in the `SuppXLS` folder. Each scenario is defined by a different combination of the scenario files contained in this folder.


| **File name** | **Description** | **Parameters** |
|:--------------|:----------------|:---------------|
| `Scen_00_DataByTimeslice_20` | Assumptions regarding the timeslice definition<br>and the intra-annual production and consumption profiles. | Root |
| `Scen_00_DemandProjections_SSP2` | Assumptions regarding end-use demand projections<br>by sector. | Root |
| `Scen_00_DiscountRate` | Cost of capital assumptions<br>for power sector technologies. | Root |
| `Scen_00_GHG_EmiFact.xlsx` | Greenhouse gas emission factors<br>used in the model. | Root |
| `Scen_00_Potentials` | Assumptions on renewable energy technical potentials,<br>primary production bounds, CO₂ storage limits,<br>and future import and export constraints<br>for energy commodities. | Root |
| `Scen_00_PWR_CAP-Reserve` | Capacity reserve assumptions<br>for the power sector. | Root |
| `Scen_00_PWR_CAP-Retirement` | Retirement profiles of existing<br>power generation technologies. | Root |
| `Scen_01_IND_Setup` | User constraints controlling the industry sector,<br>including chemicals, wood products,<br>paper and pulp, other industries,<br>and non-energy uses. | Scenario Base-NoPolicy |
| `Scen_01_IND_IIS_AL_CM_INF_Setup` | User constraints controlling iron and steel,<br>aluminium, non-ferrous metals, cement,<br>and non-metallic minerals, including the soft-link<br>with the ENGAGE model for circular economy assumptions. | Scenario Base-NoPolicy,<br>Scenario Baseline policy |
| `Scen_01_PWR_Setup` | User constraints controlling<br>the power sector. | Scenario Base-NoPolicy |
| `Scen_01_RES_COM_Setup` | User constraints controlling the residential<br>and service sectors. | Scenario Base-NoPolicy |
| `Scen_01_TRA_Setup` | User constraints controlling<br>the transport sector. | Scenario Base-NoPolicy |
| `Scen_01_UPS_Setup` | User constraints controlling<br>the upstream sector. | Scenario Base-NoPolicy,<br>Scenario Baseline policy |
| `Scen_02_baseline.xlsx` | Implementation of emission targets<br>included in the Baseline scenario. | Scenario Baseline policy |
| `Scen_02_Biofuels_Setup_baseline.xlsx` | Constraints related to<br>biofuel blending requirements. | Scenario Baseline policy |
| `Scen_02_IND_Setup_baseline.xlsx` | Industry-sector constraints,<br>including the circular economy structure<br>linked to the ENGAGE model. | Scenario Baseline policy |
| `Scen_02_PWR_Setup_baseline` | Power-sector constraints. | Scenario Baseline policy |
| `Scen_02_RES_COM_Setup_baseline` | Residential and service sector<br>constraints. | Scenario Baseline policy |
| `Scen_02_TRA_Setup_baseline` | Transport-sector constraints. | Scenario Baseline policy |
| `Scen_99_UPS_BIO_Ressource_MagPie` | Structure for updating bioenergy resource constraints<br>using the soft-link with the MAgPIE model. | Not applied in any scenario<br>(structure available) |
| `Scen_99_TRA_BehaviouralChange` | Structure for constraining the market potential<br>of battery electric vehicles through the<br>behavioural change model soft-link. | Scenario Baseline policy |
| `Scen_99_PWR_openTEPES` | Structure for constraining electricity trade<br>between European countries using the<br>openTEPES soft-link. | Not applied in any scenario<br>(structure available) |
| `Scen_99_AGR-UPS_Emissions_MagPie` | Structure for incorporating LULUCF emissions<br>from the MAgPIE soft-link. | Scenario Baseline policy |