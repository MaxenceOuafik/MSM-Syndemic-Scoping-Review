reference_table_quantitative <- summary_quantitative %>%
  select(1:6, 8, 10, 11:56, 182:201, 252:254, 259:278, 285) 

# Human readable data for subpopulation
reference_table_quantitative[reference_table_quantitative == "AMSM"] <- "Adolescent MSM"
reference_table_quantitative[reference_table_quantitative == "BMSM"] <- "Black MSM"
reference_table_quantitative[reference_table_quantitative == "BMSM-SW"] <- "Black MSM engaged in sex work"
reference_table_quantitative[reference_table_quantitative == "HIVMSM"] <- "MSM living with HIV"
reference_table_quantitative[reference_table_quantitative == "HIVOMSM"] <- "Older MSM living with HIV"
reference_table_quantitative[reference_table_quantitative == "LMSM"] <- "Latino MSM"
reference_table_quantitative[reference_table_quantitative == "LMSMW"] <- "Latino Men who have Sex with Men and Women"
reference_table_quantitative[reference_table_quantitative == "MSM-SW"] <- "MSM engaged in sex work"
reference_table_quantitative[reference_table_quantitative == "MSM_CSA"] <- "MSM with a history of childhood sexual abuse"
reference_table_quantitative[reference_table_quantitative == "MSMW"] <- "Men who have Sex with Men and Women"
reference_table_quantitative[reference_table_quantitative == "TMSM"] <- "Transgender MSM"
reference_table_quantitative[reference_table_quantitative == "YMSM"] <- "Young MSM"
reference_table_quantitative[reference_table_quantitative == "BMSMW_dis"] <- "disagregated data for Black Men who have Sex with Men and Women"
reference_table_quantitative[reference_table_quantitative == "HIVMSM_dis"] <- "disagregated data for MSM living with HIV"
reference_table_quantitative[reference_table_quantitative == "LBMSM"] <- "disagregated data for Black & Latino MSM"
reference_table_quantitative[reference_table_quantitative == "MSMW_dis"] <- "disagregated data for Men who have Sex with Men and Women"

#Human readable data for syndemic conditions
reference_table_quantitative[reference_table_quantitative == "substance_use"] <- "substance use"
reference_table_quantitative[reference_table_quantitative == "binge"] <- "binge drinking"
reference_table_quantitative[reference_table_quantitative == "suicide"] <- "suicidality"
reference_table_quantitative[reference_table_quantitative == "sex_comp"] <- "sexual compulsivity"
reference_table_quantitative[reference_table_quantitative == "polysubstance"] <- "polysubstance use"
reference_table_quantitative[reference_table_quantitative == "internalised_homophobia"] <- "internalised homophobia"
reference_table_quantitative[reference_table_quantitative == "unstable_housing"] <- "unstable housing"
reference_table_quantitative[reference_table_quantitative == "alcohol_use"] <- "alcohol use"
reference_table_quantitative[reference_table_quantitative == "exchange_sex"] <- "exchange sex"
reference_table_quantitative[reference_table_quantitative == "tobacco_use"] <- "tobacco use"
reference_table_quantitative[reference_table_quantitative == "healthcare_access"] <- "poor healthcare access"
reference_table_quantitative[reference_table_quantitative == "sexual_risk"] <- "sexual risk behaviors"
reference_table_quantitative[reference_table_quantitative == "substance_use_disorder"] <- "substance use disorder"
reference_table_quantitative[reference_table_quantitative == "social_support"] <- "poor social support"
reference_table_quantitative[reference_table_quantitative == "sleep_disturbance"] <- "sleep disturbance"
reference_table_quantitative[reference_table_quantitative == "subordination"] <- "involuntary subordination"
reference_table_quantitative[reference_table_quantitative == "esteem"] <- "low self-esteem"
reference_table_quantitative[reference_table_quantitative == "escape"] <- "cognitive escape"
reference_table_quantitative[reference_table_quantitative == "binge"] <- "binge drinking"
reference_table_quantitative[reference_table_quantitative == "childhood"] <- "childhood abuse"
reference_table_quantitative[reference_table_quantitative == "trauma"] <- "experience of trauma"
reference_table_quantitative[reference_table_quantitative == "physical_health"] <- "poor physical health"
reference_table_quantitative[reference_table_quantitative == "distress"] <- "general mental distress"
reference_table_quantitative[reference_table_quantitative == "venues"] <- "frequenting gay social venues"

