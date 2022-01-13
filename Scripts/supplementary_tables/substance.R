source("./scripts/supplementary_tables/general.R")

.substance_measurement <- measurement %>%
  select(c(1, 5:14)) %>%
  filter(!is.na(substance_use_period)) %>%
  unite(col = substances, 2:10, sep = ", ", na.rm = T) %>%
  add_count(substances, name = "studies_n") %>%
  relocate("reference", .after = "substance_use_period") %>%
  relocate("studies_n", .after = "substances") %>%
  arrange(desc(studies_n), desc(substances), desc(substance_use_period))

.substances_prev <- list()
for (i in 5:12) {
  .substances_prev$sum[[i-4]] <- sum(!is.na(measurement[i]))  
  .substances_prev$perc[[i-4]] <- percent(sum((!is.na(measurement[i]))/sum(!is.na(measurement$substance_use_period)))) 
  names(.substances_prev[["sum"]])[[i-4]] <- names(measurement[i])
  names(.substances_prev[["perc"]])[[i-4]] <- names(measurement[i])
}
.substances_prev$footer <- c(paste0("Stimulants : cocaine/crack, amphetamine (", 
                                              .substances_prev[["sum"]][["stimulants"]],
                                              " studies ; ",
                                              .substances_prev[["perc"]][["stimulants"]],
                                              ")"),
                                       paste0("Ecstasy (", 
                                              .substances_prev[["sum"]][["ecstasy"]],
                                              " studies ; ",
                                              .substances_prev[["perc"]][["ecstasy"]],
                                              ")"),
                                       paste0("Hallucinogens : ketamine, psilocybine, phencyclidine (", 
                                              .substances_prev[["sum"]][["hallucinogens"]],
                                              " studies ; ",
                                              .substances_prev[["perc"]][["hallucinogens"]],
                                              ")"),
                                       paste0("Marijuana (", 
                                              .substances_prev[["sum"]][["marijuana"]],
                                              " studies ; ",
                                              .substances_prev[["perc"]][["marijuana"]],
                                              ")"),
                                       paste0("Depressants : GHB/GBL, benzodiazebines (", 
                                              .substances_prev[["sum"]][["depressants"]],
                                              " studies ; ",
                                              .substances_prev[["perc"]][["depressants"]],
                                              ")"),
                                       paste0("NPS : New Psychoactive Substances : synthetic cannabinoids, cathinones (", 
                                              .substances_prev[["sum"]][["NPS"]],
                                              " studies ; ",
                                              .substances_prev[["perc"]][["NPS"]],
                                              ")"),
                                       paste0("Opioids : opioids misuse, heroin (", 
                                              .substances_prev[["sum"]][["opioids"]],
                                              " studies ; ",
                                              .substances_prev[["perc"]][["opioids"]],
                                              ")"),
                                       paste0("Inhalants : nitrous oxyde, Popper : (", 
                                              .substances_prev[["sum"]][["inhalants"]],
                                              " studies ; ",
                                              .substances_prev[["perc"]][["inhalants"]],
                                              ")"))



.pal_type_substance <- col_numeric(
  palette = c("transparent", "#9DE0AD"),
  domain = c(0, max(.substance_measurement$studies_n)+1)) 

.substance_ft <- flextable(.substance_measurement, cwidth = c(3 ,0.8, 1.5,2))
.substance_ft <- bg(.substance_ft, bg = "#45ADA8", part = "header")
.substance_ft <- bg(.substance_ft, bg = .pal_type_substance, j = 2, part = "body")
.substance_ft <- .substance_ft %>%
  bold(part = "header") %>%
  bold(j = 4, part = "body") %>%
  color(color = "white", part = "header") %>%
  set_header_labels(substances = "Type of substances screened", 
                    studies_n = "Number of studies", 
                    substance_use_period = "Reference period",
                    reference = "References") %>%
  add_footer_lines(values = .substances_prev[["footer"]]) %>%
  merge_v(j = c(1, 3), part = "body") %>%
  merge_at(j = 2, i = 1:9, part = "body") %>%
  merge_at(j = 2, i = 10:13, part = "body") %>%
  merge_at(j = 2, i = 14:17, part = "body") %>%
  merge_at(j = 2, i = 18:20, part = "body") %>%
  merge_at(j = 2, i = 21:22, part = "body") %>%
  merge_at(j = 2, i = 23:24, part = "body") %>%
  merge_at(j = 2, i = 25:26, part = "body") %>%
  merge_at(j = 2, i = 27:28, part = "body") %>%
  hline(j = c(1, 3, 4), border = .borders, part = "body") %>%
  align(align = "center", j=1:4, part = "body") %>%
  vline(j = 3, border = .borders, part = "body") %>%
  align(align = "right", j = 4, part = "body") %>%
  hline_bottom(border = .outer.border, part = "body") %>%
  border_outer(border = .outer.border, part = "header") %>%
  fix_border_issues(part = "all")

.substance_ft <- set_caption(.substance_ft, 
                       "Summary of the studies including substance use as a syndemic condition and the substances specifically screened in the studies",
                       autonum = .supp_autonum)
