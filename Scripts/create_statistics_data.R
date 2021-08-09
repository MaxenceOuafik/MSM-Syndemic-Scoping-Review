.statistics_data <- summary_quantitative %>%
  select(1:3, 259:274, 276:278) %>%
  unite(col = "author_year", c(authors, year), sep = " ") %>%
  unite(col = "reference", c(author_year, letter), sep = "", na.rm = TRUE) 

.N_latent <- sum(!is.na(.statistics_data$LCA_LPA)) +
  sum(!is.na(.statistics_data$EFA)) +
  sum(!is.na(.statistics_data$CFA)) + 
  sum(!is.na(.statistics_data$LTA))

.N_additivity <- sum(!is.na(.statistics_data$RERI)) +
  sum(!is.na(.statistics_data$product_term))

.score_data <- .statistics_data %>%
  unite(col = "statistics", 2:20, sep = ", ", na.rm = TRUE) %>%
  filter(statistics == "score")