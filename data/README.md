# Dataset Documentation

This folder contains the original demographic dataset and the processed dataset used for the time series analysis of India's population density and life expectancy.

## Files

| File | Description |
|---|---|
| `original_india_demographic_data.csv` | Original dataset containing 23 demographic variables for India from 1950 to 2022. |
| `india_population_life_expectancy.csv` | Processed dataset containing Year, Population Density, and Life Expectancy from 1970 to 2022. |

## Data Preparation

The processed dataset was extracted from the original dataset by selecting the following variables:

- Year
- Population Density
- Life Expectancy

The analysis was restricted to the period 1970–2022 to match the scope of the project.

## Data Sources

- [World Bank Open Data](https://databank.worldbank.org/reports.aspx?source=2&country=IND)
- [Kaggle – Population of India](https://www.kaggle.com/datasets/amritharj/population-of-india-19502022)

## Usage

The processed CSV file is used in the R scripts for exploratory data analysis, stationarity testing, ARIMA modelling, and forecasting.
