source("./scripts/supplementary_tables_general.R")

.anxiety_measurement <- measurement %>%
  filter(!is.na(anxiety_type)) %>%
  select(c(1, 42:45, 47:56)) %>%
  unite(col = disorder, 2:5, sep = ", ", na.rm = T) %>%
  unite(col = criteria, 3:11, sep = ", ", na.rm = T) %>%
  add_count(disorder, name = "disorder_n") %>%
  add_count(criteria, name = "criteria_n") %>%
  relocate("reference", .after = "anxiety_cutoff_period") %>%
  relocate("disorder_n", .after = "disorder") %>%
  relocate("criteria_n", .after = "criteria") %>%
  arrange(desc(disorder_n), desc(criteria_n))


.pal_type_anxiety <- col_numeric(
  palette = c("transparent", "#9DE0AD"),
  domain = c(0, max(.anxiety_measurement$disorder_n)+1)) 

.pal_scale_anxiety <- col_numeric(
  palette = c("transparent", "#9DE0AD"),
  domain = c(0, max(.anxiety_measurement$criteria_n)+1)) 

.anxiety_ft <- flextable(.anxiety_measurement, cwidth = c(1.3, 0.8, 1.6, 0.8, 0.8, 2))
.anxiety_ft <- bg(.anxiety_ft, bg = "#45ADA8", part = "header")
.anxiety_ft <- bg(.anxiety_ft, bg = .pal_type_anxiety, j = 2, part = "body")
.anxiety_ft <- bg(.anxiety_ft, bg = .pal_scale_anxiety, j = 4, part = "body")
.anxiety_ft <- .anxiety_ft %>%
  bold(part = "header") %>%
  bold(j = 6, part = "body") %>%
  color(color = "white", part = "header") %>%
  set_header_labels(disorder = "Type of anxiety disorder screened, if specified", 
                    disorder_n = "Number of studies", 
                    criteria = "Criteria or scale used",
                    criteria_n = "Number of studies",
                    anxiety_cutoff_period = "Reference period or cutoff used",
                    reference = "References") %>%
  merge_v(j = c(1:3, 5), part = "body") %>%
  merge_at(j = 4, i = 1:2, part = "body") %>%
  merge_at(j = 4, i = 6:9, part = "body") %>%
  merge_at(j = 4, i = 10:11, part = "body") %>%
  merge_at(j = 4, i = 13:14, part = "body") %>%
  hline(j = c(1,3), border = .borders, part = "body") %>%
  hline(j = 5:6, border = .borders, part = "body") %>%
  align(align = "center", j=1:5, part = "body") %>%
  vline(j = 5, border = .borders, part = "body") %>%
  align(align = "right", j = 6, part = "body") %>%
  hline_bottom(border = .outer.border, part = "body") %>%
  border_outer(border = .outer.border, part = "header") %>%
  fix_border_issues(part = "all")
.anxiety_ft <- set_caption(.anxiety_ft, 
                       "Summary of the studies including anxiety as a syndemic condition and the criteria used to screen this condition",
                       autonum = .supp_autonum)