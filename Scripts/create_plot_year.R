plot_year_design <- year_design %>%
  ggplot() +
  scale_fill_brewer(palette="Set2")+
  geom_line(aes(x=year, y = cumulative, color = design), size = 1, alpha = .5) +
  geom_point(aes(x=year, y = cumulative, color = design), size = 1) +
  scale_x_continuous(name = "Year of publication", 
                     breaks = seq(2003, 2021, by = 2), 
                     minor_breaks = c(2003:2021)) +
  scale_y_continuous(name ="Cumulative number of studies", 
                     breaks = seq(0, 75, by = 10), 
                     minor_breaks = seq(0, 75, by = 5)) +
  ggtitle("B. Studies, by design and year of publication") +
  labs (color = "Study design") +
  theme(
    axis.text.x = element_text(size=8),
    plot.title = element_text(size = 10, face = "bold"),
    axis.title.x = element_text(size = 9, face = "italic"),
    axis.title.y = element_text(size = 9, face = "italic"),
    legend.title = element_text(size = 7, face = "bold")
  )

plot_year_continent <- year_continent %>%
  ggplot() +
  scale_fill_brewer(palette="Set2")+
  geom_line(aes(x=year, y = cumulative_continent, color = continent), size = 1, alpha = .5) +
  geom_point(aes(x=year, y = cumulative_continent, color = continent), size = 1) +
  scale_x_continuous(name = "Year of publication", 
                     breaks = seq(2003, 2021, by = 2), 
                     minor_breaks = c(2003:2021)) +
  scale_y_continuous(name ="Cumulative number of studies", 
                     breaks = seq(0, 75, by = 10), 
                     minor_breaks = seq(0, 75, by = 5)) +
  ggtitle("A. Studies, by continent and year of publication") +
  labs (color = "Continent") +
  theme(
    axis.text.x = element_text(size=8),
    plot.title = element_text(size = 10, face = "bold"),
    axis.title.x = element_text(size = 9, face = "italic"),
    axis.title.y = element_text(size = 9, face = "italic"),
    legend.title = element_text(size = 7, face = "bold")
  )


plot_year <- ggarrange(plot_year_continent, plot_year_design,
                       ncol = 1, 
                       nrow = 2,
                       common.legend = F, 
                       legend = "bottom")

ggsave(
  "./Output/Plots/Plot_Year.png",
  plot = plot_year,
  width = 140,
  height = 178,
  unit = "mm",
  dpi = 300,
  scale = 1,
  limitsize = F
)
