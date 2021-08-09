source("./scripts/supplementary_tables/general.R")

reference_table_reviews <- summary_reviews %>%
  select(1:5, 10) %>%
  unite(col = "reference", c(authors, year), sep = " ") %>%
  arrange(reference)

.reference_reviews_ft <- flextable(reference_table_reviews, cwidth = c(1.9, 1, 3.5, 0.8, 3.5)) 
.reference_reviews_ft <-  bg(.reference_reviews_ft, bg = "#45ADA8", part = "header")
.reference_reviews_ft <- .reference_reviews_ft %>%
  bold(part = "header") %>%
  bold(j = 1, part = "body") %>%
  color(color = "white", part = "header") %>%
  set_header_labels(reference = "References",
                    design = "Design", 
                    purpose = "Purpose of the review",
                    studies_included = "Number of included studies",
                    findings = "Key findings") %>%
  hline(j = 1:5, border = .borders, part = "body") %>%
  align(align = "center", j= 4, part = "body") %>%
  align(align = "center", j= 1:5, part = "header") %>%
  vline(j = 1:4, border = .borders, part = "body") %>%
  hline_bottom(border = .outer.border, part = "body") %>%
  border_outer(border = .outer.border, part = "header") %>%
  fontsize(size = 9, part = "body")

.reference_reviews_ft <- set_caption(.reference_reviews_ft, 
                             "Reference table of the included reviews",
                             autonum = .supp_autonum)

