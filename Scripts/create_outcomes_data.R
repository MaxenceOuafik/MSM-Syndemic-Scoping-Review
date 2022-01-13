.outcomes <- summary_quantitative %>%
  select(1:3, 184:205) %>%
  unite("reference", 1:3, sep =" ", na.rm = T)

.outcomes_measurement <- summary_quantitative %>%
  select(1:3, 206:255) %>%
  unite("reference", 1:3, sep =" ", na.rm = T)

.outcomes_sex_risk_measurement <- .outcomes_measurement %>%
  select(1, 5:21)


.CAS_number <- sum(!is.na(.outcomes_sex_risk_measurement$outcome_CAS)) + 
  sum(!is.na(.outcomes_sex_risk_measurement$outcome_serodiscodant_CAS)) +
  sum(!is.na(.outcomes_sex_risk_measurement$outcome_receptive_CAS)) + 
  sum(!is.na(.outcomes_sex_risk_measurement$outcome_PrEP_VL_CAS)) +
  sum(!is.na(.outcomes_sex_risk_measurement$outcome_PrEP_CAS)) +
  sum(!is.na(.outcomes_sex_risk_measurement$outcome_casual_CAS)) +
  sum(!is.na(.outcomes_sex_risk_measurement$outcome_current_CAS))

.HIV_number <- sum(!is.na(.outcomes$outcome_adherence)) +
  sum(!is.na(.outcomes$outcome_sexual_risk)) +
  sum(!is.na(.outcomes$outcome_PrEP)) +
  sum(!is.na(.outcomes$outcome_HIV)) +
  sum(!is.na(.outcomes$outcome_VL)) +
  sum(!is.na(.outcomes$outcome_screening)) +
  sum(!is.na(.outcomes$outcome_HIV_care)) +
  sum(!is.na(.outcomes$transmission)) +
  sum(!is.na(.outcomes$rectal_cytokines))
