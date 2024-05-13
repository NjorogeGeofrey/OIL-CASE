
# Oil Case Analysis and World Development Indicators (WDI) Subset Analysis
## Project Description
This project involves the analysis of two datasets: the Oil Case dataset and a subset of the World Development Indicators (WDI) dataset. The goal is to perform statistical analysis, data visualization, and regression modeling to gain insights into factors related to oil production and development indicators.

## Technologies Used
R programming language
Libraries such as readxl, stargazer, ggplot2, tidyverse, plm, and lme4 for data manipulation, visualization, and regression modeling.
Oil Case Analysis
Data Import and Cleaning
The Oil Case dataset is imported and cleaned, ensuring correct variable formats.

## Summary Statistics
Descriptive statistics are generated for key variables using the stargazer package.

## Data Visualization
Histograms and bar charts are created to visualize oil production, net oil exports value, and oil availability.
Scatter plots and box plots are used to explore associations between variables like oil production, net oil exports, oil availability, and polity scores.
Linear Regression
Linear regression models are fitted to explore relationships between variables like polity scores and net oil exports value.

## Multiple Linear Regression
A multiple linear regression model is developed to analyze the combined effects of oil production, net oil exports, and oil availability on polity scores.

## WDI Subset Analysis
Data Import
A subset of the World Development Indicators dataset is imported for further analysis.

Summary Statistics
Descriptive statistics are calculated for selected indicators using the stargazer package.

Variance Analysis
Within-group and between-group variances are computed to understand the variability in birth rates across countries.

Panel Regression
Panel regression with fixed effects is performed using the plm package to analyze the relationship between GDP growth and birth rates.

Ordinary Least Squares (OLS) Regression
An OLS regression model is run to examine the relationship between GDP growth and birth rates in the WDI subset dataset.

## Installation Instructions
Clone the repository to your local machine.
Ensure you have R installed along with the required packages listed in the R scripts.
Run the provided R scripts in the specified order to perform data analysis, visualization, and regression modeling.

## Usage
Modify the scripts or add new analyses as needed for further exploration of the datasets.
Run the scripts in an R environment or IDE to execute the analyses and generate visualizations.
Results and Insights
The project provides insights into factors related to oil production, net oil exports, and their impact on polity scores.
It also explores development indicators and their relationship with birth rates using regression analysis.
