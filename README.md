# SQL_World_life_expectancy_project 

## Project Overview
This project analyzes the World Life Expectancy dataset using SQL. The work focuses on data cleaning and exploratory data analysis (EDA) to answer several questions related to global life expectancy. The analysis began by loading the dataset and checking for missing values, followed by cleaning the data and exploring trends and patterns across countries and years.

---

## Dataset
- An existing dataset was used for this analysis, with no additional table creation required.
- World Life Expectancy dataset.
- Country-level life expectancy data for multiple countries from 2007 to 2022.

---

## Project Scope
- Data loading and inspection.  
- Data cleaning.
- Exploratory data analysis (EDA).  
- Insight generation using SQL queries.

---

## Data Cleaning
- Checked for missing and null values.  
- Identified duplicate and inconsistent records. 
- Addressed missing data using SQL techniques.  

---

## Exploratory Data Analysis (EDA).
- Analyzed life expectancy trends over time.  
- Compared life expectancy across countries.  

---

## Analysis & Insights

### Q1: Life Expectancy Change by Country (2007–2022)
This analysis examines the change in life expectancy for each country between 2007 and 2022 by comparing the minimum and maximum recorded values. Countries with missing or zero values were excluded to ensure accurate comparisons.

The results show substantial variation in life expectancy gains across countries. The largest increase observed was approximately **28.7 years** in Haiti, while the smallest positive change was around **1.3 years** in Guyana. These findings highlight significant disparities in health progress, with some countries experiencing major improvements in longevity while others saw only modest gains over the 15-year period.

---

### Q2: Global Life Expectancy Trends (2007–2022)
The analysis of global average life expectancy by year reveals a steady upward trend from 2007 to 2019, increasing from **66.75 years** to **70.92 years**. This growth reflects long-term improvements in healthcare, living standards, and disease prevention worldwide.

In 2020, a noticeable decline in average life expectancy is observed, corresponding to the global impact of the COVID-19 pandemic. The data then shows a strong recovery in 2021 and 2022, with life expectancy rising to **71.62 years**, surpassing pre-pandemic levels. These results demonstrate both sustained long-term progress and the short-term vulnerability of global health outcomes to major global events.

---

### Q3: GDP and Life Expectancy

#### GDP and Life Expectancy Correlation
The analysis indicates a positive correlation between GDP and life expectancy across countries. Nations with higher GDP levels generally exhibit longer average life expectancy, suggesting that greater economic resources are associated with improved healthcare access, living conditions, and overall quality of life.

While GDP alone does not fully explain differences in life expectancy, the results show that economic strength plays a meaningful role in shaping population health outcomes.

#### Life Expectancy by GDP Group
Countries were grouped into high-GDP and low-GDP categories using a defined GDP threshold. The average life expectancy for high-GDP countries was approximately **74.2 years**, compared to **64.7 years** for low-GDP countries.

This nearly **10-year difference** highlights the strong association between economic capacity and population health, reinforcing the observed relationship between GDP and life expectancy.

---

### Q4: Life Expectancy by Development Status
The analysis reveals a substantial difference in average life expectancy between developed and developing countries. Developed nations have an average life expectancy of approximately **79.2 years**, while developing nations average **66.8 years**.

This gap of over **12 years** underscores the influence of development-related factors such as healthcare infrastructure, economic stability, education, and access to essential services on population health outcomes.

---

## Conclusion
The analysis highlights global inequalities in life expectancy and demonstrates the importance of data cleaning before analysis. SQL proved effective for identifying data quality issues and uncovering meaningful patterns. While the dataset provides valuable insights, further analysis could benefit from additional health, economic, or regional data.

---
