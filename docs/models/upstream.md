# Upstream

The Upstream sector includes all processes related to primary fuel production and transformation, i.e., fossil fuel extraction and transformation, imports and exports of fuels and products, biofuel production, hydrogen production and synthetic fuel production.

Within fossil fuel extraction and transformation, the supply chains are structured as follows:

1.  Cumulative reserves and resources

2.  Extraction processes

3.  Fuel transformation processes

4.  Distribution processes, delivering fuels to consumption end points

On the other hand, the supply chains for the three other groups are simpler and include only two steps:

5.  Production process

6.  Delivery process

**Fossil fuel activities**

For each fossil fuel, modelling encompasses a representation of reserves, as well as the extraction and processing steps. Both process-based emissions and fugitive emissions are accounted for, with the representation fugitive emissions being improved. Delivery processes are then attached to the output commodity. The implemented fossil fuel commodities are depicted below:

  - **Coal:** two types of coal are modelled, namely lignite and other coal types. The extraction chain for lignite and other coal type is similar and are represented by a single extraction process for each type of coal. Additionally, coal liquefaction and gas-to-liquids plants are modelled as transformation processes.

  - **Crude oil:** from a conventional extraction process or from enhanced oil recovery (EOR). Representation of crude oil reserves has been improved for both conventional extraction and EOR to take into consideration its specific reserve capacity. EOR is an extraction process that uses carbon dioxide, along with other additives, to extract oil from wells that cannot be recovered using traditional extraction methods. These methods allow storing carbon dioxide in depleted oil fields and enable the extraction of oil that would otherwise remain untapped. Part of the carbon dioxide used by the process is sequestered into the field and another part is released and can be vented, recycled to be reused in an EOR process or sent to another sequestration process.

  - **Natural gas:** including natural gas as well as natural gas liquids with an extraction process and a separate processing process that consume wet natural gas and separate it into dry natural gas and natural gas liquid. The model also includes the liquefaction and regasification processes to produce liquified natural gas and transform it back into natural gas after trading for example.

Other fossil fuels processing represented are: 

  - **Coke plant:** The implementation of coke oven plants is a basic representation with a specific modelling of by-product ‘coke oven gas’.
  - All other fossil fuel processing plants have been regrouped under a process named “Other processing plants”.

For each commodity, a supply curve for reserves of each fossil fuel is employed with at least three levels, to depict the cumulative reserve of the commodity with increasing cost.

Then, for each reserve commodity, we have an extraction process that consumes energy and produces the corresponding commodity, as well as any additional commodity and emissions. Depending on the type of commodity, we included additional processing steps, such as a liquefaction process for natural gas.

The refinery process is modeled with several component. The hydrogen production for refinery usage is implemented as it’s own process, because hydrogen production is expected to become a key sector in decarbonization pathways. A separate hydrogen sector has been created, which allows implementing different hydrogen production technologies and let the model choose the production technologies based on cost optimisation and GHG emissions. Also, we are modelling the energy input of refineries using technologies such as boiler and HVAC systems. This enables the model to decarbonise energy (own energy) used in the refinery based on the cost of energy services by replacing conventional ones with low-emission alternatives using electricity or biomass. The oil products share (in refineries) is based on the UNSD Energy balance (United Nations, 2025b) and slightly relaxed in future timesteps. The proposed implementation is illustrated in {numref}`fig-ref-rap`.


