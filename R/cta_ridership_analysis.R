library(tidyverse)
library(ggplot2)

# Objective: Visualize the pre and post pandemic ridership trends of the Chicago Transit Authority

# latest data pull 02-14-2024: https://data.cityofchicago.org/Transportation/CTA-Ridership-L-Station-Entries-Daily-Totals/5neh-572f/about_data
# data documents the daily ridership at each station
cta_data <- read.csv("data/20240214_CTA_ridership.csv")

# format date
cta_data <- cta_data %>% 
  mutate(date_format = as.Date(date, format = "%m/%d/%Y")) 

# filter data from 2019-present
cta_data_19 <- cta_data %>% 
  filter(date_format >= "2019-08-01")

# identify most popular stations
station_counts <- cta_data_19 %>%  
  summarize(total_rides = sum(rides), .by=c(station_id, stationname)) %>% 
  arrange(desc(total_rides)) %>% 
  head(3)

# plot the ridership trends overtime
cta_rides <- ggplot(cta_data_19 %>% 
         filter(stationname %in% station_counts$stationname), 
       aes(x = date_format, y = rides, group = stationname, color = stationname)) +
  geom_smooth(method = "loess") +
  ylab("Daily Rides") +
  xlab("") +
  facet_wrap(~stationname, nrow = 5, scales = "free_y") +
  theme_bw() +
  theme(legend.position="none") 
  
# save 
ggsave(cta_rides, file = "results/figures/2019_2024_top_3_stations.png", height = 6, width = 6)