#Human readable data for outcomes
reference_table_quantitative[reference_table_quantitative == "outcome_adherence"] <- "adherence to antiviral medication"
reference_table_quantitative[reference_table_quantitative == "outcome_exchange_sex"] <- "engaging in exchange sex"
reference_table_quantitative[reference_table_quantitative == "outcome_sexual_risk"] <- "engaging in sexual risk behaviors"
reference_table_quantitative[reference_table_quantitative == "outcome_PrEP"] <- "PrEP-related outcomes"
reference_table_quantitative[reference_table_quantitative == "outcome_HIV"] <- "HIV diagnosis"
reference_table_quantitative[reference_table_quantitative == "outcome_VL"] <- "viral load"
reference_table_quantitative[reference_table_quantitative == "outcome_screening"] <- "HIV_screening"
reference_table_quantitative[reference_table_quantitative == "outcome_physical_activity"] <- "physical activity"
reference_table_quantitative[reference_table_quantitative == "outcome_healthcare"] <- "healthcare use"
reference_table_quantitative[reference_table_quantitative == "outcome_STI"] <- "STI diagnosis"
reference_table_quantitative[reference_table_quantitative == "outcome_HPA"] <- "dysregulation of the hypoathalamic-pituitary-adrenal axis"
reference_table_quantitative[reference_table_quantitative == "outcome_sexual_violence"] <- "having experienced sexual violence"
reference_table_quantitative[reference_table_quantitative == ""] <- ""
reference_table_quantitative[reference_table_quantitative == "outcome_glycemia"] <- "glycemic control"
reference_table_quantitative[reference_table_quantitative == "outcome_HIV_care"] <- "linkage to HIV care"
reference_table_quantitative[reference_table_quantitative == "outcome_suicide"] <- "suicidality"
reference_table_quantitative[reference_table_quantitative == "outcome_chemsex"] <- "engaging in chemsex"
reference_table_quantitative[reference_table_quantitative == "outcome_MSMW"] <- "having sex with both men and women"
reference_table_quantitative[reference_table_quantitative == "outcome_syndemic"] <- "syndemic conditions as the outcomes"
reference_table_quantitative[reference_table_quantitative == "outcome_help"] <- "help-seeking behaviors"
reference_table_quantitative[reference_table_quantitative == "outcome_substance"] <- "substance use"

#Human readable data for statistics
reference_table_quantitative[reference_table_quantitative == "score"] <- "regression analysis using a summation score"
reference_table_quantitative[reference_table_quantitative == "LCA_LPA"] <- "Latent Class Analysis/Latent Profile Analysis"
reference_table_quantitative[reference_table_quantitative == "RERI"] <- "Relative Excess Risk due to Interaction (RERI)"
reference_table_quantitative[reference_table_quantitative == "EFA"] <- "Exploratory Factor Analysis"
reference_table_quantitative[reference_table_quantitative == "network"] <- "Network Analysis"
reference_table_quantitative[reference_table_quantitative == "product_term"] <- "significant product term in regression"
reference_table_quantitative[reference_table_quantitative == "O_E"] <- "observed/expected ratio"
reference_table_quantitative[reference_table_quantitative == "moderation"] <- "moderation analysis"
reference_table_quantitative[reference_table_quantitative == "mediation"] <- "mediation analysis"
reference_table_quantitative[reference_table_quantitative == "SEM"] <- "Structural Equation Modeling"
reference_table_quantitative[reference_table_quantitative == "path"] <- "path analysis"
reference_table_quantitative[reference_table_quantitative == "CFA"] <- "Confirmatory Factor Analysis"
reference_table_quantitative[reference_table_quantitative == "cluster"] <- "cluster analysis"
reference_table_quantitative[reference_table_quantitative == "LTA"] <- "Latent Transition Analysis"
reference_table_quantitative[reference_table_quantitative == "linear"] <- "multivariate linear regression"
reference_table_quantitative[reference_table_quantitative == "Cox"] <- "Cox proportional hazards models"
reference_table_quantitative[reference_table_quantitative == "not_interaction"] <- "no interaction studied"
reference_table_quantitative[reference_table_quantitative == "hierarchical"] <- "hierarchical negative binomial regression"
reference_table_quantitative[reference_table_quantitative == "logistic"] <- "multivariate logistic regression"
reference_table_quantitative[reference_table_quantitative == "biserial"] <- "point-biserial correlation"


reference_table_quantitative <- reference_table_quantitative %>%
  unite(col = "author_year", c(authors, year), sep = " ") %>%
  unite(col = "reference", c(author_year, letter), sep = "", na.rm = TRUE) %>%
  unite(col = "design", c(design, 
                          design_comment, 
                          intervention_type, 
                          intervention_goal,
                          intervention_control), sep = " ", na.rm = TRUE) %>%
  unite(col = "subpopulation", c(subpopulation, disaggregated), sep = ", ", na.rm = TRUE) %>%
  unite(col = "syndemic_conditions", 5:50, sep = ", ", na.rm = TRUE) %>%
  unite(col = "outcomes", 6:25, sep = ", ", na.rm = TRUE) %>%
  unite(col = "statistics", 7:26, sep = ", ", na.rm = TRUE) %>%
  arrange(reference)

# Add footnote for PTSD, IPV, IDU, CSA, AUD, STI, ADHD

.reference_quantitative_ft <- flextable(reference_table_quantitative, cwidth = c(1.3, 0.8, 2, 1, 1.3, 1.3, 1, 2))

.reference_quantitative_ft <-  bg(.reference_quantitative_ft, bg = "#45ADA8", part = "header")
.reference_quantitative_ft <- .reference_quantitative_ft %>%
  bold(part = "header") %>%
  bold(j = 1, part = "body") %>%
  color(color = "white", part = "header") %>%
  set_header_labels(reference = "References",
                    location = "Location",
                    design = "Design",
                    subpopulation = "Subpopulation",
                    syndemic_conditions = "Syndemic conditions studied",
                    outcomes = "Outcomes",
                    statistics = "Statistics used to model interaction",
                    findings = "Key findings") %>%
  hline(j = 1:8, border = .borders, part = "body") %>%
  align(align = "center", j= 1:8, part = "header") %>%
  vline(j = 1:7, border = .borders, part = "body") %>%
  hline_bottom(border = .outer.border, part = "body") %>%
  border_outer(border = .outer.border, part = "header") %>%
  fontsize(size = 9, part = "body")

.reference_quantitative_ft <- set_caption(.reference_quantitative_ft, 
                                     "Reference table of the included quantitative studies",
                                     autonum = .supp_autonum)








