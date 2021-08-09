# Overview of the directory

This folder contains the data resulting from the stage 4 of this study : data charting. Forms were generated using [DistillerSR](%5Bhttps://www.evidencepartners.com/products/distillersr-systematic-review-software/)](<https://www.evidencepartners.com/products/distillersr-systematic-review-software/>)) to extract data relevant to our research questions. Subsequently, using the "Datarama" feature of DistillerSR, we generated 4 .csv files corresponding to our 4 forms.

# Description of the files

## overview_of_studies.csv

This file corresponds to the general form used to extract authors, year, location and design of every paper. A fifth column, letter, serves to disambiguate whenever two studies were published the same year by the same main author *(e.g. Chandler et al. 2020a and Chandler et al. 2020b)*

## summary_qualitative.csv

This file corresponds to the form used to extract every data for qualitative studies. Data extracted for qualitative studies are :

-   authors, year, location, size of the sample (sample_size), mean age (age),
-   analysis method (grounded theory, thematic analysis, framework analysis, life-story interview, analytic induction or cross-case, as binaries)
-   If the study focuses on a subpopulation of MSM (subpopulation_logical) , as a binary and the subpopulation studied : Black MSM (BMSM), Latino MSM (LMSM), Young Black MSM (YBMSM), Young MSM living with HIV (HIV+YMSM)
-   If the study provides an interaction between biological factors (bio_bio_logical) or between biological and sociological factors (bio_social_logical), as binaries. The interaction proposed was extracted under bio_social_interaction (as no study provided bio-bio interaction, no column was generated in the .csv file)
-   Key findings are in the column findings
-   Additional framework used by the author (such as intersectionality) was recorded under additional_framework

## summary_quantitative.csv

This file corresponds the the form used to extract every data for quantitative reviews. Those data are :

### General characteristics

-   Authors, year, location, design and eventual comment on the design for mixed design
-   Duration of the study, for longitudinal studies (duration_study)
-   Sample size (sample_size), mean age (age)
-   Additional framework used, when applicable : minority stress model (minority_stress), social cognitive theory (social_cognitive), salutogenesis, resilience and intersectionality

### Subpopulations

-   If the study focuses on a subpopulation of MSM (subpopulation_logical) , as a binary and the subpopulation studied : Men who have sex with Men and Women (MSMW), Young MSM (YMSM), Black MSM (BMSM), Latino MSM (LMSM), Older MSM living with HIV (HIV+OMSM), MSM living with HIV (HIV+MSM), Adolescent MSM (AMSM), MSM with a history of childhood sexual abuse (MSM_CSA), Latino MSMW (LMSMW), MSM engaged in sex work (MSM-SW), Transgender MSM (TMSM), BMSM engaged in sex work (BMSM-SW)
-   If the study provides disaggregated data for a MSM subpopulation (disaggregated_logical) and the subpopulation, when applicable

### Syndemic conditions and their measurement

-   The syndemic conditions studied : depression, substance use, Post-Traumatic Stress Disorder (PTSD), Intimate Partner Violence (IPV), binge drinking (binge), suicidality, sexual compulsivity (sex_comp), anxiety, Injection Drug Use (IDU), Childhood Sexual Abuse (CSA), polysubstance use, bullying, Alcohol Use Disorder (AUD), internalised homophobia, incarceration, unstable housing, poverty, alcohol use, exchange sex, discrimination, tobacco use, unemployment, poor access to healthcare (healthcare_access), sexual risk behaviors (sexual_risk), substance use disorder, poor social support (social_support), diagnosis of sexually transmitted infection (STI), diagnosis of HIV (HIV), experience of violence, sleep disturbance, loneliness, involuntary subordination (subordination), low self-esteem (esteem), hostility, engaging in chemsex (chemsex), impulsivity, hypersexuality, stress, cognitive escape, general mental distress (distress), childhood abuse (childhood), frequenting gay venues (venues), Attention Deficit/Hyperactivity Disorder (ADHD), alexithymia, experience of trauma and poor physical health (physical_health)

-   The way those conditions were measured. Whenever it was necessary, the measurement data was divided into its components to facilitate analysis in the stage 5 of the study. Typically, we proceeded that way when a lot of variability existed across study. For example, in the case of depression, not every study used a scale to assess the presence of depression a lot of different scales were used and, even when the same scale was used, the cutoff differed across studies. In such cases, we opted to create 3 variables to obtain a more granular view. In the rest of cases, we used a single variable named on the model measurement_name_of_the_syndemic_condition

    -   Depression : a binary for whether the study use a scale or a set of criteria to assess the presence of depression (depression_scale), the scale or criteria used (depression_scale_criteria) and the cutoff, when a scale is used (depression_cutoff)

    -   Substance use : a binary for different class of substances screened : stimulants, ecstasy, hallucinogens, marijuana, depressants, new psychoactive substances (NPS), opioids, inhalants or not specified (not_specified) and the reference period (substance_use_period)

    -   PTSD : a binary for whether the study use a scale or a set of criteria to assess the presence of PTSD (PTSD_type), the scale or criteria used (PTSD_scale_criteria) and the cutoff, when a scale is used (PTSD_cutoff)

    -   Violence : what kind of violence was screened : physical, sexual, sexual by the police (sexual_police), physical by the police (physical_police), psychological or not specified (not_specified) and the reference period (violence_period)

    -   IPV : a binary for whether the study use a scale or a set of criteria to assess the presence of IPV (IPV_type), the scale or criteria used (physical, sexual, psychological, gay-related, HIV-related, the CTS2 scale or the HITS scale) and the reference period or cutoff used (IPV_cutoff_period)

    -   Binge drinking : the number of episodes needed to qualify for binge drinking in this study (binge_episodes) and the reference period (binge_period)

    -   Suicidality : if the study screened for suicidal thoughts (suicidal_thoughts), suicide attempts (suicide_attempts) or used a scale such as SBQ-R or PANSI and the reference period (suicide_period)

    -   Anxiety : the type of anxiety disorder screened : social phobia (social_phobia), panic disorder (panic_disorder), generalized anxiety disorder (GAD), a binary for whether the study use a scale or a set of criteria to assess the presence of anxiety (anxiety_type), the scale or criteria used : SPIN, MINI-SPIN, PHQ, GAD-7, BSI, HADS, self-report, clinical diagnosis based on the DSM-IV (DSM-IV), the use of medication for an anxiety disorder (medication) and the cutoff of period used (anxiety_cutoff_period)

    -   Sexual compulsivity : a binary for whether the study use a scale or a set of criteria to assess the presence of sexual compulsivity (sex_comp_type), the scale or criteria used (sex_comp_scale_criteria) and the cutoff used, if a scale was used (sex_comp_cutoff)

    -   CSA : a binary for whether the study use a scale or a set of criteria to assess the presence of CSA (CSA_type), the scale or criteria used (CSA_scale_criteria) and the cutoff used, if a scale was used (CSA_cutoff)

    -   Polysubstance use : the number of different substances one needed to use to be qualified as polysubstance use (polysubstance_number), a binary for whether marijuana was included in the definition of polysubstance use (polysubstance_marijuana) and the reference period (polysubstance_period)

    -   Alcohol use : which aspect(s) of alcohol use were considered as a syndemic condition : frequency and/or intensity (frequency_intensity), alcohol use until intoxication (intoxication), alcohol consumption (consumption) or early alcohol consumption (early) as well as the reference period, when applicable (alcohol_period)

    -   Sexual risk behaviors : what was considered sexual risk taking : number of partners (number_partners), condomless anal sex (CAS), high score on the Kalichman's Sexual Sensation Seeking Scale (Kalichman_SSSS), serodiscordant CAS (serodiscordant_CAS), condomless oral sex (COS), condomless vaginal sex (CVS), STI diagnosis (STI_risk), participating in sex work (sex_work), having a recent HIV+ partner (HIV_partner), CAS with casual partner (casual_CAS) and the reference period (measurement_risk_period)

    -   Substance use disorder : a binary for whether the study use a scale or a set of criteria to assess the presence of CSA (SUD_type), the scale or criteria used (SUD_scale_criteria) and the cutoff used, if a scale was used (SUD_cutoff)

    -   Social support : a binary for whether the study use a scale or a set of criteria to assess the presence of low social support (social_support_type), the scale or criteria used (social_support_scale_criteria) and the cutoff used, if a scale was used (social_support_cutoff)

    -   Chemsex : the substances screened : stimulants (chem_stimulants), ecstasy (chem_ecstasy), depressants (chem_depressants), ketamine (chem_ketamine), opioids (chem_opioids), poppers (chem_poppers), erection enhancers (chem_erection), alcohol (chem_alcohol) and the reference period (chemsex_period)

    -   Syndemic conditions measured with only one variable : IDU : measurement_IDU ; bullying : measurement_bullying ; internalised homophobia : measurement_intern_homop ; incarceration : measurement_incarceration ; unstable housing : measurement_housing ; poverty : measurement_poverty ; STI : measurement_STI_condition ; HIV : measurement_HIV_condition ; exchange sex : measurement_exchange_sex_condition ; discrimination : measurement_discrimination ; tobacco : measurement_tobacco ; unemployment : measurement_unemployment ; healthcare access : measurement_HC_access ; sleep disturbance : measurement_sleep_disturbance ; low self-esteem : measurement_esteem ; involuntary subordination : measurement_subordination ; hostility : measurement_hostility ; impulsivity : measurement_impulsivity ; hypersexuality : measurement_hypersexuality ; stress : measurement_stress ; cognitive escape : measurement_escape ; general distress : measurement_distress ; childhood abuse : measurement_childhood_abuse ; visit to gay venues : measurement_venues ; ADHD : measurement_ADHD ; alexithymia : measurement_alexithymia ; trauma : measurement_trauma

### Outcomes and their measurement

-   The outcome(s) of the studies : adherence to antiviral medication (outcome_adherence), engaging in exchange sex (outcome_exchange_sex), sexual risk behaviors : outcome_sexual_risk ; PrEP-related outcomes : outcome_PrEP ; HIV diagnosis (outcome_HIV) ; viral load (outcome_VL) ; HIV screening (outcome_screening) ; physical activity (outcome_physical_activity) ; healthcare use (outcome_healthcare) ; STI diagnosis (outcome_STI) ; hypothalamic-pituitary-adrenal axis dysregulation (outcome_HPA), sexual violence (outcome_sexual_violence) ; glycemic control (outcome_glycemia) ; linkage to HIV care (outcome_HIV_care) ; suicidality (outcome_suicide), participating in chemsex (outcome_chemsex) ; having sex with both men and women (outcome_MSMW) ; syndemic conditions as the outcome (outcome_syndemic) ; help-seeking behaviors (outcome_help), substance use (outcome_substance)

-   The way those outcomes were measured ; the same logic as for syndemic conditions applies :

    -   Sexual risk behaviors : a binary for whether the study use a scale or a set of criteria to assess the presence of sexual risk taking (outcome_sexual_risk_type), the scale or criteria used : HIRI scale, condomless anal sex (outcome_CAS), CAS without PrEP or with a detectable viral load (outcome_PrEP_VL_CAS), number of partners (outcome_number_partners), substance use before sex (outcome_substance_sex), serodiscordant CAS (outcome_serodiscordant_CAS), having sex with female partners (outcome_female_sex), receptive CAS (outcome_receptive_CAS), CAS without PrEP (outcome_PrEP_CAS), CAS with casual partners (outcome_casual_CAS), condomless vaginal sex (outcome_CVS), non-disclosure of serostatus to partner (outcome_non_disclosure), current CAS (outcome_current_CAS), participating in group sex (outcome_group_sex), condomless oral sex (outcome_COS), the HIV risk taking scale (outcome_HIV_scale) and the reference period outcome_sexual_risk_period

    -   PrEP : awareness of PrEP, willingness to use PrEP, PrEP use and PrEP adherence

    -   Suicidality : suicidal ideation (outcome_ideation) ; suicide attempts (outcome_attempts) ; suicide attempts requiring medical attention (outcome_serious_attempts) and reference period measurement_outcome_suicide_period

    -   STI diagnosis : the STI screened (chlamydia, gonorrhea, syphilis, hepatitis_B, hepatitis_C, herpes, warts, not_specified), whether it was self-reported or lab-confirmed (measurement_outcome_STI_report) and the reference period if self-reported (measurement_outcome_STI-period)

    -   Healthcare use : aspect of healtcare use considered : cost, number of visits (number_visits), costs of mental health services (cost_mental), number of mental health visit (number_mental_visit), visit to the ER (ER_visit) and inpatient admission (inpatient_admission)

    -   Outcome measured with only one variable : exchange sex (measurement_outcome_exchange_sex) ; HIV diagnosis (measurement_outcome_HIV), viral load (measurement_outcome_VL), HIV screening (measurement_outcome_screening), physical activity (measurement_outcome_physical activity) ; syndemic ill-health (measurement_outcome_ill), sexual violence (measurement_outcome_sexual_violence), chemsex : measurement_outcome_chemsex

### Interventions

-   Type of intervention (intervention_type), goal of intervention (intervention_goal), type of control group (intervention_control), size of the intervention group (intervention_size), size of the control group (intervention_control_size) and duration of intervention (intervention_duration)

### Interaction

-   The statistics used to assess the presence of interaction : regression analysis using syndemic summation score (score), latent class analysis or latent profile analysis (LCA_LPA), relative excess risk due to interaction (RERI), exploratory factor analysis (EFA), network analysis (network), significant product term in regression (product_term), observed/expected ratio (O_E), moderation analysis (moderation), mediation analysis (mediation), structural equation modeling (SEM), path analysis (path), confirmatory factor analysis (CFA), cluster analysis (cluster), latent transition analysis (LTA), multivariate linear regression (linear), bivariate Cox proportional hazards models (Cox), no interaction studied (not_interaction), hierarchical negative binomial regression (hierarchical), multivariate logistic regression (logistic), point-biserial correlation (biserial)
-   If the study provides an interaction between biological factors (bio_bio_logical) or between biological and sociological factors (bio_social_logical), as binaries. The interaction proposed was extracted under bio_social_interaction or bio_bio_interaction, as appropriate

### Key findings

-   Findings

## summary_reviews

This file corresponds to the form used to extract every data for systematic reviews and meta-analysis. Data extracted for qualitative studies are :

-   authors, year, location, design, size of the total sample (sample_size)
-   Purpose of the review
-   Number of studies included
-   If the study provides an interaction between biological factors (bio_bio_logical) or between biological and sociological factors (bio_social_logical), as binaries. The interaction proposed was extracted under bio_social_interaction (as no study provided bio-bio interaction, no column was generated in the .csv file)
-   Key findings are in the column findings
-   Additional framework used by the author (such as intersectionality) was recorded under additional_framework
