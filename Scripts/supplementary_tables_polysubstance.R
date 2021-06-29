source("./scripts/supplementary_tables_general.R")

.polysubstance_measurement <- measurement %>%
  select(c(1, 64:66)) %>%
  filter(!is.na(polysubstance_number)) %>%
  add_count(polysubstance_number, name = "number_n") %>%
  relocate("number_n", .after = "polysubstance_number") %>%
  relocate("reference", .after = "polysubstance_period") %>%
  arrange(desc(number_n), desc(polysubstance_marijuana), desc(polysubstance_period))

.pal_type_pol <- col_numeric(
  palette = c("transparent", "#9DE0AD"),
  domain = c(0, max(.polysubstance_measurement$number_n)+1)) 

.polysubstance_ft <- flextable(.polysubstance_measurement, cwidth = c(2.5, 0.8, 1, 1, 2))

.polysubstance_ft <- bg(.polysubstance_ft, bg = "#45ADA8", part = "header")
.polysubstance_ft <- bg(.polysubstance_ft, bg = .pal_type_pol, j = 2, part = "body")
.polysubstance_ft <- .polysubstance_ft %>%
  bold(part = "header") %>%
  bold(j = 5, part = "body") %>%
  color(color = "white", part = "header") %>%
  set_header_labels(polysubstance_number = "Number of substances to qualify as polysubstance use", 
                    number_n = "Number of studies", 
                    polysubstance_marijuana = "Inclusion of marijuana in the substances count",
                    polysubstance_period = "Reference period",
                    reference = "References") %>%
  merge_v(j = c(1:2, 4), part = "body") %>%
  merge_at(j = 3, i = 1:4, part = "body") %>%
  merge_at(j = 3, i = 5:16, part = "body") %>%
  merge_at(j = 3, i = 17:18, part = "body") %>%
  merge_at(j = 3, i = 19:25, part = "body") %>%
  hline(j = c(1, 3:5), border = .borders, part = "body") %>%
  align(align = "center", j=1:5, part = "body") %>%
  vline(j = 3:4, border = .borders, part = "body") %>%
  align(align = "right", j = 5, part = "body") %>%
  hline_bottom(border = .outer.border, part = "body") %>%
  border_outer(border = .outer.border, part = "header") %>%
  fix_border_issues(part = "all")
.polysubstance_ft <- set_caption(.polysubstance_ft, 
                       "Summary of the studies including polysubstance use as a syndemic condition and the criteria used to screen this condition",
                       autonum = .supp_autonum)