# Residential and Service Sectors

In OMNIA, the global residential and service sectors are comprehensively modelled across all regions, offering a more spatially detailed and technology-rich representation than in the original TIMES-GEO model.

The **residential sector** features twelve energy commodities, including electricity, fossil fuels, district heating, and renewable sources such as geothermal and solar heating, which are consumed across six key end uses: thermal uses, air conditioning, cooking, lighting, electric appliances, and “other uses”. Distributed power is tracked under power sector. In this sector, each region is split into high and low-thermal-intensity zones for thermal and cooling energy service uses to represent differences in energy consumption patterns between high-density urban versus low-intensity residential zones. This zonal distinction allows the model to reflect variations in heating and cooling demand due to spatial, climatic and socioeconomic differences among the OMNIA regions. Overall, the residential sector end uses represented are the following {numref}`fig-rsd-res`:

1.  > Thermal uses for high (THH) and low (THL) thermal intensity zones

2.  > Air conditioning for high (ACH) and low (ACL) thermal intensity zones

3.  > Cooking (CK), lighting (LIG), electric appliances (EAP), and other uses (OTH)

The **service sector** is also modelled using the same set of twelve fuel types and a parallel set of end useful services: thermal uses, which include both space-heating and water-heating demands, air conditioning, cooking, lighting, electric appliances, street lighting, and other uses. Unlike the residential sector, however, the service sector has not been further zonally disaggregated nor recently enhanced beyond the original TIMES-GEO structure. Despite this, it remains fully integrated into OMNIA’s broader energy system, ensuring consistency in cross-sectoral energy analysis and enabling scenario comparisons that involve both household and commercial energy demands.

Residential and service sector energy demands are modelled as a consumption sector where household technologies act as processes that convert energy into useful services such as space heating, space cooling, water heating, cooking, and lighting. The model incorporates the following processes corresponding to their respective service demands {numref}`fig-srv-res`:

1.  > Thermal uses (TH)

2. > Air conditioning (AC)

3. > Cooking (CK), lighting (LIG), street lighting (SLIG), electric appliances (EAP), and other uses (OTH)

The breakdown of end uses by fuel for each region is derived in two steps. First, regional residential and service energy balances are taken from the UN Statistics Division 2019 Energy Balances (United Nations (a), 2025), providing the total energy consumed by fuel type in each of the 28 OMNIA regions. Second, the share of each end use within a given fuel is populated using expert assumptions, recorded in the `VT_OMNIA_RES` and `VT_OMNIA_SRV` input workbooks. This procedure yields a fully populated matrix of energy consumption across the six residential end uses (thermal uses, air conditioning, cooking, lighting, electric appliances, other uses) and seven service end uses (the same plus street lighting), for the 12 fuel commodities represented in the model. The expert-assumption layer reflects that residential and service energy statistics are typically reported by fuel and not by end use, particularly outside the OECD; the assumed shares therefore carry residual uncertainty that scales with the granularity of reporting in each region.

The residential and service demands are measured in \[PJ\] for all end uses except for lighting, which is measured in \[M units\] of lights. Together, the residential and service sector representations in OMNIA provide a high level of spatial, temporal, and technological granularity, supporting robust scenario analysis for global energy transitions. These improvements enable OMNIA to capture a wide range of energy consumption behaviours, infrastructure constraints, and regional decarbonisation pathways across building-related sectors.


```{figure} ../images/image43.png
:name: fig-rsd-res
:alt: Residential Sector representation
:width: 90%

Residential Sector representation.


```{figure} ../images/image44.png
:name: fig-srv-res
:alt: Service sector representation
:width: 90%

Service sector representation.

**Key improvements in the residential sector**

**Sub-regional energy intensity division for residential heating and cooling demands**

Each OMNIA region is divided into two zones based on energy intensity: the high-intensity and low-intensity urban zones, driven by thermal demands. This segmentation allows for more accurate modelling of heating and cooling needs in regions with different energy consumption profiles. The division is performed based on spatiotemporal energy consumption simulation data across the countries of the world (Sachs et al., 2019). The Sachs et al. dataset covers 165 countries representing approximately 99.96% of global residential energy use and stratifies each country into up to nine energy-intensity bands defined by spatial population density and heating- and cooling-degree days (Sachs *et al.*, 2019). For OMNIA, the nine bands are collapsed into two zones: bands 1 to 6 form the low-intensity (LE) zone and bands 7 to 9 form the high-intensity (HE) zone. Moreover, to improve the level of modelling detail, temporal profiles for heating and cooling demand are derived for each zone and each region by aggregating the native 24-hour, 4-season (96 slices) data of Sachs et al. (2019) onto OMNIA's 20 time slices. Normalised profiles, rather than absolute energy intensities, are used as model input, since the magnitude of demand is already captured in the energy balance calibration and OMNIA requires only the temporal shape. Each region and zone has distinct heating and cooling profiles, which vary across seasons and affect fuel consumption for end uses. These profiles consider demand changes within each season. This data is used as input to the model, enhancing its precision and accounting for demand shifts.

**Base year design and future residential and service technologies**

The residential sector’s model includes key end-use technologies representative of the residential sector’s processes. The base year and future residential technologies for the residential sector in the OMNIA model are presented in {numref}`fig-rsd-tech`. The model includes 34 existing technologies for the base year 2019, disaggregated by end use: thermal uses, air conditioning, cooking, electric appliances, lighting, and other uses.

To represent the technological changes in the future, OMNIA’s residential sector includes 114 future technologies, categorised as ordinary, some as existing technology, improved, and advanced variants of the base-year technologies. Among the thermal technologies for the high-intensity thermal heating demand, district heating technologies are also included, since the high-intensity thermal zones represent highly populated urban areas where district heating could be a likely scenario. This framework allows the OMNIA model to represent the residential sector’s energy demand with high spatial, temporal, and technological granularity, aiding in understanding energy consumption patterns and potential efficiency improvements.

The base year and future technologies for the service sector are presented in {numref}`fig-srv-tech`. The model includes 23 existing technologies for the base year 2019, covering the main end uses: thermal uses, air conditioning, cooking, lighting, electric appliances, street lighting, and other uses. These technologies reflect energy use across multiple fuel types, including electricity, fossil fuels, and renewables. The model also includes 35 future technologies for the service sector that represent improved and advanced versions of the base-year technologies, supporting transitions to more efficient and low-emission systems.


```{figure} ../images/image45.png
:name: fig-rsd-tech
:alt: Base year and future available residential sector’s technologies
:width: 90%

Base year and future available residential sector’s technologies.


```{figure} ../images/image46.png
:name: fig-srv-tech
:alt: Base year and future available service sector’s technologies
:width: 90%

Base year and future available service sector’s technologies.

**Key data sources for the residential sector (non-exhaustive)**

| **Dataset** | **Source(s)** |
|:------------|:--------------|
| **Heat pump energy consumption** | IEA (2022) |
| **Heating and cooling<br>demand profiles** | Sachs et al. (2019) |
| **Technology cost estimates** | European Commission (2021) |
| **Technology<br>technical assumptions** | IRENA (2013) |
