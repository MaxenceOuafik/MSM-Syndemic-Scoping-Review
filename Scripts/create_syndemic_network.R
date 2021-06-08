library(qgraph)

conditions <- summary_quantitative %>%
  select(11:56)

.idx <- t(combn(seq_along(conditions), 2))
.edgelist_cond <- lapply(1:nrow(.idx), function(i) conditions[, c(.idx[i, 1], .idx[i, 2])])
.edgelist_cond <- lapply(.edgelist_cond, setNames, c("ID1","ID2"))
.edgelist_cond <- do.call(rbind, .edgelist_cond)
.edgelist_cond <- .edgelist_cond[rowSums(is.na(.edgelist_cond))==0, ]

.cond1 <- .edgelist_cond %>%
  distinct(ID1) %>%
  rename(label = ID1)
.cond2 <- .edgelist_cond %>%
  distinct(ID2) %>%
  rename(label = ID2)
nodes <- full_join(.cond1, .cond2, by = "label") %>%
  rowid_to_column("id") 

nodes$category <- ifelse(grepl(c("depression|PTSD|suicide|sex_comp|anxiety|AUD|internalised_homophobia|substance_use_disorder|sleep_disturbance|subordination|esteem|hostility|impulsivity|hypersexuality|stress|escape|distress|ADHD|alexithymia|trauma"), nodes$label), "mental health",
                  ifelse(grepl(c("substance_use|IPV|binge|IDU|CSA|polysubstance|bullying|alcohol_use|exchange_sex|tobacco_use|sexual_risk|social_support|violence|loneliness|chemsex|childhood|venues"), nodes$label), "social",
                  ifelse(grepl(c("incarceration|unstable_housing|poverty|discrimination|unemployment|healthcare_access"), nodes$label), "structural", "physical health"
                  )))

nodes <- nodes %>%
  arrange(desc(label))

.studies_nodes <-  as_tibble(ifelse(!is.na(conditions), 1, 0)) %>%
  summarise_all(sum) %>%
  gather(var, value) %>%
  arrange(desc(var))%>%
  rename(label = var, "studies" = value)

nodes$studies <- .studies_nodes$studies
nodes$color <- ifelse(grepl("mental health", nodes$category), "#2364AA",
                 ifelse(grepl("social", nodes$category), "#73BFB8",
                 ifelse(grepl("structural", nodes$category), "#EA7317", 
                 ifelse(grepl("physical health", nodes$category), "#F15152", FALSE))))
nodes$frequency = nodes$studies/nrow(conditions) 

nodes <- nodes %>%
  arrange(id)
nodes$label_full <- c("Depression", "Substance use", "PTSD", "IPV", "Binge drinking",
                 "Suicidality", "Sexual compulsivity", "Anxiety", "IDU", 
                 "CSA", "Polysubstance use", "Bullying", "Alcohol Use Disorder",
                 "Internalised homophobia", "Incarceration", "Unstable housing",
                 "Poverty", "Alcohol use", "Exchange sex", "Discrimination", 
                 "Tobacco use", "Unemployment", "Poor healthcare access", 
                 "Sexual risk behaviors", "Substance use disorder", 
                 "Poor social support", "STI", "Violence", "Sleep disturbance",
                 "Loneliness", "Involuntary subordination", "Low self-esteem",
                 "Chemsex", "Cognitive escape", "ADHD", "HIV", "Hostility",
                 "Impulsivity", "Hypersexuality", "Stress", "Childhood abuse",
                 "Alexithymia", "Experience of trauma", "Poor physical health", 
                 "General mental distress", "Frequenting gay social venues")


.per_route <- .edgelist_cond %>%  
  group_by(ID1, ID2) %>%
  summarise(weight = n()) %>% 
  ungroup()

edges <- .per_route %>% 
  left_join(nodes, by = c("ID1" = "label")) %>% 
  rename(from = id) %>%
  left_join(nodes, by = c("ID2" = "label")) %>% 
  rename(to = id) %>%
  select(from, to, weight)

.mental <- nodes %>%
  filter(category == "mental health") 

