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
  merge_at(j = 4, i = 1:26, part = "body") %>%
  merge_at(j = 4, i = 27:37, part = "body") %>%
  merge_at(j = 4, i = 38:46, part = "body") %>%
  merge_at(j = 4, i = 47:51, part = "body") %>%
  merge_at(j = 4, i = 52:55, part = "body") %>%
  merge_at(j = 4, i = 56:58, part = "body") %>%
  merge_at(j = 4, i = 59:61, part = "body") %>%
  merge_at(j = 4, i = 62:63, part = "body") %>%
  merge_at(j = 4, i = 64:65, part = "body") %>%
  merge_at(j = 4, i = 71:73, part = "body") %>%
  merge_at(j = 4, i = 74:75, part = "body") %>%
  merge_at(j = 4, i = 76:77, part = "body") %>%
  merge_at(j = 5, i = 1:12, part = "body") %>%
  merge_at(j = 5, i = 14:21, part = "body") %>%
  merge_at(j = 5, i = 23:25, part = "body") %>%
  merge_at(j = 5, i = 27:37, part = "body") %>%
  merge_at(j = 5, i = 38:41, part = "body") %>%
  merge_at(j = 5, i = 43:45, part = "body") %>%
  merge_at(j = 5, i = 49:51, part = "body") %>%
  merge_at(j = 5, i = 56:58, part = "body") %>%
  merge_at(j = 5, i = 60:61, part = "body") %>%
  merge_h_range(i = 71:80, j1 = 3, j2=5, part = "body") %>%
  hline(j = 3, border = .borders, part = "body") %>%
  hline(j = 5:6, border = .borders, part = "body") %>%
  hline(i = 70, border = .big.border, part = "body") %>%
  align(align = "center", j=1:5, part = "body") %>%
  vline(j = 5, border = .borders, part = "body") %>%
  align(align = "right", j = 6, part = "body") %>%
  hline_bottom(border = .outer.border, part = "body") %>%
  border_outer(border = .outer.border, part = "header") %>%
  fix_border_issues(part = "all")

.depression_ft <- set_caption(.depression_ft, 
                              "Summary of the studies including depression or depressive symptoms as a syndemic condition and the criteria used to screen this condition",
                              autonum = .supp_autonum)