library(readxl)
source("./scripts/supplementary_tables/general.R")

.PRISMA_Scr_Checklist <- read_excel("Files/PRISMA_Scr_Checklist.xlsx")
.PRISMA_FT <- flextable(.PRISMA_Scr_Checklist, cwidth = c(2, 0.5, 4.5, 0.9)) %>%
  border_inner(part="body", border = .borders) %>%
  border_outer(part="body", border = .big.border) %>%
  border_outer(part="header", border = .outer.border) %>%
  bg(part="header", bg="#45ADA8") %>%
  bold(part="header") %>%
  color(part="header", color="white") 

.PRISMA_ft <- set_caption(.CSA_ft, 
                          "Preferred Reporting Items for Systematic reviews and Meta-Analyses extension for Scoping Reviews (PRISMA-ScR) Checklist",
                       autonum = .supp_autonum)