```{figure} ../images/image33.png
:name: fig-ref-rap
:alt: Refinery representation
:width: 90%

Refinery representation.


Moreover, transmission/distribution processes of crude oil, natural gas and natural gas liquids are being modeled by implementing a pipeline system, considering energy consumption and related costs. Note that deliveries between model regions are modelled through import/export processes through the endogenous trade module in TIMES. These processes represent the trade infrastructure between regions (ships, pipelines, etc.) based on investment cost parameters, fix and variable O&M cost parameters and a stock parameter or bound on activity to limit trade capacities.

Finally, fugitive emissions are being accounted as well as the energy and process-based emissions. These include fugitive emissions from coal mining (associated with the coal extraction process), oil activities (related to the oil extraction process and oil pipelines) and natural gas activities (linked to the natural gas extraction process and natural gas pipeline). Based on computational complexity, we may introduce technologies that decrease venting and flaring emissions in the next versions of the model.

**Other type of feedstock**
  - **Uranium**
  - **Biomass feedstock:** five feedstocks are being modelled, namely forest residues, crops grown for energy, agricultural residues, oil crops (1st generation crops biodiesel) and cereals (1st generation crops ethanol). A supply curve for these five commodities is developed based on the link with MAgPIE.

**Alternative fuel activities**

The representation of alternative fuels includes biofuel, hydrogen and synthetic fuels production. For biofuels, the production processes have been implemented for key biofuels such as biodiesel, bio-gasoline/renewable gasoline, ethanol, cellulosic ethanol, renewable diesel and renewable natural gas. These processes require inputs of raw biomass from both first-generation sources (such oil crops and cereals) or second-generation sources (such as forest residues, agricultural residues, energy crops). These input flows are coupled with the MAgPIE model using a supply curve for reserves of this feedstock available each year.

Regarding hydrogen, current production is often included as part of upstream or industry processes using hydrogen. For example, the use of fuel to produce hydrogen for the refining process is included in the overall fuel use for refining. However, this fuel has been separated, and hydrogen production is now modelled outside of upstream and industry processes. This allows to explore decarbonisation options for hydrogen production. The main hydrogen production technologies have been implemented, such as steam methane reforming (with and without carbon capture), autothermal reforming (with carbon capture), electrolysis, biomass gasification (with and without carbon capture) and coal gasification (with and without carbon capture). Hydrogen production can be centralised or decentralised (i.e., produced on-site directly in the sector that uses it). Following the production step, modelling includes hydrogen transmission steps and hydrogen storage options. In this hydrogen sector, different conversion (and reconversion) processes have been implemented such as liquefaction or ammonia conversion. Commodities can then be used for different end-use (e.g., transport) or for trade purposes.

Finally, e-fuels (or synthetic fuels) are fuels that can replace their fossil equivalents without the need for any changes or adaptations in technology. They are produced using hydrogen and carbon dioxide, which can be captured from CCS technologies or DAC. Emissions of these fuels are like those of their fossil equivalent, but since they are produced from carbon dioxide, their overall emissions balance is close to neutral. There are various types of synthetic fuels available, as well as different production methods. Three different e-fuel production pathways have been implemented: synthetic methane, synthetic liquid fuels (turbo jet fuel, and diesel), and synthetic methanol. {numref}`fig-hyd-res` showcases the implementation of both hydrogen and synthetic fuels modules.


```{figure} ../images/image34.png
:name: fig-hyd-res
:alt: Hydrogen and synthetic fuels modules implementation
:width: 90%

Hydrogen and synthetic fuels modules implementation.


**Key data sources for the upstream sector (non-exhaustive)**

| **Description** | **Source(s)** |
|:----------------|:--------------|
| **Fossil fuel reserves and<br>historical production data** | Energy Institute (2023);<br>Energy Institute (2024);<br>International Energy Agency (2024) |
| **Fossil fuel processing<br>techno-economic parameters** | Favennec (2022);<br>Khwanpruk et al. (2015);<br>Panos & Kannan (2016);<br>Zhang et al. (2020);<br>Agarwal et al. (2020) |
| **Uranium production and demand** | Nuclear Energy Agency (2020) |
| **Liquefaction capacity,<br>regasification terminal capacity,<br>and inter-regional trade** | International Gas Union (2020) |
| **Hydrogen consumption in refineries<br>by type and world region** | International Energy Agency (2023) |
| **Hydrogen pathway<br>techno-economic parameters** | International Energy Agency (2021);<br>International Energy Agency (2019);<br>NREL (2020) |
| **Extraction and production costs<br>for crude oil and natural gas** | Aguilera (2014);<br>WSJ News Graphics (2016) |
| **Extraction and production costs<br>for coal** | International Energy Agency (2020) |
| **Coke ovens<br>techno-economic parameters** | Qin & Chang (2017) |
| **Natural gas processing plants<br>techno-economic parameters** | Khwanpruk et al. (2015) |
| **Liquefaction and regasification of natural gas<br>techno-economic parameters** | Zhang et al. (2020);<br>Pospíšil et al. (2019);<br>Agarwal et al. (2020) |
| **Refineries<br>techno-economic parameters** | Favennec (2022) |
| **Industrial boilers<br>techno-economic parameters** | Panos & Kannan (2016) |
| **Enhanced oil recovery<br>techno-economic parameters** | Abuov et al. (2022);<br>Kwak & Kim (2017) |
| **Pipelines for oil, natural gas liquids,<br>and natural gas:<br>techno-economic parameters** | Global Energy Monitor (2024);<br>Global Energy Monitor (2023) |
| **Fugitive emissions:<br>calculation methods and emission factors** | IPCC (2007) |
| **Coal mine types** | Global Energy Monitor (2024) |
| **Biofuel production<br>techno-economic parameters** | Brown et al. (2010);<br>Diederichs et al. (2016);<br>Moret et al. (2016);<br>Swanson et al. (2010);<br>NREL (2011) |
| **Enhanced recovery<br>techno-economic parameters** | Abuov et al. (2022);<br>Kwak & Kim (2017);<br>Vikara et al. (2019) |
