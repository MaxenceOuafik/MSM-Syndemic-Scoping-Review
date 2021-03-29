# Mapping the current knowledge of the syndemic research applied to men who have sex with men: a scoping review

## Overview of the project

This GitHub repository contains every data, files and code that allowed
us to generate our research paper entitled “Mapping the current
knowledge of the syndemic research applied to men who have sex with men:
a scoping review”.

The protocol of this scoping review was previously published on the BMJ
Open and can be found
[here](https://bmjopen.bmj.com/content/10/11/e041238). Our Data
Management Plan, published in the appendices of the protocol can be
found on pages 3-4 of the [supplementary
material](https://bmjopen.bmj.com/content/bmjopen/10/11/e041238.full.pdf?with-ds=yes).

Briefly, the goal of this study was to conduct an thorough literature
search on the topic of syndemic theory applied to men who have sex with
men (MSM). Readers wanting more information on the topic, research
questions and methodology can consult our protocol or the relevant
sections of this paper.

## File organization

### Data

This directory contains the data resulting from the stage 4 of this
study : data charting. Forms were generated using
[DistillerSR](https://www.evidencepartners.com/products/distillersr-systematic-review-software/)
to extract data relevant to our research questions. Subsequently, using
the “Datarama” feature of DistillerSR, we generated 4 .csv files
corresponding to our 4 forms. Complete description of every variable in
each .csv files can be found in the README of the directory.

## Files

This directory contains the files used to generate the paper. This
includes the .ris files obtained after the electronic database search,
the .ris files of the studies included at various stages of the study
and images used. Complete description of the files and subdirectories
can be found in the README of the directory.

## Output

This directory contains the article in .docx format, after kniting
Article.Rmd in the main directory as well as individual figures.

## Scripts

This directory contains the scripts sourced in Article.Rmd in order to
produce our final paper. Every step of data manipulation of the .csv
files in the Data directory as well as data analysis will be done
through scripts to ensure maximum reproducibility of our paper. Complete
description of the scripts can be found in the README of the directory
and each script contains description of the script.

## Reproduce the paper

This paper can be reproduced by downloading the repository and kniting
Article.Rmd through RStudio. This RMarkdown file contains the text of
the paper and its code chunks sources the various scripts in the Scripts
directory.

Kniting this paper as it was intended by its authors necessitates the
bmj.csl file to format the references, the article\_template.docx file
for the layout and the references.bib files, containing every references
cited in the study.

## Session info

The current version of this paper was compiled with RStudio version
1.4.1106 with the following R session :

    ## <environment: R_GlobalEnv>

    ## R version 4.0.2 (2020-06-22)
    ## Platform: x86_64-w64-mingw32/x64 (64-bit)
    ## Running under: Windows 10 x64 (build 19041)
    ## 
    ## Matrix products: default
    ## 
    ## locale:
    ## [1] LC_COLLATE=English_Belgium.1252 
    ## [2] LC_CTYPE=English_Belgium.1252   
    ## [3] LC_MONETARY=English_Belgium.1252
    ## [4] LC_NUMERIC=C                    
    ## [5] LC_TIME=English_Belgium.1252    
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods  
    ## [7] base     
    ## 
    ## other attached packages:
    ##  [1] forcats_0.5.1   stringr_1.4.0   dplyr_1.0.5    
    ##  [4] purrr_0.3.4     tidyr_1.1.3     tibble_3.1.0   
    ##  [7] ggplot2_3.3.3   tidyverse_1.3.0 readr_1.4.0    
    ## [10] bookdown_0.21   rstudioapi_0.13
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] tidyselect_1.1.0  xfun_0.20         haven_2.3.1      
    ##  [4] colorspace_2.0-0  vctrs_0.3.6       generics_0.1.0   
    ##  [7] htmltools_0.5.1   yaml_2.2.1        utf8_1.2.1       
    ## [10] rlang_0.4.10      pillar_1.5.1      withr_2.4.1      
    ## [13] glue_1.4.2        DBI_1.1.1         dbplyr_2.1.0     
    ## [16] sessioninfo_1.1.1 modelr_0.1.8      readxl_1.3.1     
    ## [19] lifecycle_1.0.0   munsell_0.5.0     gtable_0.3.0     
    ## [22] cellranger_1.1.0  rvest_1.0.0       evaluate_0.14    
    ## [25] knitr_1.31        fansi_0.4.2       broom_0.7.5      
    ## [28] Rcpp_1.0.6        backports_1.2.1   scales_1.1.1     
    ## [31] jsonlite_1.7.2    fs_1.5.0          hms_1.0.0        
    ## [34] digest_0.6.27     stringi_1.5.3     grid_4.0.2       
    ## [37] cli_2.3.1         tools_4.0.2       magrittr_2.0.1   
    ## [40] crayon_1.4.1      pkgconfig_2.0.3   ellipsis_0.3.1   
    ## [43] rsconnect_0.8.16  xml2_1.3.2        reprex_1.0.0     
    ## [46] lubridate_1.7.10  assertthat_0.2.1  rmarkdown_2.7    
    ## [49] httr_1.4.2        R6_2.5.0          compiler_4.0.2

## Contributors

As mentioned in the Data Management Plan, Maxence Ouafik, the main
investigator of the present paper is responsible for every aspect of
data management and can be reached on his [academic email
address](mailto:maxence.ouafik@uliege.be) for any query.

Laetitia Buret, Jean-Luc Belche and Beatrice Scholtes, co-authors of the
present paper, provided guidance and reviews throughout the study and
took part in selecting the studies and charting the data.

## License

Every file in this repository are on Creative Commons License CC BY-NC.
Anyone can remix, adapt and build upon this work, non-commercially, as
long as they acknowledge the published paper, this repository and its
contributors.
