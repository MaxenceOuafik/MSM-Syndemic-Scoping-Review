.N_latent <- summary_quantitative %>%
  filter(summary_quantitative$LCA_LPA == "LCA_LPA" |
           summary_quantitative$EFA == "EFA"| 
           summary_quantitative$CFA == "CFA" | 
           summary_quantitative$LTA == "LTA") %>%
  nrow()

.N_additivity <- summary_quantitative %>%
  filter(summary_quantitative$RERI == "RERI" | 
           summary_quantitative$product_term == "product_term") %>%
  nrow()
  

.score_data <- summary_quantitative %>%
  select(263:278, 280:283) %>%
  unite(col = "statistics", 1:20, sep = ", ", na.rm = TRUE) %>%
  filter(statistics == "score") %>%
  nrow()
