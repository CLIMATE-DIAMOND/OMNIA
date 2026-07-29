# Industry

A general approach to industry representation in OMNIA is based on the following principles. It represents full sectoral coverage, including all industrial uses of energy, as defined by the global energy balance used. Model development has taken account of data availability, and in some cases the representation has been simplified in the absence of data. The design is aligned with the model’s purpose, which focuses on exploring energy system scenarios under climate policy. Finally, a stronger focus has been placed on the largest energy-consuming sectors, with implications for the modelling approach taken, which can be summarised as:

1.  *Detailed sector process approach* – Applied to large energy and carbon intensive sectors such as aluminium, iron and steel, and cement. Here, individual processes are represented e.g., EAF (secondary steel) and integrated plant (primary steel). Such an approach is particularly relevant where key alternative technologies for cleaner production are crucial and need to be represented explicitly.

2.  *Generic energy service approach* – For all other industrial sectors, the approach assesses the level of different energy services required to produce a unit of industrial output is determined e.g., high and low temperature heat, drying, motor drive, other services. This does not represent technologies explicitly but rather the energy flows. From a mitigation perspective, the key levers are fuel switching and efficiency gains.

Here, we first provide an overview of the modelling approach for aluminium and non-ferrous metal, steel, cement and non-metallic minerals. These sectors are chosen due to their global emissions footprint, and the focus of DIAMOND on circular economy analysis for these sectors. We then provide a short description of the generic energy service approach as described above.

**Aluminium and non-ferrous metals**

Aluminium production is disaggregated from the non-ferrous metals sector and split into primary and secondary (i.e., recycling) production. The key steps in primary aluminium production are aggregated into one process, i.e., refining, anode production and smelting, and process CO<sub>2</sub> emissions from the anode are accounted for. A base year primary pathway is developed by using historical data on production, average energy intensity and specific fuel inputs.

Future low carbon routes for primary production then rely on electrically / hydrogen powered boilers and calciners with conventional or inert anodes (to remove process emissions). Anode production can switch to hydrogen for its thermal inputs and process CO<sub>2</sub> emissions can be captured via CCS. These simplified low carbon options account for \~98% of total energy and \~99% of emissions in the aluminium supply chain. A secondary aluminium production option is modelled with a scrap input, the level of which may be defined by a particular scenario. This recycling option requires electricity and thermal energy inputs (using fossil fuels) in the base year but with hydrogen and electricity options in future.

The basic structure of the aluminium sector is shown below in {numref}`fig-al-res`. The rest of the non-ferrous sector then follows the generic energy service approach and is composed of high temperature heat, machine drive and other services.

```{figure} ../images/image38.png
:name: fig-al-res
:alt: Aluminium sector representation
:width: 90%

Aluminium sector representation.


Key data sources for the aluminium sector are provided in the table below.

**Key data sources for the aluminium sector (non-exhaustive)**

| **Dataset** | **Description** | **Source(s)** |
|:------------|:----------------|:--------------|
| **Production statistics** | - Primary aluminium production statistics.<br>- Secondary aluminium production available at regional level <br>and disaggregated to the national level. | USGS aluminium statistics (2024);<br>UCL MFA based on IAI (2024) |
| **Historic input energy mix** | - Energy consumption for primary aluminium production.<br>- Energy consumption for secondary aluminium production. | International Aluminium Institute (2019);<br>Peppas (2023) |
| **Technology parameterization** | Technology data aggregated where appropriate <br>(e.g. refining and smelting are represented as a single process). | Mission Possible Partnership (2023);<br>European Aluminium (2023) |

**Steel**

The steel production sector includes three main pathways for steel production, two of which are classified as primary steel pathways, while the third one is a secondary production pathway based on melting down recycled steel in an Electric Arc Furnace (EAF). The two primary production pathways are Blast Furnace-Basic Oxygen Furnace (BF-BOF) and Directly Reduced Iron-Electric Arc Furnace (DRI-EAF). Both pathways essentially involve removing oxygen from the iron ore, in a process called ‘reduction’, to produce iron. The blast furnace route relies on coke and coal as the reducing agent, producing molten ‘hot metal’ or pig iron. This process is highly energy intensive and results in very high levels of emissions. To produce steel, the pig iron is fed into a basic oxygen furnace, where the carbon content is further reduced, from 4-5% down to 0.25%. DRI uses an alternative reduction approach, using natural gas to produce the required syngas (CO plus H<sub>2</sub>), with iron left in a solid state. Avoiding melting at this stage reduces the energy requirements and associated emissions. The produced sponge iron is then melted down in an EAF to produce crude steel.

The structure of the steel sector is largely based on (Pye et al., 2022) and is shown below in {numref}`fig-is-res`. BF-BOF is modelled as a single integrated process, as is DRI with EAF. This approach means that pig and sponge iron are not represented as explicit commodities in the model. While a simplification, the lack of trade representation of these commodities is appropriate, given that these commodities are scarcely traded. Scrap steel is not traded either. Note that insights on trade will be provided via the linkage with ENGAGE.


```{figure} ../images/image39.png
:name: fig-is-res
:alt: Steel sector representation
:width: 90%

