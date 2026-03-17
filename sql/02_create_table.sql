USE telecom;

CREATE TABLE telecom_churn (
customer_id INT,
telecom_partner VARCHAR(50),
gender VARCHAR(10),
age INT,
state VARCHAR(50),
city VARCHAR(50),
pincode INT,
date_of_registration DATE,
num_dependents INT,
estimated_salary DECIMAL(10,2),
calls_made INT,
sms_sent INT,
data_used INT,
churn INT
);

SELECT * FROM telecom_churn;

SELECT COUNT(*)
FROM telecom_churn;

SELECT *
FROM telecom_churn
LIMIT 10;

-- creating a backup duplicate table
CREATE TABLE telecom_churn_backup AS
SELECT * FROM telecom_churn;