
# 📘 README: IMO_stat_calculations.xlsx

## 📂 File Name
`IMO_stat_calculations.xlsx`

## 📅 Source & Scope
This file contains processed 2019 data derived from **International Maritime Organization (IMO)** statistics. It presents a simplified categorization of **maritime energy consumption** into three main vessel types, aligned with use in the **OMNIA energy modeling framework**.

## 🎯 Purpose
The dataset is designed to support the **disaggregation of the navigation sector** within OMNIA, which models global energy systems. It simplifies detailed IMO ship-level data into three categories and estimates their energy shares, while aligning with OMNIA’s **Domestic vs. International (Bunkers)** energy split for maritime transport.

## 🧭 Simplified Vessel Categories

The original detailed IMO ship categories have been merged into:

| New Category    | Description                                                                 |
|----------------|-----------------------------------------------------------------------------|
| `Short-range`   | Smaller vessels, typically operating domestically or regionally; candidates for electrification or hydrogen-based propulsion. |
| `Long-range`    | Large ships including international freight carriers (e.g., container ships, bulk carriers, oil tankers). |
| `Passenger`     | Passenger-focused vessels, including ferries and cruise ships.              |

This classification was chosen to support technology-specific scenario development in OMNIA (e.g., electrification potential for short-range ships).

## 📊 File Structure

| Column Name                         | Description                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| `Category`                         | Merged ship category (`Short-range`, `Long-range`, `Passenger`)            |
| `2019 Total Energy [PJ]`          | Total energy consumption for each group in 2019, in petajoules             |
| `2019 Energy Share [%]`           | Share of total marine energy used by each category (%)                     |
| `Estimated Domestic Share [%]`     | Assumed share of each category's energy use allocated to **Domestic Shipping** |
| `Estimated Bunkers Share [%]`      | Assumed share of each category's energy use allocated to **International Shipping (Bunkers)** |
| `Notes`                            | Comments or assumptions relevant to each category                          |

## 📌 Key Assumptions

- Total maritime energy in 2019 is split among the three categories as follows (based on IMO data and your calculations):
  - **Short-range:** 85%
  - **Long-range:** 11%
  - **Passenger:** 4%

- OMNIA already separates **domestic** and **international** maritime energy. To remain consistent, assumptions were made to split each category accordingly.

- The domestic/international split per category is **not from IMO** but estimated by the analyst to ensure internal consistency with OMNIA’s aggregate totals.

- Short-range ships are more aligned with **domestic** activity; long-range with **international (bunkers)**.

## 🧩 How to Use in OMNIA

1. **Apply shares** to total maritime energy demand per OMNIA region.
2. **Disaggregate energy** by the three categories using the `2019 Energy Share [%]` column.
3. **Split energy** in each category into `Domestic` and `Bunkers` using the estimated share columns.
4. This allows assigning differentiated **technology pathways** to each segment (e.g., electrification for short-range ships).

## 📎 Notes
- Year covered: **2019**, suitable as a pre-COVID baseline.
- This simplification supports scenario modelling in OMNIA involving:
  - Decarbonization strategies for maritime transport.
  - Technology substitution analysis (e.g., electrification vs. liquid fuels).
- Assumptions should be revisited when newer IMO reports are published or when region-specific port data becomes available.

## Note
The Marine_efficiencies_code was not used at the end but can be used as a starting point by another user to calculate shares between different types of shipping so thats why it is kept.
