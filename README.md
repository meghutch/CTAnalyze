# CTAnalyze

## Objective

This repository hosts data and code to evaluate the Chicago Transit Authority's ridership trends from 2019 - 2023.

## Perform the Analysis

This respository can be copied and run locally. 

Clone this repository to your local system by pasting the following into your terminal/shell:

````
git clone https://github.com/meghutch/CTAnalyze.git
````

Alternatively, follow these instructions for [setting up git in Rstudio](https://gge-ucd.github.io/R-DAVIS/setting_up_git.html).

## Directory Structure

```
├── README.md                         <- You are here
|
├── data/
│   ├── README.txt                    <- README documenting raw data extraction process
|
├── processed_data/                   <- Folder containing the pre-processed data files
|   ├── 2019_2023_cta_ridership_data.csv   <- Pre-processed data to be used for analysis 
|
├── R/                                <- Scripts to perform the analysis
|   ├── 00_pre_process_data.R         <- Script to pre-process the raw dataset by date to reduce the file size to the subset of data we want to analyze
|   ├── 01_cta_ridership_analysis.R   <- Script to perform the primary analysis of the ridership trends in the top 3 most frequently visted CTA Stations
|
├── results/figures/                  <- Folder to store analysis results and figures
|   ├── 2019_2023_top_3_stations.png  <- Figure depicting the ridership trends from pre and post pandemic.
    

```

## Run Analysis

To reproduce the analysis: 

1. Review the `data/README.txt` and download the raw data from the [Chicago Data Portal](https://data.cityofchicago.org/Transportation/CTA-Ridership-L-Station-Entries-Daily-Totals/5neh-572f/about_data) 

2. Pre-process the raw data using `R/00_00_pre_process_data.R.

3. Next, run `R/01_cta_ridership_analysis.R` to run the analysis.

## Results / Output

The output of the analysis will identify the CTA stations with the most riders from August 2019 - October 2023. This will be as a figure in `results/figures/2019_2023_top_3_stations.png`



