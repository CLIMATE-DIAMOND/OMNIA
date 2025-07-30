# Heating and Cooling Demand Profiles for OMNIA Regions

## Overview

This project processes global hourly seasonal data on residential **space heating (SH)**, **water heating (WH)**, and **space cooling (SC)** to generate regional demand profiles for the **OMNIA model**. The source data includes country-level, 24-hour demand profiles across up to **9 energy intensity zones** per country, based on the paper:

> Sachs et al., 2019 – “Clustered spatially and temporally resolved global heat and cooling energy demand in the residential sector”  
> DOI: [10.1016/j.apenergy.2019.05.011](https://doi.org/10.1016/j.apenergy.2019.05.011)

## What at the end is used as OMNIA input
The output from the code was used to create the tables PofilesSHWHSC.xlsx in this folder, then you can find the profiles that are actaually used as input to OMNIA in OMNIA-main > SuppXLs > Scen_00_DataByTimeslice_20 in the tab Dem_Fractions. 
 
## Input Data

- **Source CSV**: `mmc1.csv` (Supplementary data 1)
- **Data includes**: SH, WH, SC hourly profiles for 165 countries in 9 intensity zones
- **Zones grouped**:
  - Low energy (LE): bands 1–7
  - High energy (HE): bands 7–9

## Temporal Structure of the Data

### 📅 Seasons  
The dataset defines **4 seasons**, each covering **3 months**, starting in **December**:

| Season   | Months            | Label |
|----------|-------------------|-------|
| Winter   | Dec–Jan–Feb       | S1    |
| Spring   | Mar–Apr–May       | S2    |
| Summer   | Jun–Jul–Aug       | S3    |
| Autumn   | Sep–Oct–Nov       | S4    |

This seasonal breakdown is consistent across all countries and follows the format shown in **Figure 9** of Sachs et al. (2019).

### ⏰ Hours  
Each day has **24 hourly values**, with:

| Hour | Time (GMT)            |
|------|------------------------|
| 1    | 00:00–01:00 (midnight) |
| ...  | ...                    |
| 24   | 23:00–00:00            |

All timestamps are in **GMT**, and values represent **average hourly demand**.## Processing Steps

1. **Normalization**: Raw data in MWh/km² is normalized to reflect energy use trends only.
2. **Zone Aggregation**: Countries are grouped by LE/HE energy zones.
3. **OMNIA Mapping**:
   - Uses `OMNIA_regions_adopted.xlsx` to assign each country to one of the OMNIA macro-regions.
4. **Time Aggregation**:
   - Original 96 time-slices per day are collapsed to 5 daily slices × 4 seasons = **20 OMNIA time-slices**.
5. **Heating Types**:
   - SH and WH are combined into one “Thermal Uses” profile (labelled **SHWH**) to match OMNIA input needs.

## Main Script

- **File**: `Heating_Cooling_Distribution_output_last.m`
- This MATLAB script processes the SHWH and SC profiles and outputs OMNIA-ready tables.

## Output Files

- Saved as `.mat` tables:
  - `Slc_RegionProfiles24h_SHWH_S1` to `S4`: Thermal use (heating) profiles per season
  - `Slc_RegionProfiles24h_SC_S1` to `S4`: Cooling profiles per season
- Output includes **summary tables** to support data understanding and validation.

## Directory Structure

```
/SHWH & SC profiles for HE and LE zones/
│
├── SHWH_distribution.csv
├── SC_distribution.csv
├── OMNIA_regions_adopted.xlsx
├── Heating_Cooling_Distribution_output_last.m
└── Output: Slc_RegionProfiles24h_*.mat
```

## Notes

- SHWH and SC tables are used in OMNIA input, where SH includes both space and water heating.
- Profiles are normalized (unitless) and reflect hourly demand shape across seasons and intensity zones.
- The coverage includes 165 countries (99.96% of global demand), mapped into OMNIA regions.

---

