sample_qualitative <- summary_qualitative %>%
  select(sample_size, age) 

sample_quantitative <- summary_quantitative %>%
  select(sample_size, age)
  
sample <- rbind(sample_qualitative,
                     sample_quantitative)