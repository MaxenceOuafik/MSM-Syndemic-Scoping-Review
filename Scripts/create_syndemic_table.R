source("./scripts/supplementary_tables/general.R")

.synd.cond.table <- nodes %>%
  select(label_full, studies, category) %>%
  relocate("label_full", .before = "category") %>%
  relocate("studies", .after = "category") %>%
  arrange(desc(studies))

.synd.cond.ft <- flextable(.synd.cond.table, cwidth = c(2.2, 1.2, 0.8))
.synd.cond.ft <- bg(.synd.cond.ft, bg = "#45ADA8", part = "header")
.synd.cond.ft <- .synd.cond.ft %>%
  bold(part = "header") %>%
  bold(j = 3, part = "body") %>%
  color(color = "white", part = "header") %>%
  set_header_labels(label_full = "Name of the syndemic condition",
                    category = "Category",
                    studies = "Number of studies") %>%
  hline(j = 1:3, border = .borders, part = "body") %>%
  align(align = "center", j=2:3, part = "body") %>%
  hline_bottom(border = .outer.border, part = "body") %>%
  border_outer(border = .outer.border, part = "header") 
  

  
