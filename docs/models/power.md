# Power

The power sector represents the generation, transmission and storage of electricity. It is designed following the structure presented in {numref}`fig-pwr-res`, which is a more detailed and updated version of the sector designed in the TIMES-GEO model. For each region, the existing generation plants are aggregated by technology type and fuel type, and are distinguished between centralised and decentralised plants. The types of plants included are thermal power plants (THE), combined heat & power (CHP), heat producer plants (HPL) and renewable power plants (photovoltaic, wind onshore, wind offshore, concentrated solar power, hydro, ocean). The calibration of electricity and heat generation and fuel consumption is based on the UNSD Energy balance (United Nations (b), 2025), and the capacity disaggregation is based on the elaboration of IRENA statistics (IRENA, 2022). The efficiency and capacity factor of base-year technologies are derived from input data. Electricity and heat generated are delivered to the demand sectors through technologies that represent the transmission and distribution; these technologies account for the average regional energy losses due to the transmission and distribution of energy carriers. Data are based on the UNSD Energy balance (United Nations, 2025b) .

Electricity and heat commodities are characterised at the most detailed temporal resolution, using day-night and seasonal timeslices. The model incorporates electricity generation profiles by timeslice for renewable-based electricity and heat production (electricity and heat supplied by renewable sources, such as solar and wind). This approach enables accurate representation of the intermittent nature of renewable energy throughout the year, leveraging the model’s highest temporal granularity. The renewable generation profiles are derived from processed data available in the Plexos-world database (Brinkerink & Deane, 2020).


```{figure} ../images/image35.png
:name: fig-pwr-res
:alt: Power sector representation
:width: 90%

Power sector representation.


Key developments and updates made to the OMNIA power sector with respect to TIMES-GEO consist of:

  - Improving the power technologies decommissioning profiles,

  - New commodities and technologies,

  - Improving the design of renewable energy technologies.

**Power Plant Decommissioning Profiles**

The decommissioning profiles are based on a more detailed, data-driven method, incorporating information from the Global Energy Monitor (GEM) database. This GEM-based database covers more than 90% of global power plant capacity and includes detailed commissioning year data for each plant (Global Energy Monitor, 2025). This improvement allows for the decommissioning of specific capacity percentages each year, based on actual plant lifespans rather than a generic average.

**Introduction of Manufactured Gas Commodity**

In addition to the already designed fuels in the power sector, a new commodity, Manufactured Gas, has been introduced into the power sector model. This commodity aggregates three types of gases that were previously part of the natural gas commodity: Blast Furnace Gas, Coke Oven Gas, and Gasworks Gas.

This disaggregation allows for a more accurate assessment of emissions, as the individual properties of these gases differ significantly from natural gas. By considering these gases separately, the model can evaluate power plant emissions with higher precision. Additionally, a new set of technologies has been developed to handle the consumption of manufactured gas in the power sector, adopting the same techno-economic characteristics as the natural gas technologies.

**New Storage Technology: Pumped Hydro**

The already existing pumped hydro storage plants have been added to the model as electricity storage technologies. Pumped Hydro offers significant potential for large-scale energy storage by using water to store energy in the form of potential energy, which can be converted back to electricity as needed. Modelling of this technology has been elaborated using a detailed study by the National Renewable Energy Laboratory (National Renewable Energy Laboratory (NREL), 2023). This provides cost data, efficiency rates, and performance parameters, which have been integrated into the model.

**New Structure for Renewable Technologies: Solar and Wind**

The potential of renewable solar and wind energy has been divided into four tiers for wind technologies and three tiers for solar technologies, with each tier assigned a different availability factor and a maximum potential of installations. This allows the model to prioritise installations from tiers with the highest availability factors first, moving to lower tiers only as capacity expands.

**Updated technology database in power sector**

The base year and future power technologies for the power sector in the OMNIA model include 41 existing centralised power technologies, and 40 existing decentralised power technologies for the base year 2019, disaggregated by the types of plants thermal power plants (THE), combined heat & power (CHP), heat producer plants (HPL) and renewable power plants (photovoltaic, wind onshore, wind offshore, concentrated solar power, hydro, ocean) (see Figure 4). To represent adeguately the technological changes in the future, OMNIA includes more than 60 centralised power future technologies and 60 decentralised options. They are categorised as improved and advanced variants of the base-year technologies. Among the hydrogen options, both blending to gas and separated power technologies are included. The possibility to use ammonia is included in this sector, but only as blending in current fossil fuel power technologies. The underlying technical assumptions of these technologies are based on techno-economic inputs drawing from the technology database used for the EU reference scenario developed by the European Commission (European Commission, 2021). These include investment costs for new generation capacity, maintenance costs, technical efficiencies and expected lifetime. New technologies for power generation include both conventional thermal and CHP power plants and renewable power plants, like wind turbines and solar photovoltaic, and alternative technologies like hydrogen fuel cells and carbon capture and storage options (CCS).

**Key data sources for the power sector (non-exhaustive)**

| **Description** | **Source(s)** |
|:----------------|:--------------|
| **Energy consumption and<br>electricity generation** | United Nations (b) (2025) |
| **Electricity and heat own consumption,<br>and grid losses** | UN Energy Balance (United Nations (a), 2025);<br>UN Energy Statistics (United Nations (b), 2025) |
| **Power plant capacity** | IRENA (2022) |
| **New power plant<br>decommissioning profiles** | Global Energy Monitor (2025) |
| **New storage technology:<br>Pumped hydro** | NREL (2023) |
| **Renewable technologies:<br>Solar and wind** | Chu & Hawkes (2020) |
| **New power plants** | European Commission database (2021) |
