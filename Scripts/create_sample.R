summary_qualitative <- read_csv("Data/summary_qualitative.csv", 
                                col_types = cols(X23 = col_skip()))
summary_quantitative <- read_csv("Data/summary_quantitative.csv")

sample_qualitative <- summary_qualitative %>%
  select(sample_size, age) 

sample_quantitative <- summary_quantitative %>%
  select(sample_size, age)
  
sample <- rbind(sample_qualitative,
                     sample_quantitative)