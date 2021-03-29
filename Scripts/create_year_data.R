year_data <- overview_of_studies %>%
  select(year) %>%
  group_by(year) %>%
  summarise(Studies = n()) %>% 
  ungroup() %>%
  mutate(Cumulative = cumsum(Studies))
