source("./scripts/supplementary_tables/general.R")

.depression_measurement <- measurement %>%
  select(1:4) %>%
  filter (!is.na(depression_scale)) %>%
  add_count(depression_scale, name = "type_n") %>%
  add_count(depression_scale_criteria, name = "scale_n") %>%
  arrange(desc(depression_scale), desc(scale_n), depression_scale_criteria, depression_cutoff,  ) %>%
  relocate("type_n", .after = "depression_scale") %>%
  relocate("scale_n", .after = "depression_scale_criteria") %>%
  relocate("reference", .after = "depression_cutoff")


.pal_type_dep <- col_numeric(
  palette = c("transparent", "#9DE0AD"),
  domain = c(0, max(.depression_measurement$type_n)+1)) 

.pal_scale_dep <- col_numeric(
  palette = c("transparent", "#9DE0AD"),
  domain = c(0, max(.depression_measurement$scale_n)+1)) 

.depression_ft <- flextable(.depression_measurement, cwidth = c(0.7, 0.8, 1.8, 1, 1, 2))

.depression_ft <- bg(.depression_ft, bg = "#45ADA8", part = "header")
.depression_ft <- bg(.depression_ft, bg = .pal_type_dep, j = 2, part = "body")
.depression_ft <- bg(.depression_ft, bg = .pal_scale_dep, j = 4, part = "body")
.depression_ft <- .depression_ft %>%
  bold(part = "header") %>%
  bold(j = 6, part = "body") %>%
  color(color = "white", part = "header") %>%
  set_header_labels(depression_scale = "Use of a scale or a criteria", 
                    type_n = "Number of studies", 
                    depression_scale_criteria = "Scale or criteria used",
                    scale_n = "Number of studies",
                    depression_cutoff = "Cutoff used",
                    reference = "References") %>%
  merge_v(j = c(1, 2, 3), part = "body") %>%
  merge_at(j = 4, i = 1:24, part = "body") %>%
  merge_at(j = 4, i = 25:34, part = "body") %>%
  merge_at(j = 4, i = 35:42, part = "body") %>%
  merge_at(j = 4, i = 43:47, part = "body") %>%
  merge_at(j = 4, i = 48:51, part = "body") %>%
  merge_at(j = 4, i = 52:54, part = "body") %>%
  merge_at(j = 4, i = 55:57, part = "body") %>%
  merge_at(j = 4, i = 58:59, part = "body") %>%
  merge_at(j = 4, i = 60:61, part = "body") %>%
  merge_at(j = 4, i = 67:69, part = "body") %>%
  merge_at(j = 4, i = 70:71, part = "body") %>%
  merge_at(j = 4, i = 72:73, part = "body") %>%
  merge_at(j = 5, i = 1:11, part = "body") %>%
  merge_at(j = 5, i = 1:11, part = "body") %>%
  merge_at(j = 5, i = 13:20, part = "body") %>%
  merge_at(j = 5, i = 22:24, part = "body") %>%
  merge_at(j = 5, i = 25:34, part = "body") %>%
  merge_at(j = 5, i = 35:38, part = "body") %>%
  merge_at(j = 5, i = 40:41, part = "body") %>%
  merge_at(j = 5, i = 45:47, part = "body") %>%
  merge_at(j = 5, i = 52:54, part = "body") %>%
  merge_at(j = 5, i = 56:57, part = "body") %>%
  merge_h_range(i = 66:76, j1 = 3, j2=5, part = "body") %>%
  hline(j = 3, border = .borders, part = "body") %>%
  hline(j = 5:6, border = .borders, part = "body") %>%
  hline(i = 65, border = .big.border, part = "body") %>%
  align(align = "center", j=1:5, part = "body") %>%
  vline(j = 5, border = .borders, part = "body") %>%
  align(align = "right", j = 6, part = "body") %>%
  hline_bottom(border = .outer.border, part = "body") %>%
  border_outer(border = .outer.border, part = "header") %>%
  fix_border_issues(part = "all")

.depression_ft <- set_caption(.depression_ft, 
                              "Summary of the studies including depression or depressive symptoms as a syndemic condition and the criteria used to screen this condition",
                              autonum = .supp_autonum)