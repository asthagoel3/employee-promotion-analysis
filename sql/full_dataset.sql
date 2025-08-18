-- Full dataset overview
-- Purpose: Inspect all employee data to understand available columns and records.
-- This is the first step in any people analytics project to get a sense of the dataset.

SELECT *
FROM employee_lifecycle.promotion_data;

-- Notes:
-- - Columns include employee_id, department, region, education, gender, recruitment_channel, 
--   number of trainings, age, previous year rating, length of service, awards won, average training score, and promotion status.
-- - This query helps identify missing data, data types, and potential variables for analysis.