Steel sector representation.

Key data sources are summarised in the table below. Production statistics for the steel sector are taken from PIOLab (Wieland et al., 2022), while energy benchmarks are primarily sourced from the IEA (IEA, 2020). Technology cost estimates are sourced from a range of literature where we can determine individual cost components (Fischedick, Marzinkowski, Winzer, & Weigel, 2014)(van Sluisveld, de Boer, Daioglou, Hof, & van Vuuren, 2021; Vogl, Åhman, & Nilsson, 2018). Costs do not change over time but are rather estimates of fully commercialised production pathways.

**Key data sources for the steel sector (non-exhaustive)**

| **Dataset** | **Source(s)** |
|:------------|:--------------|
| **Production statistics** | PIOLab (Wieland et al., 2022) |
| **Energy benchmarks** | IEA (2020) |
| **Technology cost estimates** | Fischedick et al. (2014);<br>van Sluisveld et al. (2021);<br>Vogl et al. (2018) |

**Cement and non-metallic minerals**

The cement sector is disaggregated from the non-metallic minerals sector and modelled to represent two key parts of the cement production process: clinker production in rotary kilns (based on wet and dry kiln technology), and cement production, involving the mixing of clinker with other aggregates. From an emissions perspective, the clinker production is the dominant emission source, producing both process and combustion-related CO2 emissions. Process emissions are generated via the calcination process, where calcium carbonates are decomposed into calcium oxides, lime and CO<sub>2</sub> by the addition of heat. Combustion emissions come from the use of fossil fuels necessary to generate the significant energy required to heat the raw materials (limestone, aluminosilicate clay) to well over 1000 °C. The clinker is cooled down and then mixed with gypsum. The mixture is finally milled into a fine powder to produce cement.

The structure of the cement sector is shown in {numref}`fig-cm-res` below. The structure features the current stock of dry and wet kiln technologies, and investment options that include more efficient kilns and those with CCS. The grinding process also has the option to use lower clinker blends, to produce low clinker cement. Differences in clinker-cement ratios between regions are captured to reflect current production practices.


```{figure} ../images/image41.png
:name: fig-cm-res
:alt: Cement sector representation
:width: 90%

Cement sector representation.

Key data sources for the cement sector are provided in the table below.

**Key data sources for the cement sector (non-exhaustive)**

| **Dataset** | **Description** | **Source(s)** |
|:------------|:----------------|:--------------|
| **Production statistics** | Cement and clinker production by country (2000–2023). | GCP-CEM – The Global Carbon Project cement process emissions dataset (Andrew, 2019) |
| **Process emissions<br>(clinker production)** | Process emissions from clinker production (2000–2023). | GCP-CEM – The Global Carbon Project cement process emissions dataset (Andrew, 2019) |
| **Energy consumption<br>benchmarks** | Energy consumption per tonne of cement produced. <br>Data are provided by GCCA through the GNR project and are available <br>for a selected set of countries. | Getting the Numbers Right (GCCA, 2024);<br>IEA Roadmap (2018) |
| **Technology cost estimates** | Current and projected technology cost estimates. | Lerede et al. (2021) |

**Other industrial sectors**

For those industry sectors that are not modelled in detail, a generic energy service approach is adopted, as shown in {numref}`fig-oi-res`. Industrial sector output is met by a set of energy services, namely low and high-temperature heat, machine drive and a generic category for the other services. The relative shares of these energy services (which sum to 100%) are fixed over time, and based on expert judgement. Individual technologies (shaded in blue) produce these different energy services. Each technology is defined in two ways; i) the energy type used to produce the energy service and ii) it’s level of energy efficiency performance. This provides the model with two approaches to decarbonisation; fuel substitution e.g. a technology producing low temperature heat can switch from gas to bioenergy, and improved efficiency e.g. a technology producing low temperature heat can upgrade from standard to advanced. Note that machine drive of course only has one input energy type, electricity. Despite the simplified approach, this method can be considered a consistent and scalable method for modelling energy service demand across very different industrial sectors at the global level, where data availability is limited.


```{figure} ../images/image42.png
:name: fig-oi-res
:alt: Other industry sector representation
:width: 90%

Other industry sector representation.

Data for new technology options, notably costs for different energy efficiency improvements, are sourced are included in the table below from European Commission, 2021.

**Key data sources for the other industry sectors (non-exhaustive)**

| **Dataset** | **Description** | **Source(s)** |
|:------------|:----------------|:--------------|
| **Technology cost estimates<br>and techno-economic parameters** | Current and projected technology cost estimates, <br>together with the main technical characteristics of the technologies. | European Commission (2021) |