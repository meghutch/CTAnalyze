library(tidyverse)
library(ggplot2)

# Objective: Visualize the pre and post pandemic ridership trends of the Chicago Transit Authority

# load pre-processed data
cta_data_19 <- read.csv("processed_data/2019_2024_cta_ridership_data.csv")

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

