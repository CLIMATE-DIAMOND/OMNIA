# Model overview


The model is developed using a Reference Energy System (RES), which is a network-based topology that represents the interdependencies between technologies and energy flows within the energy system ({numref}`fig-ref-ener`). The supply of energy includes the upstream and power sector and focuses on the provision and transformation of energy into useful fuels. It encompasses fuel mining and energy potential assessments, the extraction of fuels, and regional trades of fuel sources. It also includes conversion processes that transform primary energy into secondary forms, such as refineries, the hydrogen supply chain, and power plants, along with all transformations explicitly accounted for in the energy system. The demand side focuses on energy usage across various end-use sectors, including residential, services, transportation, industry, and agriculture, and international bunkers, which are included in the transport sector. The energy system described in the RES encompasses all the energy flows, also referred to as commodities, necessary to meet the system's sectoral demands, from primary energy sources through secondary energy carriers to final energy. The energy that flows in the system is produced or consumed by a dedicated “technology”, with the RES encompassing a comprehensive range of existing and envisaged energy technologies, also called processes, involved in the production, transformation, trade, and utilisation of energy flows, as well as several technologies required to meet service demands in the energy system. The OMNIA model includes the accounting of GHG combustion and process emissions, and primary material consumptions, such as clinker and scrap aluminium. Finally, a water module is available, accounting for the water needs which can be activated by the user. Each sector is modelled as a stand-alone module, and further details are available in the sections below.


