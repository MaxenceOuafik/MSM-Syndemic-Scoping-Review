detach("package:flextable", unload=TRUE)


.age_pop_plot <- ggplot(data = population, aes(x = fct_infreq(age))) +
  geom_bar(fill = c("#FE9666", "#A66999", "#FD625E", "#F2C80F")) +
  geom_text(stat='count', 
            aes(label=..count..), 
            vjust =-0.1,
            colour = c("#FE9666", "#A66999", "#FD625E", "#F2C80F"),
            fontface = "bold",
            cex = 3) + 
  xlab("Age group") +
  ylab("Number of studies") +
  labs(title = "Age groups of study participants") +
  font("title", size = 8, face = "bold") +
  font("xlab", size = 7) +
  font("ylab", size = 7) +
  font("xy.text", size = 6) +
  scale_y_continuous(expand = expansion(mult = 0.1), 
                     breaks = c(0,25,50,75,100))

.race_pop_plot <- ggplot(data = population, aes(x = fct_infreq(race_ethnicity))) +
  geom_bar(fill = c("#FE9666", "#A66999", "#FD625E", "#F2C80F")) +
  geom_text(stat='count', 
            aes(label=..count..), 
            vjust =-0.1,
            colour = c("#FE9666", "#A66999", "#FD625E", "#F2C80F"),
            fontface = "bold",
            cex = 3) + 
  xlab("Race/ethnicity") +
  ylab("Number of studies") +
  labs(title = "Races/ethnicities of study participants")+
  font("title", size = 8, face = "bold") +
  font("xlab", size = 7) +
  font("ylab", size = 7) +
  font("xy.text", size = 6) +
  scale_y_continuous(expand = expansion(mult = 0.1), 
                     breaks = c(0,25,50,75,100))

.sero_pop_plot <- ggplot(data = population, aes(x = fct_infreq(serologic_status))) +
  geom_bar(fill = c("#FE9666", "#A66999")) +
  geom_text(stat='count', 
            aes(label=..count..), 
            vjust =-0.1,
            colour = c("#FE9666", "#A66999"),
            fontface = "bold",
            cex = 3) + 
  xlab("Serologic status") +
  ylab("Number of studies") +
  labs(title = "Serologic status of study participants")+
  font("title", size = 8, face = "bold") +
  font("xlab", size = 7) +
  font("ylab", size = 7) +
  font("xy.text", size = 6) +
  scale_y_continuous(expand = expansion(mult = 0.1), 
                     breaks = c(0,25,50,75,100))

.SW_pop_plot <- ggplot(data = population, aes(x = fct_infreq(sex_work))) +
  geom_bar(fill = c("#FE9666", "#A66999")) +
  geom_text(stat='count', 
            aes(label=..count..), 
            vjust =-0.1,
            colour = c("#FE9666", "#A66999"),
            fontface = "bold",
            cex = 3) + 
  xlab("Sex work engagement") +
  ylab("Number of studies") +
  labs(title = "Sex work engagement of study participants")+
  font("title", size = 8, face = "bold") +
  font("xlab", size = 7) +
  font("ylab", size = 7) +
  font("xy.text", size = 6) +
  scale_y_continuous(expand = expansion(mult = 0.1), 
                     breaks = c(0,25,50,75,100))

.MSMW_pop_plot <- ggplot(data = population, aes(x = fct_infreq(sex_behav))) +
  geom_bar(fill = c("#FE9666", "#A66999")) +
  geom_text(stat='count', 
            aes(label=..count..), 
            vjust =-0.1,
            colour = c("#FE9666", "#A66999"),
            fontface = "bold",
            cex = 3) + 
  xlab("Sexual behavior") +
  ylab("Number of studies") +
  labs(title = "Sexual behavior of study participants")+
  font("title", size = 8, face = "bold") +
  font("xlab", size = 7) +
  font("ylab", size = 7) +
  font("xy.text", size = 6) +
  scale_y_continuous(expand = expansion(mult = 0.1), 
                     breaks = c(0,25,50,75,100))

.trans_pop_plot <- ggplot(data = population, aes(x = fct_infreq(gender_identity))) +
  geom_bar(fill = c("#FE9666", "#A66999")) +
  geom_text(stat='count', 
            aes(label=..count..), 
            vjust =-0.1, 
            colour = c("#FE9666", "#A66999"),
            fontface = "bold",
            cex= 3) + 
  xlab("Gender identity") +
  ylab("Number of studies") +
  labs(title = "Gender identity of study participants") +
  font("title", size = 8, face = "bold") +
  font("xlab", size = 7) +
  font("ylab", size = 7) +
  font("xy.text", size = 6) +
  scale_y_continuous(expand = expansion(mult = 0.1), 
                     breaks = c(0,25,50,75,100))



.pop_plot4 <- plot_grid(.age_pop_plot, 
                        .race_pop_plot, 
                        ncol = 2, 
                        nrow=1)
.pop_plot2 <- plot_grid(.sero_pop_plot, 
                        .SW_pop_plot, 
                        .MSMW_pop_plot, 
                        .trans_pop_plot, 
                        ncol=2, 
                        nrow=2) 
.subpopulation_plot <- plot_grid(.pop_plot4, 
                                 .pop_plot2, 
                                 ncol = 1, 
                                 nrow = 2)

ggsave(
  "./Output/Plots/Plot_population.png",
  plot = .subpopulation_plot,
  width = 140,
  height = 178,
  unit = "mm",
  dpi = 300,
  scale = 1,
  limitsize = F
)

