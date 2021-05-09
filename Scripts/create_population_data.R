.population_qualitative <- summary_qualitative %>%
  select(subpopulation, authors, year)

.population_quantitative <- summary_quantitative %>%
  select(subpopulation, authors, year)

population <- bind_rows(.population_quantitative, .population_qualitative) %>%
  mutate (ref = paste(authors, year)) %>%
  select(-authors, -year)

population$age <- ifelse(grepl("AMSM", population$subpopulation), "Adolescent",
                         
                         ifelse(grepl("YMSM|HIV+YMSM|YBMSM", population$subpopulation), "Young adult", 
                                ifelse(grepl("HIVOMSM", population$subpopulation), "Older men", "Various age"
                                )))

population$race_ethnicity <- ifelse(grepl("BMSM", population$subpopulation), "Black",
                                    ifelse(grepl("LMSM", population$subpopulation), "Latino",
                                           ifelse(grepl("LB_MSM", population$subpopulation), "Latino & Black", "Various race/ethnicity"
                                           )))
population$serologic_status <- ifelse(grepl("HIV", population$subpopulation), "HIV-positive", "Mostly HIV-negative")
population$sex_work <- ifelse(grepl("SW", population$subpopulation), "Sex workers", "Mostly no sex-work engagement")
population$sex_behav <- ifelse(grepl("MSMW", population$subpopulation), "MSMW", "Mostly MSM")
population$gender_identity <- ifelse(grepl("TMSM", population$subpopulation), "Transgender", "Cisgender")

disaggregated <- summary_quantitative %>%
  select(disaggregated_logical, disaggregated, authors, year) %>%
  mutate(ref = paste(authors, year)) %>%
  select(-authors, year)

.N_YBMSM <- sum(population$race_ethnicity == "Black" & population$age == "Young adult")
.N_MSM_SW <- sum(population$race_ethnicity == "Black" & population$sex_work == "Sex workers")
.N_LMSMW <- sum(population$race_ethnicity == "Latino" & population$sex_behav == "MSMW")

.N_disaggregated <- sum(disaggregated$disaggregated_logical == "Yes", na.rm = TRUE)
.N_dis_BMSMW <- sum(disaggregated$disaggregated_logical == "Yes" & disaggregated$disaggregated == "BMSMW_dis", na.rm = TRUE)
.N_dis_HIVMSM <- sum(disaggregated$disaggregated_logical == "Yes" & disaggregated$disaggregated == "HIVMSM_dis", na.rm = TRUE)
.N_dis_LBMSM <- sum(disaggregated$disaggregated_logical == "Yes" & disaggregated$disaggregated == "LBMSM", na.rm = TRUE)
.N_dis_MSMW <- sum(disaggregated$disaggregated_logical == "Yes" & disaggregated$disaggregated == "MSMW_dis", na.rm = TRUE)
