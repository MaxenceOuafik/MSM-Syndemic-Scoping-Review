year_design <- overview_of_studies %>%
  select(year, design) 
year_design$design <- ifelse(grepl(c("Case series|Cross-sectional"), year_design$design), "Cross-sectional", 
                           ifelse(grepl(c("Intact group design|Pretest-posttest nonequivalent groups design|Randomized controlled trials"), year_design$design), "Interventional",
                                  ifelse(grepl(c("Meta-analysis|Systematic review"), year_design$design), "Systematic reviews, meta-analyses",
                                         ifelse(grepl("Mixed", year_design$design), "Mixed",
                                                ifelse(grepl(c("Longitudinal|Population-based cohort study"), year_design$design), "Longitudinal", 
                                                       ifelse(grepl("Qualitative", year_design$design), "Qualitative", "Other"
                                                       ))))))
year_design <- year_design %>%
  group_by(year, design) %>%
  summarise(Studies = n()) %>% 
  ungroup() %>%
  group_by(design) %>%
  mutate(cumulative = cumsum(Studies))

# This data frame corresponds to the numbers and cumulative 
# numbers of studies by type, in order to create the plot used in the paper. 
# To improve readability of the plot , we decided to merge some of the design, 
# using a mix of  ifelse function and grepl function. Case series was merged with 
# cross-sectional  because we only had one case-series in our review (Tan et al. 2016)
# and because this study also had a cross-sectional part. 

N_cross_sec <- max(year_design$cumulative[year_design$design == "Cross-sectional"])
N_long <- max(year_design$cumulative[year_design$design == "Longitudinal"])
N_qual <- max(year_design$cumulative[year_design$design == "Qualitative"])
N_int <- max(year_design$cumulative[year_design$design == "Interventional"])
N_SR <- max(year_design$cumulative[year_design$design == "Systematic reviews, meta-analyses"])
