-- Query: Calculate promotion rates by education level
-- This helps answer: "Are people with higher education more likely to get promoted?"

WITH total_employees AS (
  -- Get total company headcount
  SELECT COUNT(employee_id) AS total_employees
  FROM employee_lifecycle.promotion_data
)
SELECT 
  t.total_employees,                                      -- Total company employees
  IFNULL(education, 'None indicated') AS education,       -- Education level (replace NULL with 'None indicated')
  COUNT(*) AS num_per_degree,                             -- Number of employees with that education level
  COUNT(CASE WHEN is_promoted = 1 THEN 1 END) AS num_promoted,  
                                                          -- Number of promotions at that education level
  ROUND((COUNT(CASE WHEN is_promoted = 1 THEN 1 END) / COUNT(*)) * 100, 2) AS promotion_rate
                                                          -- Promotion rate for this education level
FROM employee_lifecycle.promotion_data, total_employees t
GROUP BY education, total_employees;
