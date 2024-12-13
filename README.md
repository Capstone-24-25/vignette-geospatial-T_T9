# Analyzing Travel Mode Choices in California Using Geographically Weighted Regression (GWR)

## Overview

This project delves into the spatial relationship between **population density** and **travel mode choices** (walking, biking, driving alone, etc.) in counties across California. Using **Geographically Weighted Regression (GWR)**, we uncover how these relationships vary across regions, offering insights into local dynamics that static models might miss.

---

## Objectives

- **Primary Goal**: Investigate how **population density** influences travel mode choices in California.
- **Specific Aims**:
  1. Examine spatial nonstationarity in the relationship between population density and travel modes.
  2. Highlight regions where population density most significantly impacts choices like walking or biking.
  3. Provide an intuitive framework for implementing GWR in similar studies.

---

## Methodology

This vignette is structured as a tutorial and research tool, demonstrating:
1. **Data Collection**: 
   - **Travel data** from the 2017 National Household Travel Survey (NHTS).
   - **Geographic boundaries** for California counties.
2. **Data Preprocessing**:
   - Cleaning and aligning datasets for compatibility with GWR methods.
3. **Geographically Weighted Regression**:
   - Explores regional variations using GWR to model local relationships.
4. **Visualization**:
   - Heatmaps and regression plots for intuitive spatial understanding.

---

## Data Sources

1. **National Household Travel Survey (NHTS)**  
   *(2017 California data)*  
   [View dataset](https://nhts.dot.ca.gov/)

2. **California Geographic Boundaries**  
   *(Spatial shapefiles for counties)*  
   [View dataset](https://catalog.data.gov/dataset/ca-geographic-boundaries)

---

## Repository Structure

- **`data/`**: Includes raw and cleaned datasets.  
- **`script/`**: Contains R scripts for GWR analysis, data preprocessing, and visualization.  
- **`img/`**: Generated plots, maps, and other visualizations.  

---

## Why Geographically Weighted Regression?

Unlike traditional regression models that assume a uniform relationship across all regions, **GWR** recognizes that **spatial context matters**. For example:
- Population density might encourage biking in urban hubs like Los Angeles but discourage it in suburban counties.  
- Walking may thrive in areas with dense local services but decline in remote regions.

**Key Insight**: GWR models these nuances, empowering policymakers with localized strategies.

---
## Results Highlights

1. **Regional Insights**:
   - High population density areas (e.g., Bay Area) show a stronger inclination toward walking and biking.
   - Low-density regions favor driving alone, reflecting the urban-rural divide.

2. **Model Performance**:
   - GWR outperforms standard regression by capturing spatial variability, providing tailored policy insights.

---

## Contributors

This project is a collaborative effort by:
- Sophie Shi
- Jiahui He
- Xiaofeng Cai
- Jiajia Feng
- Liuqian Bao

*Conducted as part of the Fall 2024 PSTAT197A course at UCSB.*

---

## References

1. **2017 National Household Travel Survey, California Data**  
   *(California-specific travel behavior data)*  
   [Access dataset](https://nhts.dot.ca.gov/)

2. **California Geographic Boundaries**  
   *(Spatial shapefiles for California counties)*  
   [Access dataset](https://catalog.data.gov/dataset/ca-geographic-boundaries)

3. **Brunsdon, C., Fotheringham, A. S., & Charlton, M. E.** (1996). Geographically weighted regression: A method for exploring spatial nonstationarity. *Geographical Analysis, 28*(4), 281–298.  
   [View paper](https://onlinelibrary.wiley.com/doi/10.1111/j.1538-4632.1996.tb00936.x)

4. **Charlton, M., & Fotheringham, A. S.** (2009). Geographically weighted regression. *[White Paper]*.  
   [View white paper](https://www.geos.ed.ac.uk/~gisteac/fspat/gwr/gwr_arcgis/GWR_WhitePaper.pdf)

---



