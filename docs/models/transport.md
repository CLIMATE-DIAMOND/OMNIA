# Transport

In OMNIA, the global transport sector offers an improved disaggregated and technology-rich transport system compared to the TIMES GEO model. The model captures both passenger and freight transport across all modes, using 2019 fleet stock data for the base year. The sector’s technology-rich model allows for long-term simulation of fuel switching and energy efficiency improvements.

Specifically, the global energy consumption for transport has 11 energy commodities, including both fossil and renewable fuels, and is mapped by transport mode (road, rail, aviation, navigation). Transport services are modelled as a consumption sector, with transport vehicles acting as processes that convert energy into transport services. The model includes the following processes corresponding to their respective transport modes ({numref}`fig-roa-res` and {numref}`fig-nonroa-res`):

1. > **Road:** Cars, buses, motorbikes, LCVs, medium and heavy trucks.

2. > **Rail:** Passenger, freight, and high-speed electric.

3. > **Aviation:** Disaggregated into domestic/international and further into short/long flights.

4. > **Navigation:** Disaggregated into domestic/international and further into short/long freight trips and passenger trips.

Then, the transport service demand is expressed in mode-specific service units, i.e., \[Bvkm/PJ\] for road transport, and for non-road transport: \[Bpkm/PJ\] for passenger transportation, and \[Btkm/PJ\] for freight transportation respectively. 

**Key Improvements in transport and data inputs**

The key improvements made in the representation of the transport sector of OMNIA on top of the TIMES-GEO transport sector are as follows:

**1) Type of transport vehicle Breakdown by Fuel:** The share of energy consumption for different types of vehicles (e.g., cars, buses) by fuel type is detailed according to modeller assumptions and by using a chart that presents the shares of different transport types for different cities worldwide (MobiliseYourCity Secretariat, 2022). The resulting shares are then iteratively reconciled with the public-versus-private passenger-kilometre split in Table 17 of the VT\_OMNIA\_TRA input workbook to ensure consistency between the energy-share and the activity-share representations.

**2) Technologies for Aviation Navigation and Rail:** Techno-economic values, including future fuels, are drawn from the European Commission EU Reference Scenario 2020 technology database (European Commission, 2021). Efficiencies originally reported in tonnes of oil equivalent per billion tonne-kilometre or billion passenger-kilometre are converted to billion tonne-kilometre per petajoule or billion passenger-kilometre per petajoule, and capital costs are converted from Euro 2015 to United States Dollar 2021. For each existing technology, three improvement rates (ordinary, improved, advanced) are assigned across the years 2020, 2030, 2040 and 2050. For navigation technologies absent from the EU Reference Scenario 2020 database (notably ammonia-fuelled shipping), efficiency is estimated from desk research using diesel as the reference fuel.

**3) Share of long and short trips and passenger navigation for domestic and international bunker:** Another improvement made is that navigation is now split into short and long trips and passenger trips for both domestic and international navigation. In this way, it is possible to distinguish the technology options by the size of the ship and the distance of the trip; for example, electric shipping technology is most likely to be used for smaller ships and shorter trips, and domestic passenger trips. Data from the IMO (International Maritime Organisation) report for the year 2019 are used together with assumptions to create the energy consumption shares between different types of shipping globally (IMO Data Collection System, 2019). The global shares of navigation energy use derived from the IMO data are 85% for long trips, 11% for short trips and 4% for passenger trips. These global totals are then allocated between domestic and international shipping using a trial-and-error procedure documented in the IMO\_stats\_calculations.xlsx workbook and split between the domestic and international navigation designed in the OMNIA.

**4) Short and long flights:** Aviation is split into long and short flights for both domestic and international flights to allow the model to choose technologies in a disaggregated way. This is done to allow the model to leverage the potential use of different technologies depending on whether the flight is short (\<500 km) or long (\>500) (OpenFlights Database, 2014). For example, long flights are unlikely to be fully battery electric or hydrogen-based, whereas short flights can be . Specifically, the OpenFlights 2014 global flight-route database and the accompanying airports.dat coordinates dataset are processed with the Python programme short\_flights\_domestic\_international.py (available in the OMNIA repository under "Aviation - share of short flights"). Each route is classified as domestic (origin and destination in the same OMNIA region) or international (different regions), the great-circle distance between airports is computed assuming a spherical Earth, and routes shorter than 500 km are classed as short. For each OMNIA region and flight type, the programme computes the percentage of total flight kilometres, the percentage of short-flight kilometres and the percentage of long-flight kilometres and writes them to flight\_type\_stats\_by\_region.csv. The share of short-flight kilometres per region is used as a proxy for the share of fuel consumed by short flights in that region. The 2014 data are assumed representative of the OMNIA base year 2019.

**5) High Speed Electric Rail:** High-speed rail (HSR) is added to the model because its energy efficiency differs significantly from conventional electric rail. The share of high-speed electric trains within total electric-rail activity is estimated for each OMNIA region from desk research on infrastructure, investment and network development, and set to zero in regions without operational HSR infrastructure. The techno-economic values for HSR are then drawn from the European Commission EU Reference Scenario 2020 technology database (European Commission, 2021).


```{figure} ../images/image47.png
:name: fig-roa-res
:alt: Road technologies representation in transport sector
:width: 90%

Road technologies representation in transport sector.



```{figure} ../images/image48.png
:name: fig-nonroa-res
:alt: Non-road technologies representation in transport sector
:width: 90%

Non-road technologies representation in transport sector.

**Base Year and Future Technologies Transport**

The transport sector’s model includes key end-use technologies representative of the transport sector’s processes. The base year and future transport technologies of the OMNIA model are presented in {numref}`fig-tech-by` and {numref}`fig-tech-new`. The model includes 101 existing (ordinary) technologies for the base year 2019, disaggregated by mode and vehicle type across road, rail, aviation, and navigation. These technologies reflect the use of conventional fuels such as gasoline, diesel, LPG, natural gas, and electric power, as well as hybrid technologies.

To capture technological evolution, OMNIA’s transport sector is rich in future technologies enabling the model to choose across multiple decarbonisation pathways. A total of 281 future technologies are defined for scenario projections as presented in {numref}`fig-tech-new`. These include ordinary, improved, and advanced variants of base-year technologies with the addition of hydrogen and electric technologies for all transport modes. This comprehensive technology database enables the TIMES-VEDA framework to optimise long-term decarbonisation, fuel switching, and efficiency improvements in the global transport sector.


```{figure} ../images/image49.png
:name: fig-tech-by
:alt: Base year technologies for the transport sector
:width: 90%

Base year technologies for the transport sector.

```{figure} ../images/image50.png
:name: fig-tech-new
:alt: Available future technologies for transport sector
:width: 90%

Available future technologies for transport sector.

**Key data sources for the transport sector (non-exhaustive)**

| **Dataset** | **Source(s)** |
|:------------|:--------------|
| **Road transport<br>activity breakdown** | MobiliseYourCity Secretariat (2022) |
| **Passenger and freight navigation<br>trip breakdown (long- vs short-distance)** | IMO Data Collection System (2019) |
| **Technology cost estimates<br>and technical assumptions** | European Commission (2021) |
| **Aviation flight assumptions** | OpenFlights Database (2014) |


