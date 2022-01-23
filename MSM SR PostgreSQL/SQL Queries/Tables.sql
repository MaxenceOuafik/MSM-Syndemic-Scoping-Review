CREATE TABLE IF NOT EXISTS general_characteristics (
  refid integer PRIMARY KEY,
  main_author varchar,
  title varchar,
  publication_year integer,
  country varchar,
  design varchar,
  sample_size integer,
  mean_age integer
);

CREATE TABLE IF NOT EXISTS subpopulations (
  refid integer PRIMARY KEY,
  subpopulation_logical boolean,
  subpopulation_studied varchar,
  disaggregated_logical boolean,
  disaggregated_population varchar
);

CREATE TABLE IF NOT EXISTS syndemic_conditions (
  synd_id SERIAL PRIMARY KEY,
  condition_name varchar,
  category varchar
);

CREATE TABLE IF NOT EXISTS  depression_measurement (
  refid integer PRIMARY KEY,
  scale boolean,
  criteria varchar,
  cutoff int
);

CREATE TABLE IF NOT EXISTS substance_use_measurement (
  refid integer PRIMARY KEY,
  period varchar
);

CREATE TABLE IF NOT EXISTS  substances (
  substance_id SERIAL PRIMARY KEY,
  substance_name varchar
);

CREATE TABLE IF NOT EXISTS  StudySubstances (
  refid integer,
  substance_id integer
);

CREATE TABLE IF NOT EXISTS StudyCond (
	refid integer,
	synd_id integer,
	PRIMARY KEY (refid, synd_id)
); 

CREATE TABLE IF NOT EXISTS PTSD_measurement (
  refid integer PRIMARY KEY,
  scale varchar,
  criteria varchar,
  cutoff int
);

CREATE TABLE IF NOT EXISTS violence_measurement (
  refid integer PRIMARY KEY,
  period varchar
);

CREATE TABLE IF NOT EXISTS violence (
  violence_id SERIAL PRIMARY KEY,
  violence_type varchar
);

CREATE TABLE IF NOT EXISTS StudyViolences (
  refid integer,
  violence_id integer
);

CREATE TABLE IF NOT EXISTS IPV_measurement (
  refid integer PRIMARY KEY,
  period varchar
);

CREATE TABLE IF NOT EXISTS  IPV (
  IPV_id SERIAL PRIMARY KEY,
  IPV_type varchar
);

CREATE TABLE IF NOT EXISTS  StudyIPV (
  refid integer,
  IPV_id integer
);

CREATE TABLE IF NOT EXISTS binge_measurement (
  refid integer PRIMARY KEY,
  episodes varchar,
  period varchar
);

CREATE TABLE IF NOT EXISTS suicide_measurement (
  refid integer PRIMARY KEY,
  period varchar
);

CREATE TABLE IF NOT EXISTS suicide (
  suicide_id SERIAL PRIMARY KEY,
  suicide_type varchar
);

CREATE TABLE IF NOT EXISTS StudySuicides (
  refid integer,
  suicide_id integer
);

CREATE TABLE IF NOT EXISTS anxiety_measurement (
  refid integer PRIMARY KEY,
  scale boolean,
  criteria varchar,
  cutoff int,
  period varchar
);

CREATE TABLE IF NOT EXISTS anxiety (
  anxiety_id SERIAL PRIMARY KEY,
  anxiety_type varchar
);

CREATE TABLE IF NOT EXISTS StudyAnxieties (
  refid integer,
  anxiety_id integer
);

CREATE TABLE IF NOT EXISTS sex_comp_measurement (
  refid integer PRIMARY KEY,
  scale_name varchar,
  cutoff integer
);

CREATE TABLE IF NOT EXISTS CSA_measurement (
  refid integer PRIMARY KEY,
  scale boolean,
  criteria varchar,
  cutoff integer
);

CREATE TABLE IF NOT EXISTS polysubstance_measurement (
  refid integer PRIMARY KEY,
  number_of_substances varchar,
  marijuana_included boolean,
  period varchar
);

CREATE TABLE IF NOT EXISTS AUD_measurement (
  refid integer PRIMARY KEY,
  criteria varchar,
  cutoff integer
);

CREATE TABLE IF NOT EXISTS alcohol_measurement (
  refid integer PRIMARY KEY,
  criteria varchar,
  period varchar
);

CREATE TABLE IF NOT EXISTS SUD_measurement (
  refid integer PRIMARY KEY,
  scale boolean,
  criteria varchar,
  cutoff integer
);

CREATE TABLE IF NOT EXISTS outcomes (
  outcome_id SERIAL PRIMARY KEY,
  outcome_name varchar,
  HIV_related boolean
);

CREATE TABLE IF NOT EXISTS StudyOutcomes (
  refid integer,
  outcome_id integer
);

