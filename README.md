# Analyzing Travel Mode Choices in California Using Geographically Weighted Regression (GWR)

## Overview

This project explores the spatial relationship between **population density** and **travel mode choices** (e.g., walking, biking, driving alone) across California counties. By employing **Geographically Weighted Regression (GWR)**, the study reveals how these relationships vary regionally, offering nuanced insights into local dynamics that static models may overlook.

---

## Objectives

- **Primary Goal**: Assess the influence of **population density** on travel mode choices in California.
- **Specific Aims**:
  1. Identify spatial nonstationarity in the relationship between population density and travel modes.
  2. Pinpoint regions where population density has the most significant effects on choices like walking or biking.
  3. Provide a practical framework for using GWR in similar research contexts.

---

## Methodology

This project serves as both a tutorial and a research case study, with the following components:
1. **Data Collection**: 
   - Travel behavior data from the 2017 National Household Travel Survey (NHTS).
   - Spatial shapefiles of California county boundaries.
2. **Data Preprocessing**:
   - Data cleaning and preparation to ensure compatibility with GWR methodologies.
3. **Geographically Weighted Regression**:
   - Analysis of regional variations to model localized relationships.
4. **Visualization**:
   - Intuitive spatial representations using heatmaps and regression plots.

---

## Data Sources

1. **National Household Travel Survey (NHTS)**  
   *(2017 California-specific data)*  
   [View dataset](https://nhts.dot.ca.gov/)

2. **California Geographic Boundaries**  
   *(Spatial shapefiles for counties)*  
   [View dataset](https://catalog.data.gov/dataset/ca-geographic-boundaries)

---

## Repository Structure

- **`Data/`**: Contains raw and cleaned datasets.
- **`script/`**: Includes R scripts for GWR analysis, data preprocessing, and visualization.
- **`vignette/`**: Documentation files including `.Rmd` and rendered `.html` for project insights and tutorials.
- **Root Files**:
  - `.gitignore`: Specifies files to be ignored by Git.
  - `README.md`: Project overview and instructions.
  - `.Rproj`: R project configuration file for easy environment setup.

---

## Why Geographically Weighted Regression?

Traditional regression models often assume uniform relationships across all regions, potentially missing critical local variations. **GWR** addresses this by incorporating spatial context, enabling a more nuanced understanding of regional dynamics. For example:
- High population density might encourage biking in urban areas like Los Angeles while discouraging it in suburban counties.
- Walking is likely to increase in areas with dense local services but may decline in more remote locations.

**Key Insight**: GWR captures these subtleties, empowering policymakers to develop tailored strategies for transportation planning.

---

## Results Highlights

1. **Regional Insights**:
   - Areas with high population density, such as the Bay Area, show a strong preference for walking and biking.
   - Low-density regions favor driving alone, underscoring the urban-rural divide in travel behaviors.

2. **Model Performance**:
   - GWR demonstrates superior performance over standard regression models by accounting for spatial variability and providing actionable, localized insights.

---

## Contributors

This project was developed collaboratively by:
- Sophie Shi
- Jiahui He
- Xiaofeng Cai
- Jiajia Feng
- Liuqian Bao

*This work was conducted as part of the Fall 2024 PSTAT197A course at UCSB.*

---

## References

1. **2017 National Household Travel Survey, California Data**  
   *(Comprehensive travel behavior data)*  
   [Access dataset](https://nhts.dot.ca.gov/)

2. **California Geographic Boundaries**  
   *(Shapefiles for spatial analysis)*  
   [Access dataset](https://catalog.data.gov/dataset/ca-geographic-boundaries)

3. **Brunsdon, C., Fotheringham, A. S., & Charlton, M. E.** (1996). Geographically weighted regression: A method for exploring spatial nonstationarity. *Geographical Analysis, 28*(4), 281–298.  
   [View paper](https://onlinelibrary.wiley.com/doi/10.1111/j.1538-4632.1996.tb00936.x)

4. **Charlton, M., & Fotheringham, A. S.** (2009). Geographically weighted regression. *[White Paper]*.  
   [View white paper](https://www.geos.ed.ac.uk/~gisteac/fspat/gwr/gwr_arcgis/GWR_WhitePaper.pdf)

5. **Kiani, et al.** (2024). *Mastering geographically weighted regression: Key considerations for building a robust model.* *Geospatial Health*.  
   [Access article](https://www.geospatialhealth.net/gh/article/view/1271/1365)
