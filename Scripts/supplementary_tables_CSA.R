source("./scripts/supplementary_tables_general.R")

.CSA_measurement <- measurement %>%
  select(c(1, 61:63)) %>%
  filter(!is.na(CSA_type)) %>%
  add_count(CSA_type, name = "type_n") %>%
  add_count(CSA_scale_criteria, name = "criteria_n") %>%
  relocate("type_n", .after = "CSA_type") %>%
  relocate("criteria_n", .after = "CSA_scale_criteria") %>%
  relocate("reference", .after = "CSA_cutoff") %>%
  arrange(desc(type_n), desc(criteria_n), desc(CSA_scale_criteria), desc(CSA_cutoff))

.pal_type_CSA <- col_numeric(
  palette = c("transparent", "#9DE0AD"),
  domain = c(0, max(.CSA_measurement$type_n)+1)) 

.pal_scale_CSA <- col_numeric(
  palette = c("transparent", "#9DE0AD"),
  domain = c(0, max(.CSA_measurement$criteria_n)+1)) 

.CSA_ft <- flextable(.CSA_measurement, cwidth = c(0.8, 0.8, 1.7, 1, 1, 2))

.CSA_ft <- bg(.CSA_ft, bg = "#45ADA8", part = "header")
.CSA_ft <- bg(.CSA_ft, bg = .pal_type_CSA, j = 2, part = "body")
.CSA_ft <- bg(.CSA_ft, bg = .pal_scale_CSA, j = 4, part = "body")
.CSA_ft <- .CSA_ft %>%
  bold(part = "header") %>%
  bold(j = 6, part = "body") %>%
  color(color = "white", part = "header") %>%
  set_header_labels(CSA_type = "Use of a scale or a criteria", 
                    type_n = "Number of studies", 
                    CSA_scale_criteria = "Scale or criteria used",
                    scale_n = "Number of studies",
                    criteria_n = "Number of studies",
                    CSA_cutoff = "Cutoff used",
                    reference = "References") %>%
  footnote(i = 1, j = 3, part = "header", 
           value = as_paragraph("Finkelhor definition : any sexual experience before 13 years old with someone at least 5 years older or any sexual experience between 13 and 17 years old with someone at least 10 years older (Finkelhor 1994)")) %>%
  merge_v(j = c(1:3, 5), part = "body") %>%
  merge_at(j = 4, i = 1:6, part = "body") %>%
  merge_at(j = 4, i = 7:12, part = "body") %>%
  merge_at(j = 4, i = 13:16, part = "body") %>%
  merge_at(j = 4, i = 17:18, part = "body") %>%
  merge_at(j = 4, i = 29:31, part = "body") %>%
  merge_at(j = 4, i = 32:33, part = "body") %>%
  merge_h_range(i = 1:28, j1 = 3, j2=5, part = "body") %>%
  hline(j = 3, border = .borders, part = "body") %>%
  hline(j = 5:6, border = .borders, part = "body") %>%
  hline(i = 28, border = .big.border, part = "body") %>%
  align(align = "center", j=1:5, part = "body") %>%
  vline(j = 5, border = .borders, part = "body") %>%
  align(align = "right", j = 6, part = "body") %>%
  hline_bottom(border = .outer.border, part = "body") %>%
  border_outer(border = .outer.border, part = "header") %>%
  fix_border_issues(part = "all")

.CSA_ft <- set_caption(.CSA_ft, 
                              "Summary of the studies including childhood sexual abuse as a syndemic condition and the criteria used to screen this condition",
                              autonum = .supp_autonum)
