library(flextable)
library(officer)

measurement <- summary_quantitative %>%
  select (c(1:3, 57:179))
measurement <- measurement %>%
  unite(col = "author_year", c(authors, year), sep = " ") %>%
  unite(col = "reference", c(author_year, letter), sep = "", na.rm = TRUE)

.borders <- fp_border(color = "grey", style = "dotted", width = 1)
.big.border <- fp_border(color = "#45ADA8", style = "solid", width = 2)
.outer.border <- fp_border(color = "#45ADA8", style = "solid", width = 2.5)


.supp_autonum <- run_autonum(
  seq_id = "table",
  pre_label = "Table S",
  post_label = ": ",
  bkm = NULL,
  bkm_all = FALSE,
  prop = NULL
)