```{figure} ../images/image32.png
:name: fig-ref-ener
:alt: High-level reference energy system of OMNIA for one region
:width: 90%

High-level reference energy system of OMNIA for one region


Given the modelling scope and the requirements, the model has the following general characteristics:

**Regional configuration**: This model is designed to represent the full global energy system, and it is configured in 28 regions. More information about the modelled regions and the country-level disaggregation is available below.

**The base year (or start period)**: The base year for OMNIA is 2019, meaning that the model is calibrated based on this historical year. Therefore, all the data collected and elaborations for calibrating the model (detailed in the following section) refer to the year 2019 and to the regional configuration.

***Temporal scope***

  - ***Time horizon:*** The time horizon of the model extends until 2050. However, the time extension of the model is adjustable, so it can be extended/reduced to any year before and port 2050. To run the model post 2050 you need to be sure that all the necessary exogenous inputs are defined until that year (e.g., GDP projections, population projections).

  - ***Period durations:*** TIMES solves the optimisation problem of the energy system over several periods, and each period can extend over a variable number of years. The delivered model is set and tested to run scenarios for the following periods: 2019, 2024, 2030, 2035, 2040, 2045, 2050. The model is flexible, and the duration of the periods can be changed according to the modeller’s needs.

  - ***Time-slices:*** In OMNIA, for the annual demand electricity demand profile, 20 time slices are defined, featuring a combination of 4 seasonal and 5 daily time slices.

**Discount Rate and technology cost of capital:** A general discount rate of 5% is used in the calculation of present value of cash flows in the model horizon, and a cost of capital for each power technology based on (Hatton, Staffell, Jansen, Oluleye, & Hawkes, 2025)

**Season codes**

| Code | Period |
|:----:|:-------|
| `Q1` | January–March |
| `Q2` | April–June |
| `Q3` | July–September |
| `Q4` | October–December |

**Daynite block codes**

| Code | Hours |
|:----:|:------|
| `B1` | 01:00–05:00 |
| `B2` | 06:00–09:00 |
| `B3` | 10:00–14:00 |
| `B4` | 15:00–19:00 |
| `B5` | 20:00–24:00 |

**Emission granularity**: The model tracks the main sources of greenhouse gases from both combustion in the energy sector and industrial processes, namely carbon dioxide (CO<sub>2</sub>), methane (CH<sub>4</sub>) and nitrous oxide (N<sub>2</sub>O). These can also be reported as carbon dioxide equivalent emissions (CO<sub>2eq</sub>).

**Technology framework:** more than 6000 processes and 600 commodities are part of the energy system represented in the RES, including processes representing mining and extraction of fuels, fuel transformation processes into energy carriers, such as supply and power sector technologies, simplified distribution processes linking the energy flow between sectors, sectoral energy transformation into final demand and trade technologies. Among these processes, multiple mitigation technologies are included in each sector to allow for representing climate mitigation options.

**Naming convention:** All the elements that are part of the RES are defined in the model with a specific code-name convention. The naming convention facilitates the model development, as well as provides a clear, tidy, and transparent model structure. Moreover, this also facilitates the data automation routines processing data inputs, data outputs, and results. A full description of the naming convention is provided in the PDF document “OMNIA Naming conventions” released with the model and is available on the GitHub repository.

**OMNIA regional disaggregation**

| **Region** | **Description** | **Countries** |
|:---------:|-----------------|---------------|
| `AFE` | Eastern Africa | Ethiopia, Kenya, Sudan, Mauritius, Eritrea, South Sudan, Burundi,<br>Comoros, Djibouti, Madagascar, Réunion, Rwanda, Somalia, Uganda |
| `AFN` | Northern Africa | Egypt, Algeria, Morocco, Libya, Tunisia |
| `AFW` | Western Africa | Democratic Republic of the Congo, Côte d'Ivoire, Ghana, Cameroon, Gabon,<br>Benin, Senegal, Togo, Niger, Republic of the Congo, Burkina Faso,<br>Cape Verde, Central African Republic, Chad, Equatorial Guinea, Gambia,<br>Guinea, Guinea-Bissau, Lesotho, Liberia, Malawi, Mali, Mauritania,<br>São Tomé and Príncipe, Seychelles, Sierra Leone, Eswatini |
| `AFZ` | Southern Africa | Tanzania, Angola, Mozambique, Zimbabwe,<br>Zambia, Botswana, Namibia, South Africa |
| `NIG` | Nigeria | Nigeria |
| `RUS` | Russian Federation | Russian Federation |
| `ASC` | Central Asia | Kazakhstan, Uzbekistan, Turkmenistan, Azerbaijan, Mongolia,<br>Georgia, Kyrgyzstan, Armenia, Tajikistan, Afghanistan |
| `ASE` | Southeast Asia | Thailand, Malaysia, Singapore, Myanmar, Cambodia,<br>Brunei Darussalam, Lao People's Democratic Republic,<br>Democratic People's Republic of Korea, Cook Islands, East Timor,<br>Fiji, French Polynesia, Kiribati, Macau, Maldives,<br>New Caledonia, Palau, Papua New Guinea, Samoa,<br>Solomon Islands, Tonga, Vanuatu |
| `CHN` | China Mainland | People's Republic of China, Hong Kong |
| `IDN` | Indonesia, Philippines and Vietnam | Indonesia, Philippines, Vietnam |
| `IND` | India | India |
| `ASO` | South Asia | Bangladesh, Nepal, Sri Lanka, Pakistan, Bhutan |
| `JPN` | Japan | Japan |
| `SKT` | South Korea | South Korea |
| `ANZ` | Australia and New Zealand | Australia, New Zealand |
| `USA` | United States | United States |
| `CAN` | Canada | Canada |
| `LAM` | Latin America | Argentina, Venezuela, Colombia, Peru, Trinidad and Tobago,<br>Ecuador, Guatemala, Cuba, Bolivia, Dominican Republic, Honduras,<br>Paraguay, Uruguay, Costa Rica, El Salvador, Haiti, Panama,<br>Nicaragua, Jamaica, Curaçao, Suriname, Antigua and Barbuda,<br>Aruba, Bahamas, Barbados, Belize, Bermuda,<br>British Virgin Islands, Cayman Islands, Dominica,<br>Falkland Islands (Malvinas), French Guiana, Grenada,<br>Guadeloupe, Cooperative Republic of Guyana, Martinique,<br>Montserrat, Puerto Rico, Saba, Saint Eustatius,<br>Saint Kitts and Nevis, Saint Lucia,<br>Saint Pierre and Miquelon, Saint Vincent and the Grenadines,<br>Sint Maarten, Turks and Caicos Islands |
| `BRA` | Brazil | Brazil |
| `MEX` | Mexico | Mexico |
| `CHL` | Chile | Chile |
| `ENE` | Non-EU Eastern Europe | Ukraine, Belarus, Serbia, Bosnia and Herzegovina,<br>Moldova, Republic of North Macedonia, Kosovo,<br>Albania, Montenegro |
| `ENW` | Non-EU Western Europe | Norway, Switzerland, Iceland,<br>United Kingdom, Gibraltar |
| `EUE` | Eastern European Union | Poland, Czech Republic, Romania, Hungary, Bulgaria,<br>Slovakia, Croatia, Lithuania, Slovenia, Estonia, Latvia |
| `EUW` | Western European Union | Germany, Netherlands, Belgium, Sweden,<br>Austria, Finland, Denmark, Ireland, Luxembourg |
| `EUM` | Mediterranean European Union | France, Italy, Spain, Greece,<br>Portugal, Cyprus, Malta |
| `MEA` | Middle East (Gulf States) | Iran, Saudi Arabia, United Arab Emirates, Iraq,<br>Qatar, Kuwait, Oman, Bahrain, Yemen |
| `MDA` | Mediterranean Asia | Turkey, Israel, Syrian Arab Republic,<br>Jordan, Lebanon |