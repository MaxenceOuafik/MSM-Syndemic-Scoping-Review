.framework_quantitative <- summary_quantitative %>%
  select(1:3, 286:290) %>%
  unite("reference", 1:3, na.rm = T, sep = " ") %>%
  filter(!is.na(minority_stress)|!is.na(social_cognitive)|
           !is.na(salutogenesis)|
           !is.na(resilience)|
           !is.na(intersectionality)) %>%
  unite("additional_framework", 2:6, sep = " ", na.rm = T) 
  

.framework_qualitative <- summary_qualitative %>%
  select(1:2, 19) %>%
  unite("reference", 1:2, sep = " ", na.rm = T) %>%
  filter(!is.na(additional_framework))

.framework_reviews <- summary_reviews %>%
  select(1:2, 11) %>%
  unite("reference", 1:2, sep = " ", na.rm = T) %>%
  filter(!is.na(additional_framework))

.framework <- bind_rows(.framework_qualitative, 
                       .framework_quantitative, 
                       .framework_reviews)