.social <- nodes %>%
  filter(category == "social") 

.structural <- nodes %>%
  filter(category == "structural") 

.physical <- nodes %>%
  filter(category == "physical health")

.groups <- list()
.groups$mental <- .mental$id
.groups$social <- .social$id
.groups$structural <- .structural$id
.groups$physical <- .physical$id

.edge_colors <- edges %>%
  mutate(category =
           ifelse(edges$from %in% c(.groups$mental) & 
                    edges$to %in% c(.groups$mental), 
                  "psycho-psychological",
           ifelse((edges$from %in% c(.groups$mental) & 
             edges$to %in% c(.groups$social))|
                  (edges$from %in% c(.groups$social) &
                     edges$to %in% c(.groups$mental)), 
           "psycho-social", 
           ifelse((edges$from %in% c(.groups$mental) &
                   edges$to %in% c(.groups$structural))|
                    (edges$from %in% c(.groups$structural)&
                    edges$to %in% c(.groups$mental)), 
           "psycho-structural", 
           ifelse((edges$from %in% c(.groups$mental) &
                     edges$to %in% c(.groups$physical))|
                    (edges$from %in% c(.groups$physical)&
                    edges$to %in% c(.groups$mental)), 
           "psycho-biological", 
           ifelse(edges$from %in% c(.groups$social) & 
                   edges$to %in% c(.groups$social), 
                 "socio-social", 
           ifelse((edges$from %in% c(.groups$social) &
                   edges$to %in% c(.groups$structural))|
                   (edges$from %in% c(.groups$structural)&
                   edges$to %in% c(.groups$social)), 
                 "socio-structural",
           ifelse((edges$from %in% c(.groups$social) &
                     edges$to %in% c(.groups$physical))|
                    (edges$from %in% c(.groups$physical)&
                    edges$to %in% c(.groups$social)), 
           "socio-biological",
           ifelse(edges$from %in% c(.groups$structural) & 
                    edges$to %in% c(.groups$structural), 
                  "structuro-structural", 
           ifelse((edges$from %in% c(.groups$structural) &
                   edges$to %in% c(.groups$physical))|
                   (edges$from %in% c(.groups$physical)&
                   edges$to %in% c(.groups$structral)), 
                  "structuro-biological", 
           ifelse(edges$from %in% c(.groups$physical) & 
                  edges$to %in% c(.groups$physical), 
                  "biologico-biological", FALSE)))))))))))


.edge_colors$color <-
  ifelse(grepl("psycho-psychological", .edge_colors$category), 
         "#2364AA", 
  ifelse(grepl("psycho-social", .edge_colors$category),
          "#3DA5D9",
  ifelse(grepl("psycho-structural", .edge_colors$category),
          "#1C0B19",
  ifelse(grepl("socio-social", .edge_colors$category),
          "#73BFB8",
  ifelse(grepl("socio-structural", .edge_colors$category),
          "#FEC601",
  ifelse(grepl("structuro-structural", .edge_colors$category),
          "#EA7317", 
  ifelse(grepl("psycho-biological", .edge_colors$category),
          "#EDB183",
  ifelse(grepl("socio-biological", .edge_colors$category),
          "#8C4843",
  ifelse(grepl("structuro-biological", .edge_colors$category),
          "#F4D8CD",
  ifelse(grepl("biologico-biological", .edge_colors$category),
          "#F15152", FALSE))))))))))       

.groups_colors <- c("#2364AA", "#73BFB8", "#EA7317", "#F15152")

syndemic_network <- qgraph(edges,
                           directed = FALSE,
                           vsize = 4,
                           edge.color = .edge_colors$color,
                           pie = nodes$frequency,
                           color = .groups_colors,
                           minimum = 0,
                           layout = "spring",
                           groups = .groups,
                           borders = T,
                           border.color = nodes$color,
                           labels = TRUE,
                           nodeNames = nodes$label_full,
                           legend.cex = 0.3,
                           label.color = "white",
                           label.prop = 1,
                           cut = 0,
                           fade = TRUE,
                           filename = "./Output/Plots/syndemic_network",
                           filetype = "png")

