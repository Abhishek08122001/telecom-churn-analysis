USE telecom;

-- To retrieve distinct telecom partners
SELECT DISTINCT telecom_partner
FROM telecom_churn;

-- To get churn count
SELECT churn,COUNT(*)
FROM telecom_churn
GROUP BY churn;

-- Data Checking
SELECT COUNT(*)
FROM telecom_churn
WHERE data_used IS NULL;

SELECT *
FROM telecom_churn
WHERE data_used < 0;

-- UPDATING BAD DATA WITH NULL VALUES
UPDATE telecom_churn
SET data_used = NULL
WHERE data_used < 0;

UPDATE telecom_churn
SET calls_made = NULL
WHERE calls_made < 0;

UPDATE telecom_churn
SET sms_sent = NULL
WHERE sms_sent < 0;

-- SELECT
-- COUNT(*) AS total_rows,
-- SUM(age IS NULL) AS missing_age,
-- SUM(estimated_salary IS NULL) AS missing_salary,
-- SUM(calls_made IS NULL) AS missing_calls,
-- SUM(sms_sent IS NULL) AS missing_sms,
-- SUM(data_used IS NULL) AS missing_data
-- FROM telecom_churn;

-- range validation
SELECT
MIN(age) AS min_age,
MAX(age) AS max_age
FROM telecom_churn;

SELECT
MIN(estimated_salary),
MAX(estimated_salary)
FROM telecom_churn;

SELECT
MIN(calls_made),
MAX(calls_made)
FROM telecom_churn;

SELECT
MIN(sms_sent),
MAX(sms_sent)
FROM telecom_churn;

SELECT
MIN(data_used),
MAX(data_used)
FROM telecom_churn;

-- validating categorical columns
SELECT telecom_partner,COUNT(*)
FROM telecom_churn
GROUP BY telecom_partner;

SELECT gender,COUNT(*)
FROM telecom_churn
GROUP BY gender;

SELECT churn,COUNT(*)
FROM telecom_churn
GROUP BY churn;