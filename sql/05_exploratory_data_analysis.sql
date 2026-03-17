USE telecom;

-- Calculating Overall Churn Rate
SELECT
COUNT(*) AS total_customers,
SUM(churn) AS churned_customers,
ROUND(SUM(churn)/COUNT(*)*100,2) AS churn_rate_percentage
FROM telecom_churn;

-- Churn Distribution
SELECT
churn,
COUNT(*) AS customers
FROM telecom_churn
GROUP BY churn;

-- Churn by Telecom Partner
SELECT
telecom_partner,
COUNT(*) AS total_customers,
SUM(churn) AS churned_customers,
ROUND(SUM(churn)/COUNT(*)*100,2) AS churn_rate
FROM telecom_churn
GROUP BY telecom_partner
ORDER BY churn_rate DESC;

-- Churn by Gender
SELECT
gender,
COUNT(*) AS total_customers,
SUM(churn) AS churned_customers,
ROUND(SUM(churn)/COUNT(*)*100,2) AS churn_rate
FROM telecom_churn
GROUP BY gender;

-- Churn by Age Group
SELECT
age_group,
COUNT(*) AS total_customers,
SUM(churn) AS churned_customers,
ROUND(SUM(churn)/COUNT(*)*100,2) AS churn_rate
FROM telecom_churn
GROUP BY age_group
ORDER BY churn_rate DESC;

-- Behavioral Analysis
-- Churn by Data Usage Level
SELECT 
data_usage_level,
COUNT(*) AS total_customers,
SUM(churn) AS churned_customers,
ROUND(SUM(churn)/COUNT(*) * 100,2) AS churn_rate
FROM telecom_churn
GROUP BY data_usage_level
ORDER BY churn_rate DESC;

-- Churn by Engagement Level
ALTER TABLE telecom_churn
ADD COLUMN engagement_level VARCHAR(20);

-- Populate it
UPDATE telecom_churn
SET engagement_level=
CASE
WHEN engagement_score IS NULL THEN NULL
WHEN engagement_score<=30 THEN 'Low'
WHEN engagement_score<=80 THEN 'Medium'
ELSE 'High'
END;

SELECT 
engagement_level,
COUNT(*) AS total_customers,
SUM(churn) AS churned_customers,
ROUND(SUM(churn)/COUNT(*) * 100,2) AS churn_rate
FROM telecom_churn
GROUP BY engagement_level
ORDER BY churn_rate DESC;

SELECT * FROM telecom_churn;

-- Churn by Estimated Salary
SELECT 
CASE
WHEN estimated_salary < 40000 THEN 'Low Income'
WHEN estimated_salary < 80000 THEN 'Middle Income'
ELSE 'High Income'
END AS income_group,
COUNT(*) AS total_customers,
SUM(churn) AS churned_customers,
ROUND(SUM(churn)/COUNT(*) * 100,2) AS churn_rate
FROM telecom_churn
GROUP BY income_group
ORDER BY churn_rate DESC;

-- Creating Proper Tenure Segments-Churn by Tenure
SELECT
CASE
WHEN tenure_months <= 48 THEN '3-4 Years'
WHEN tenure_months <= 60 THEN '4-5 Years'
ELSE '5+ Years'
END AS tenure_group,
COUNT(*) AS total_customers,
SUM(churn) AS churned_customers,
ROUND(SUM(churn)/COUNT(*) * 100,2) AS churn_rate
FROM telecom_churn
GROUP BY tenure_group
ORDER BY churn_rate DESC;

-- Geographic Churn Analysis
-- Churn by State
SELECT
state,
COUNT(*) AS total_customers,
SUM(churn) AS churned_customers,
ROUND(SUM(churn)/COUNT(*)*100,2) AS churn_rate
FROM telecom_churn
GROUP BY state
ORDER BY churn_rate DESC;

-- Top Cities by Churn
SELECT
city,
COUNT(*) AS total_customers,
SUM(churn) AS churned_customers,
ROUND(SUM(churn)/COUNT(*)*100,2) AS churn_rate
FROM telecom_churn
GROUP BY city
HAVING COUNT(*)>500
ORDER BY churn_rate DESC
LIMIT 10;

SELECT * FROM telecom_churn;