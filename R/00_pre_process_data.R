library(tidyverse)

# Objective: This script will prepare the full CTA ridership data for downstream analysis. 
# The processed data will be uploaded to GitHub to ensure others can reproduce the analysis.

# latest data pull 02-14-2024: https://data.cityofchicago.org/Transportation/CTA-Ridership-L-Station-Entries-Daily-Totals/5neh-572f/about_data
# data documents the daily ridership at each station
cta_data <- read.csv("data/20240214_CTA_ridership.csv")

# format date
cta_data <- cta_data %>% 
  mutate(date_format = as.Date(date, format = "%m/%d/%Y")) 

# filter data from 2019-present
cta_data_19 <- cta_data %>% 
  filter(date_format >= "2019-08-01")

# save processed data
write.csv(cta_data_19, file = "processed_data/2019_2024_cta_ridership_data.csv", row.names = FALSE)
