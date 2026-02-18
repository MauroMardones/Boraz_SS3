#  **Stock Assessment of Boraz in Portuguese Waters**

## Project Overview

This repository contains the stock assessment framework for *Boraz* in Portuguese waters, developed using **Stock Synthesis 3 (SS3)**.

The objective of the project is to evaluate population status, historical dynamics, and management reference points through an age/length-structured assessment model, integrating fishery-dependent data and alternative structural hypotheses.

The repository is structured to ensure reproducibility, version control of model configurations, and transparency in analytical workflows.

---

## Analytical Framework

The assessment is built using:

* **Stock Synthesis 3 (SS3)** as the core assessment engine
* **R** for data preparation, model execution, diagnostics, and visualization
* Structured model folders containing only the core SS3 input files required for full reproducibility

---

## Repository Structure

```text
Boraz_SS3/

├── data/
├── docs/
│   └── Boraz_SS3.Rmd
├── code/
│   └── Boraz_SS3.R
├── executable/
├── figs/
├── models/
```

- `data/` Raw and processed data files (not tracked in Git)  
- `docs/` Documentation and reports  
- `Boraz_SS3.Rmd` R Markdown file used to run the assessment and generate the PDF report  
- `code/` R scripts for data processing, model execution, and diagnostics  
- `Boraz_SS3.R` Main script used to run the assessment and generate outputs  
- `executable/` SS3 executable (not tracked in Git)  
- `figs/` Generated figures and plots (not tracked in Git)  
- `models/` Alternative SS3 model configurations (version-controlled)  

---

## Models Directory

The `models/` directory contains the alternative SS3 configurations evaluated in the Boraz stock assessment. Each folder corresponds to a specific structural hypothesis tested during the benchmarking and sensitivity analysis process.

```text
models/
├── Benchmark_Model
├── Basecase_TVsel2018_Polyonly_h06_Mat5-2024length_newCPUEpoly
├── Basemodel_newCPUEpoly_6years_raw
├── Basemodel_newCPUEpoly_6years_ajus
├── Basemodel_newCPUEpoly_ajus
├── Basemodel_newCPUEpoly_raw
└── Basemodel_newCPUEpoly_sel-blocks
```

---

### Scenario Descriptions

**Benchmark Model**
Benchmark configuration derived from the model benchmarking process, including the original polyvalent CPUE index and the observed length compositions for both the polyvalent and trawl fleets.

**Basecase_TVsel2018_Polyonly_h06_Mat5-2024length_newCPUEpoly**
Benchmark configuration updated with the revised polyvalent CPUE index.

**Basemodel_newCPUEpoly_6years_raw**
Scenario including the revised polyvalent CPUE index and six years of empirical length-frequency data for the polyvalent fleet.

**Basemodel_newCPUEpoly_6years_ajus**
Scenario including the revised polyvalent CPUE index and six years of length-frequency data fitted using theoretical length distribution estimation for the polyvalent fleet.

**Basemodel_newCPUEpoly_ajus**
Extension of the previous scenario to the full estimated length time series (2009-2024) for the polyvalent fleet.

**Basemodel_newCPUEpoly_raw**
Extension of the empirical length-frequency data to the full time series (2009-2024) for the polyvalent fleet.

**Basemodel_newCPUEpoly_sel-blocks**
Scenario including time blocks in selectivity to account for regulatory changes in minimum legal size, specifically the increase to 33 cm implemented in 2019.

---

Within each scenario folder, only the four core SS3 input files are version-controlled:

* `starter.ss`
* `forecast.ss`
* `sbr_ctl.ss`
* `sbr_dat.ss`


All derived outputs (`.rep`, `.std`, `.par`, `.log`, etc.) are excluded from version control to maintain a clean and reproducible structure.

---

## How to Run the Assessment

1. Place the appropriate SS3 executable inside `executable/`
2. Select the desired model directory
3. Run the assessment from `Boraz_SS3.R` (simpler) or `Boraz_SS3.Rmd` to execute the model and generate diagnostics and figures.
4. Outputs will be generated locally (not tracked in Git)

---
