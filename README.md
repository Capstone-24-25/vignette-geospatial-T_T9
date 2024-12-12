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

## Contributors

This project is a collaborative effort by:
- Sophie Shi
- Jiahui He
- Xiaofeng Cai
- Jiajia Feng
- Liuqian Bao

*Conducted as part of the Fall 2024 PSTAT197A course at UCSB.*

---

---

# Vignette abstract

The goal of the vignette is analyze how population density influences travel mode choices, such as walking, biking, and driving alone, using travelling and population density data of counties in California. (Data source: ) We demonstrated how to use Geographically Weighted Regression (GWR) to explore the spatial variation in the relationship between population density and travel mode choices. Determine how the impact of population density on travel modes varies across regions.

# Repository contents

-data

-script

-img

---
## Reference list

1. 2017 National Household Travel Survey, California Data. 
   https://nhts.dot.ca.gov/

2. California Geographic Boundaries
  https://catalog.data.gov/dataset/ca-geographic-boundaries

3. Brunsdon C, Fotheringham AS, and Charlton ME. (1996). Geographically weighted regression: A method for exploring spatial nonstationarity. Geographical Analysis 28(4):281-298.
   https://onlinelibrary.wiley.com/doi/10.1111/j.1538-4632.1996.tb00936.x
  
4. Charlton M and Fotheringham AS. (2009). Geographically weighted regression. [White Paper]. https://www.geos.ed.ac.uk/~gisteac/fspat/gwr/gwr_arcgis/GWR_WhitePaper.pdf




