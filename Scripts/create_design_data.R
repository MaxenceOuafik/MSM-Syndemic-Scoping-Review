library(tidyverse)
design_data <- overview_of_studies %>%
  select(design) %>%
  group_by(design) %>%
  summarise(Studies = n()) %>% 
  ungroup()
