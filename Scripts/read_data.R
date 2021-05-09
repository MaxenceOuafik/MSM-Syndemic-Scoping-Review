overview_of_studies <- read_csv("Data/overview_of_studies.csv", 
                                col_types = cols(X6 = col_skip()))

summary_qualitative <- read_csv("Data/summary_qualitative.csv", 
                                col_types = cols(X23 = col_skip()))
summary_quantitative <- read_csv("Data/summary_quantitative.csv",
                                 col_types = cols(X299 = col_skip()))

summary_reviews <- read_csv("Data/summary_reviews.csv", 
                           col_types = cols(X12 = col_skip()))
