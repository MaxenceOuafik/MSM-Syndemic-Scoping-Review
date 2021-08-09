# Reference table for qualitative data
reference_table_qualitative <- summary_qualitative %>%
  select(1:3, 6:12, 14, 17:18) 

# Human readable data for subpopulation 
reference_table_qualitative[reference_table_qualitative == "BMSM"] <- "Black MSM"
reference_table_qualitative[reference_table_qualitative == "YBMSM"] <- "Young Black MSM"
reference_table_qualitative[reference_table_qualitative == "HIV+YMSM"] <- "Young MSM living with HIV"
reference_table_qualitative[reference_table_qualitative == "LB_MSM"] <- "Latino & Black MSM"

# Human readable data for method
reference_table_qualitative[reference_table_qualitative == "thematic_content"] <- "thematic content analysis"
reference_table_qualitative[reference_table_qualitative == "thematic"] <- "thematic analysis"
reference_table_qualitative[reference_table_qualitative == "life_story"] <- "life story interview"
reference_table_qualitative[reference_table_qualitative == "cross_case"] <- "cross case analysis"
reference_table_qualitative[reference_table_qualitative == "framework"] <- "framework analysis"
reference_table_qualitative[reference_table_qualitative == "grounded"] <- "grounded theory"
reference_table_qualitative[reference_table_qualitative == "analytic_induction"] <- "analytic induction"


reference_table_qualitative <- reference_table_qualitative %>%
  unite(col = "reference", c(authors, year), sep = " ") %>% 
  unite(col = "method", 3:9, sep = ", ", na.rm = TRUE) %>%
  arrange(reference)

.reference_qualitative_ft <- flextable(reference_table_qualitative, cwidth = c(1.9, 1, 1.5, 0.8, 2, 3.5)) 
.reference_qualitative_ft <-  bg(.reference_qualitative_ft, bg = "#45ADA8", part = "header")
.reference_qualitative_ft <- .reference_qualitative_ft %>%
  bold(part = "header") %>%
  bold(j = 1, part = "body") %>%
  color(color = "white", part = "header") %>%
  set_header_labels(reference = "References",
                    location = "Location",
                    method = "Analysis method", 
                    subpopulation = "Subpopulation",
                    bio_social_interaction = "Bio-social interaction",
                    additional_framework = "Additional framework",
                    findings = "Key findings") %>%
  hline(j = 1:6, border = .borders, part = "body") %>%
  align(align = "center", j= 1:6, part = "header") %>%
  vline(j = 1:5, border = .borders, part = "body") %>%
  hline_bottom(border = .outer.border, part = "body") %>%
  border_outer(border = .outer.border, part = "header") %>%
  fontsize(size = 9, part = "body")


.reference_qualitative_ft <- set_caption(.reference_qualitative_ft, 
                                     "Reference table of the included qualitative studies",
                                     autonum = .supp_autonum)

