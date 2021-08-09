source("./scripts/supplementary_tables/general.R")

.violence_measurement <- measurement %>%
  select(c(1, 18:23)) %>%
  filter(!is.na(violence_period)) %>%
  unite(col = violence_criteria, 2:6, sep = ", ", na.rm = T) %>%
  add_count(violence_criteria, name = "criteria_n") %>%
  relocate("criteria_n", .after = "violence_criteria") %>%
  relocate("reference", .after = "violence_period") %>%
  arrange(desc(criteria_n), desc(violence_criteria), desc(violence_period))


.violence_prevalence <- list()
for (i in 18:22) {
  .violence_prevalence$sum[[i-17]] <- sum(!is.na(measurement[i]))
  .violence_prevalence$perc[[i-17]] <-  percent(sum((!is.na(measurement[i]))/sum(!is.na(measurement$IPV_type))))
  names(.violence_prevalence[["sum"]])[[i-17]] <- names(measurement[i])
  names(.violence_prevalence[["perc"]])[[i-17]] <- names(measurement[i])
}
.violence_prevalence$footer <- c(paste0("Physical violence: ", 
                                   .violence_prevalence[["sum"]][["physical"]],
                                   " studies ; ", 
                                   .violence_prevalence[["perc"]][["physical"]],
                                   " of studies with violence as a syndemic condition"),
                            paste0("Psychological violence: ",
                                   .violence_prevalence[["sum"]][["psychological"]],
                                   " studies ; ",
                                   .violence_prevalence[["perc"]][["psychological"]],
                                   " of studies with violence as a syndemic condition"),
                            paste0("Sexual violence: ",
                                   .violence_prevalence[["sum"]][["sexual"]],
                                   " studies ; ",
                                   .violence_prevalence[["perc"]][["sexual"]],
                                   " of studies with violence as a syndemic condition"),
                            paste0("Physical harassment by the Police: ",
                                   .violence_prevalence[["sum"]][["physical harassment by police"]],
                                   " studies ; ",
                                   .violence_prevalence[["perc"]][["physical harassment by police"]],
                                   " of studies with violence as a syndemic condition"),
                            paste0("Sexual harassment by the Police: ",
                                   .violence_prevalence[["sum"]][["sexual harassment by police"]],
                                   " studies ; ",
                                   .violence_prevalence[["perc"]][["sexual harassment by police"]],
                                   " of studies with violence as a syndemic condition"))


.pal_type_violence <- col_numeric(
  palette = c("transparent", "#9DE0AD"),
  domain = c(0, max(.violence_measurement$criteria_n)+1)) 

.violence_ft <- flextable(.violence_measurement, cwidth = c(3, 0.8, 1.5, 2))

.violence_ft <- bg(.violence_ft, bg = "#45ADA8", part = "header")
.violence_ft <- bg(.violence_ft, bg = .pal_type_violence, j = 2, part = "body")
.violence_ft <- .violence_ft %>%
  bold(part = "header") %>%
  bold(j = 4, part = "body") %>%
  color(color = "white", part = "header") %>%
  set_header_labels(violence_criteria = "Type(s) of violence screened",
                    criteria_n = "Number of studies",
                    violence_period_period = "Reference period or cutoff used",
                    reference = "References") %>%
  add_footer_lines(values = .violence_prevalence[["footer"]]) %>%
  merge_v(j = c(1,3), part = "body") %>%
  merge_at(j = 2, i = 1:5, part = "body") %>%
  merge_at(j = 2, i = 6:9, part = "body") %>%
  merge_at(j = 2, i = 10:11, part = "body") %>%
  merge_at(j = 2, i = 12:13, part = "body") %>%
  hline(j = c(1, 3,4), border = .borders, part = "body") %>%
  align(align = "center", j=1:4, part = "body") %>%
  vline(j = 3, border = .borders, part = "body") %>%
  align(align = "right", j = 4, part = "body") %>%
  hline_bottom(border = .outer.border, part = "body") %>%
  border_outer(border = .outer.border, part = "header") %>%
  fix_border_issues(part = "all")
.violence_ft <- set_caption(.violence_ft, 
                       "Summary of the studies including violence as a syndemic condition and the criteria used to screen this condition",
                       autonum = .supp_autonum)


