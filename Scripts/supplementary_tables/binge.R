source("./scripts/supplementary_tables/general.R")

.binge_measurement <- measurement %>%
  select(c(1, 35:36)) %>%
  filter(!is.na(binge_episodes)) %>%
  add_count(binge_episodes, name = "episodes_n") %>%
  relocate("episodes_n", .after = "binge_episodes") %>%
  relocate("reference", .after = "binge_period") %>%
  arrange(desc(episodes_n), desc(binge_period))

.pal_type_binge <- col_numeric(
  palette = c("transparent", "#9DE0AD"),
  domain = c(0, max(.binge_measurement$episodes_n)+1)) 

.binge_ft <- flextable(.binge_measurement, cwidth = c(3, 0.8, 1.5, 2))

.binge_ft <- bg(.binge_ft, bg = "#45ADA8", part = "header")
.binge_ft <- bg(.binge_ft, bg = .pal_type_binge, j = 2, part = "body")
.binge_ft <- .binge_ft %>%
  bold(part = "header") %>%
  bold(j = 4, part = "body") %>%
  color(color = "white", part = "header") %>%
  set_header_labels(binge_episodes = "Number of episodes to qualify as binge drinking", 
                    episodes_n = "Number of studies", 
                    binge_period = "Reference period",
                    reference = "References") %>%
  merge_v(j = 1, part = "body") %>%
  merge_at(j = 2, i = 1:12, part = "body") %>%
  merge_at(j = 2, i = 13:16, part = "body") %>%
  merge_at(j = 2, i = 17:18, part = "body") %>%
  merge_at(j = 2, i = 19:20, part = "body") %>%
  merge_at(j = 3, i = 1:4, part = "body") %>%
  merge_at(j = 3, i = 5:9, part = "body") %>%
  merge_at(j = 3, i = 10:11, part = "body") %>%
  merge_at(j = 3, i = 13:14, part = "body") %>%
  merge_at(j = 3, i = 15:16, part = "body") %>%
  merge_at(j = 3, i = 17:18, part = "body") %>%
  merge_at(j = 3, i = 19:20, part = "body") %>%
  hline(j = c(1, 3:4), border = .borders, part = "body") %>%
  align(align = "center", j=1:4, part = "body") %>%
  vline(j = 3, border = .borders, part = "body") %>%
  align(align = "right", j = 4, part = "body") %>%
  hline_bottom(border = .outer.border, part = "body") %>%
  border_outer(border = .outer.border, part = "header") %>%
  fix_border_issues(part = "all")
.binge_ft <- set_caption(.binge_ft, 
                       "Summary of the studies including binge drinking as a syndemic condition and the criteria used to screen this condition",
                       autonum = .supp_autonum)