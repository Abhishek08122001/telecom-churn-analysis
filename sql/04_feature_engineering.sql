USE telecom;

-- Customer Tenure
SELECT
customer_id,
TIMESTAMPDIFF(MONTH,date_of_registration,CURDATE()) AS tenure_months
FROM telecom_churn;

-- adding tenure_months column to the telecom_churn table
ALTER TABLE telecom_churn
ADD COLUMN tenure_months INT;

-- populate data into the tenure_months column
UPDATE telecom_churn
SET tenure_months=TIMESTAMPDIFF(MONTH,date_of_registration,CURDATE());

SELECT * FROM telecom_churn;

-- Age Group Segmentation
ALTER TABLE telecom_churn
ADD COLUMN age_group VARCHAR(20);

-- Populating data inside age_group
UPDATE telecom_churn
SET age_group=
CASE
WHEN age BETWEEN 18 AND 25 THEN 'Young'
WHEN age BETWEEN 26 AND 35 THEN 'Early Career'
WHEN age BETWEEN 36 AND 50 THEN 'Mid Career'
ELSE 'Senior'
END;

-- Data Usage Category

-- Adding new column name data_usage_level to telecom_churn table
ALTER TABLE telecom_churn
ADD COLUMN data_usage_level VARCHAR(20);

-- Populating data inside data_usage_level column
UPDATE telecom_churn
SET data_usage_level=
CASE
WHEN data_used IS NULL THEN null
WHEN data_used<=2000 THEN 'Low'
WHEN data_used<=6000 THEN 'Medium'
ELSE 'High'
END;

-- Engagement Level
-- Adding new column engagement_score to telecom_churn table
ALTER TABLE telecom_churn
ADD COLUMN engagement_score INT;

-- Populate data inside engagement_score column
UPDATE telecom_churn
SET engagement_score=calls_made+sms_sent;

UPDATE telecom_churn
SET engagement_score=
CASE
WHEN calls_made IS NULL AND sms_sent IS NULL THEN NULL
ELSE COALESCE(calls_made,0)+COALESCE(sms_sent,0)
END;

SELECT 
MIN(engagement_score),
MAX(engagement_score)
FROM telecom_churn;
