year_country <- overview_of_studies %>%
  select(year, location) %>%
  group_by(year, location) %>%
  summarise(studies_location = n()) %>% 
  ungroup() %>%
  drop_na() %>%
  group_by(location) %>%
  mutate(cumulative_location = cumsum(studies_location))

year_continent <- overview_of_studies %>%
  select(year, location) %>%
  drop_na()
year_continent$continent <- ifelse(grepl(c("USA|Canada"), year_continent$location), "North America", 
ifelse(grepl(c("China|India|Malaysia|Taiwan|Thailand|Vietnam"), year_continent$location), "Asia", 
ifelse(grepl(c("Belgium|England|Netherlands|Portugal|Sweden"), year_continent$location), "Europe",
ifelse(grepl(c("Latin America|Mexico"), year_continent$location), "South America", 
ifelse(grepl(c("Nigeria|South Africa"), year_continent$location), "Africa", "International"
       ))))) 
year_continent <- year_continent%>%
  group_by(year, continent) %>%
  summarise(studies_continent = n()) %>%
  ungroup() %>%
  group_by(continent) %>%
  mutate(cumulative_continent = cumsum(studies_continent))




.North_America_studies <- max(year_continent$cumulative_continent[year_continent$continent == "North America"])
.USA_studies <- max(year_country$cumulative_location[year_country$location == "USA"])

.Asia_studies <- max(year_continent$cumulative_continent[year_continent$continent == "Asia"])

.Europe_studies <- max(year_continent$cumulative_continent[year_continent$continent == "Europe"])

.South_America_studies <- max(year_continent$cumulative_continent[year_continent$continent == "South America"])

.Africa_studies <- max(year_continent$cumulative_continent[year_continent$continent == "Africa"])