CREATE TABLE IF NOT EXISTS outcome_SR_measurement (
  refid integer PRIMARY KEY,
  scale boolean,
  period varchar
);

CREATE TABLE IF NOT EXISTS risks (
  risk_id SERIAL PRIMARY KEY,
  risk_name varchar
);

CREATE TABLE IF NOT EXISTS StudyRisks (
  refid integer,
  risk_id integer
);

CREATE TABLE IF NOT EXISTS interventions (
  refid integer PRIMARY KEY,
  intevention_type varchar,
  goal varchar,
  control varchar,
  intervention_size integer,
  control_size integer,
  duration integer
);

CREATE TABLE IF NOT EXISTS interaction (
  refid integer PRIMARY KEY,
  bio_bio_logical boolean,
  bio_bio varchar,
  bio_social_logical boolean,
  bio_social varchar
);

CREATE TABLE IF NOT EXISTS statistics (
  stat_id SERIAL PRIMARY KEY,
  name varchar
);

CREATE TABLE IF NOT EXISTS StudyStatistics (
  refid integer,
  stat_id integer
);

CREATE TABLE IF NOT EXISTS findings (
  refid integer PRIMARY KEY,
  findings varchar
);

CREATE TABLE IF NOT EXISTS framework (
  framework_id integer PRIMARY KEY,
  name varchar
);

CREATE TABLE IF NOT EXISTS qualitative_analysis (
  analysis_id SERIAL PRIMARY KEY,
  name varchar
);

CREATE TABLE IF NOT EXISTS StudyAnalyses (
  refid integer,
  analysis_id integer
);

CREATE TABLE IF NOT EXISTS reviews (
  refid integer PRIMARY KEY,
  purpose varchar,
  studies_included varchar
);

CREATE TABLE IF NOT EXISTS  StudyFrameworks (
  refid integer,
  framework_id integer
);

ALTER TABLE StudyFrameworks ADD UNIQUE (refid, framework_id);
ALTER TABLE StudyFrameworks ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);
ALTER TABLE StudyFrameworks ADD FOREIGN KEY (framework_id) REFERENCES framework (framework_id);

ALTER TABLE general_characteristics ADD FOREIGN KEY (refid) REFERENCES subpopulations (refid);

ALTER TABLE StudyCond ADD UNIQUE (refid, synd_id);
ALTER TABLE StudyCond ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);
ALTER TABLE StudyCond ADD FOREIGN KEY (synd_id) REFERENCES syndemic_conditions (synd_id);


ALTER TABLE depression_measurement ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudySubstances ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudySubstances 
	ADD UNIQUE (refid, substance_id), 
	ADD FOREIGN KEY (substance_id) REFERENCES substances(substance_id);

ALTER TABLE substance_use_measurement ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE PTSD_measurement ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE violence_measurement ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudyViolences ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudyViolences
	ADD UNIQUE (refid, violence_id), 
	ADD FOREIGN KEY (violence_id) REFERENCES violence (violence_id);


ALTER TABLE IPV_measurement ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudyIPV
	ADD UNIQUE (refid, IPV_id), 
	ADD FOREIGN KEY (IPV_id) REFERENCES IPV (IPV_id);

ALTER TABLE StudyIPV ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE binge_measurement ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE suicide_measurement ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudySuicides ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudySuicides
	ADD UNIQUE (refid, suicide_id),
	ADD FOREIGN KEY (suicide_id) REFERENCES suicide (suicide_id);

ALTER TABLE anxiety_measurement ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudyAnxieties ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudyAnxieties
	ADD UNIQUE (refid, anxiety_id), 
	ADD FOREIGN KEY (anxiety_id) REFERENCES anxiety (anxiety_id); 

ALTER TABLE sex_comp_measurement ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE polysubstance_measurement ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE AUD_measurement ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE alcohol_measurement ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE SUD_measurement ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE CSA_measurement ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudyOutcomes
	ADD UNIQUE (refid, outcome_id), 
	ADD FOREIGN KEY (outcome_id) REFERENCES outcomes (outcome_id);

ALTER TABLE StudyOutcomes ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE outcome_SR_measurement ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudyRisks ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudyRisks ADD FOREIGN KEY (risk_id) REFERENCES risks (risk_id);

ALTER TABLE interventions ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE interaction ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudyStatistics ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudyStatistics ADD FOREIGN KEY (stat_id) REFERENCES statistics (stat_id);

ALTER TABLE findings ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE framework ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudyAnalyses ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

ALTER TABLE StudyAnalyses ADD FOREIGN KEY (analysis_id) REFERENCES qualitative_analysis (analysis_id);

ALTER TABLE reviews ADD FOREIGN KEY (refid) REFERENCES general_characteristics (refid);

