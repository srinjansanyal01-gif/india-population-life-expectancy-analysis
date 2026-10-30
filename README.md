# india-population-life-expectancy-analysis
Time Series Analysis and Forecasting of India's Population Density and Life Expectancy (1970–2022)
# Relationship Between Population Density and Life Expectancy of India (1970–2022)

## Project Overview

This project focuses on the time series analysis of India's Population Density and Life Expectancy from 1970 to 2022.

The study examines historical trends, tests the stationarity of the time series, applies appropriate transformations, and develops forecasting models to predict future trends.

## Objectives

- Analyze the historical trends in India's population density and life expectancy.
- Examine stationarity using the Augmented Dickey-Fuller (ADF) test.
- Apply logarithmic transformation and differencing.
- Study autocorrelation using ACF and PACF plots.
- Develop ARIMA-based forecasting models.
- Compare ARIMA with Holt's Exponential Smoothing method.
- Evaluate forecasting performance using Mean Squared Error (MSE).

## Dataset

- Country: India
- Time period: 1970–2022
- Variables:
  - Year
  - Population Density
  - Life Expectancy

### Data Sources
- [World Bank Open Data](https://databank.worldbank.org/reports.aspx?source=2&country=IND)
- [Kaggle – Population of India](https://www.kaggle.com/datasets/amritharj/population-of-india-19502022)

## Methodology

1. Exploratory Data Analysis
2. Time Series Visualization
3. Augmented Dickey-Fuller (ADF) Test
4. Log Transformation and Differencing
5. ACF and PACF Analysis
6. ARIMA Model Development
7. Holt's Exponential Smoothing
8. Forecast Accuracy Evaluation using MSE

## Key Findings

- Population density and life expectancy showed upward trends over the study period.
- Both original time series were found to be non-stationary.
- Stationarity was achieved after log transformation and differencing.
- The study used third-order differencing for population density and second-order differencing for life expectancy.
- Forecasts were generated for 2023–2042.
- ARIMA produced lower MSE than Holt's method for both variables in the reported comparison.

## Tools and Technologies

- R Programming
- ggplot2
- tseries
- zoo
- forecast
- Time Series Analysis
- Statistical Forecasting

## Project Report

The complete B.Sc. project report is available in the `report/` directory.

## Author

**Srinjan Sanyal**

B.Sc. Honours in Statistics  
Department of Statistics  
Visva-Bharati

---

*Academic project on statistical time series analysis and forecasting.*
