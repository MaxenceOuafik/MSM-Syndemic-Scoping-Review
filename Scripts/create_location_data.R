location_data <- overview_of_studies %>%
  select(location) %>%
  group_by(location) %>%
  summarise(Studies = n()) %>% 
  ungroup()
