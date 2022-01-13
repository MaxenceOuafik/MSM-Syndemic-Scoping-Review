source("./scripts/supplementary_tables/general.R")


.IPV_measurement <- measurement %>%
  select(c(1, 25:35)) %>%
  filter(!is.na(IPV_type)) %>%
  add_count(IPV_type, name = "type_n") %>%
  unite(col = IPV_scale_criteria, 3:11, sep = ", ", na.rm = T) %>%
  add_count(IPV_scale_criteria, name = "criteria_n") %>%
  relocate("type_n", .after = "IPV_type") %>%
  relocate("criteria_n", .after = "IPV_scale_criteria") %>%
  relocate("reference", .after = "IPV_cutoff_period") %>%
  arrange(desc(type_n), desc(criteria_n), desc(IPV_scale_criteria), desc(IPV_cutoff_period))


.IPV_prevalence <- list()
for (i in 26:30) {
  .IPV_prevalence$sum[[i-25]] <- sum(!is.na(measurement[i]))
  .IPV_prevalence$perc[[i-25]] <-  percent(sum((!is.na(measurement[i]))/sum(!is.na(measurement$IPV_type))))
  names(.IPV_prevalence[["sum"]])[[i-25]] <- names(measurement[i])
  names(.IPV_prevalence[["perc"]])[[i-25]] <- names(measurement[i])
}
.IPV_prevalence$footer <- c(paste0("Physical intimate partner violence: ", 
                                  .IPV_prevalence[["sum"]][["physical IPV"]],
                                  " studies ; ", 
                                  .IPV_prevalence[["perc"]][["physical IPV"]],
                                  " of studies with IPV as a syndemic condition"),
                           paste0("Psychological intimate partner violence: ",
                                  .IPV_prevalence[["sum"]][["psychological IPV"]],
                                  " studies ; ",
                                  .IPV_prevalence[["perc"]][["psychological IPV"]],
                                  " of studies with IPV as a syndemic condition"),
                           paste0("Sexual intimate partner violence: ",
                                  .IPV_prevalence[["sum"]][["sexual IPV"]],
                                  " studies ; ",
                                  .IPV_prevalence[["perc"]][["sexual IPV"]],
                                  " of studies with IPV as a syndemic condition"),
                           paste0("Gay-related intimate partner violence: ",
                                  .IPV_prevalence[["sum"]][["gay-related IPV"]],
                                  " studies ; ",
                                  .IPV_prevalence[["perc"]][["gay-related IPV"]],
                                  " of studies with IPV as a syndemic condition"),
                           paste0("HIV-related intimate partner violence: ",
                                  .IPV_prevalence[["sum"]][["HIV-related IPV"]],
                                  " studies ; ",
                                  .IPV_prevalence[["perc"]][["HIV-related IPV"]],
                                  " of studies with IPV as a syndemic condition"))


.pal_type_IPV <- col_numeric(
  palette = c("transparent", "#9DE0AD"),
  domain = c(0, max(.IPV_measurement$type_n)+1)) 

.pal_scale_IPV <- col_numeric(
  palette = c("transparent", "#9DE0AD"),
  domain = c(0, max(.IPV_measurement$criteria_n)+1)) 


.IPV_ft <- flextable(.IPV_measurement, cwidth = c(0.8, 0.8, 1.7, 1, 1, 2))

.IPV_ft <- bg(.IPV_ft, bg = "#45ADA8", part = "header")
.IPV_ft <- bg(.IPV_ft, bg = .pal_type_IPV, j = 2, part = "body")
.IPV_ft <- bg(.IPV_ft, bg = .pal_scale_IPV, j = 4, part = "body")
.IPV_ft <- .IPV_ft %>%
  bold(part = "header") %>%
  bold(j = 6, part = "body") %>%
  color(color = "white", part = "header") %>%
  set_header_labels(IPV_type = "Use of a scale or a criteria", 
                    type_n = "Number of studies", 
                    IPV_scale_criteria = "Type(s) of violence screened or scale used",
                    criteria_n = "Number of studies",
                    IPV_cutoff_period = "Reference period or cutoff used",
                    reference = "References") %>%
  add_footer_lines(values = .IPV_prevalence[["footer"]]) %>%
  merge_v(j = c(1, 2, 3, 5), part = "body") %>%
  merge_at(j = 4, i = 1:14, part = "body") %>%
  merge_at(j = 4, i = 15:22, part = "body") %>%
  merge_at(j = 4, i = 23:29, part = "body") %>%
  merge_at(j = 4, i = 30:35, part = "body") %>%
  merge_at(j = 4, i = 36:37, part = "body") %>%
  merge_at(j = 4, i = 38:39, part = "body") %>%
  merge_at(j = 4, i = 41:43, part = "body") %>%
  merge_at(j = 4, i = 44:46, part = "body") %>%
  hline(j = 3, border = .borders, part = "body") %>%
  hline(j = 5:6, border = .borders, part = "body") %>%
  hline(i = 40, border = .big.border, part = "body") %>%
  align(align = "center", j=1:5, part = "body") %>%
  vline(j = 5, border = .borders, part = "body") %>%
  align(align = "right", j = 6, part = "body") %>%
  hline_bottom(border = .outer.border, part = "body") %>%
  border_outer(border = .outer.border, part = "header") %>%
  fix_border_issues(part = "all")

.IPV_ft <- set_caption(.IPV_ft, 
                       "Summary of the studies including intimate partner violence as a syndemic condition and the criteria used to screen this condition",
                       autonum = .supp_autonum)
