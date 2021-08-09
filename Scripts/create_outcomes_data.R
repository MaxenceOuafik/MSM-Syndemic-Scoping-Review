.outcomes <- summary_quantitative %>%
  select(1:3, 182:201) %>%
  unite("reference", 1:3, sep =" ", na.rm = T)

.outcomes_measurement <- summary_quantitative %>%
  select(1:3, 202:251) %>%
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
