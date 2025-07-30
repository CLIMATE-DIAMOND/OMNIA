
**Repository for Data Inputs and Contributions to OMNIA (DIAMOND Project)**  
📅 **June 2024 – July 2025**  
👩‍🔬 Authors: Alessia Elia, Tommaso Pillon, Maria Ioanna Malliaroudaki  
📧 Contact: alessia.elia@e4sma.com, Tommaso.pillon@e4sma.com, m.malliaroudaki@imperial.ac.uk

---

## Overview  
This repository contains the documentation, datasets, and scripts developed to model the sectors in OMNIA, as part of the DIAMOND project (WP3). This work contributes to **Deliverable D3.9** and supports enhanced integration into global IAMs (WP3), with specific focus on circularity, land use, well-being, and consumption.
In this folder you can find any document (pdf, word, excel, scripts) shared by the owners showing useful information about

- The pipeline used to elaborate multiple the data inputs in OMNIA 1.0 model version
- Naming convention used in the model

---

## Repository Structure  

```bash
│Energy Balance
│Model Naming conventions
│OMNIA_RES_SRV_TRA/
  ├── Documentation RES_SRV_TRA
  │   │   ├── Documentation_RES_SRV_OMNIA/
  │   │   └── Documentation_TRA_OMNIA/
  ├── Residential_Sector/
  │   └── Codes_&_Data/
  │       ├── SHWH & SC profiles for HE and LE zones/
  ├── Transport_Sector/
      └── Codes_&_Data/
          ├── Navigation_IMO_data/
          └── Aviation_share_of_short_flights/
``` 	  └── Share public and privates/


## Components and Functions

### 1. 📁 `Energy Balance
Description of the pipeline to generate the final Energy Balance from UNSD sources`  

### 1. 📁 `Model Naming Convention`  
Description of the naming convention used in the model

### 1. 📁 `Documentation_RES_SRV_TRA/`  
General documentation hub for the work package components, including:

- **📄 Documentation_RES_SRV_OMNIA/**  
    Describes the modelling updates and data input and elaborations methodology for the **Residential, Services and transport** sectors, including:

### 2. 🏘️ `Residential_Sector/Codes_&_Data/`  

- **`SHWH & SC profiles for HE and LE zones/`**  
  Scripts and data for generating **Solar Hot Water Heating (SHWH)** and **Space Cooling (SC)** demand profiles.  
  These are split between High-Intensity (HE) and Low-Intensity (LE) energy use zones across OMNIA regions.

### 3. 🚛 `Transport_Sector/Codes_&_Data/`  

- **`Navigation (IMO data)/`**  
  Python/MATLAB scripts and IMO datasets for estimating maritime fuel demand based on:
  - Vessel types
  - Deadweight tonnage (DWT)
  - Fuel use per region

- **`Aviation - share of short flights/`**  
  Python code to:
  - Classify aviation routes as short-haul or long-haul
  - Estimate share of short flights in total air traffic
  - Support the regionalization of air travel emissions

---

## Acknowledgements  
This work was conducted by **Maria Ioanna Malliaroudaki** (m.malliaroudaki@imperial.ac.uk), Alessia Elia (alessia.elia@e4sma.com) and Tommaso Pillon (Tommaso.pillon@e4sma.com) between **June 2024 and July 2025** as part of the **OMNIA framework** under the **DIAMOND** project.

---

## License  
All code and documentation is subject to the terms of the DIAMOND project’s licensing agreements. (Open access)







