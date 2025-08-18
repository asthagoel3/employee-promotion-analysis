-- Query: Calculate what percentage of employees are in each department
-- This helps understand workforce distribution by department

WITH total_employees AS (
  -- Get total number of employees in the company
  SELECT COUNT(p.employee_id) AS total_employees 
  FROM employee_lifecycle.promotion_data p
)
SELECT 
  t.total_employees,                                     -- Total company employees
  p.department,                                          -- Department name
  COUNT(p.employee_id) AS num_employees,                 -- Number of employees in this department
  SAFE_DIVIDE(COUNT(p.employee_id), t.total_employees) * 100 AS percent_employees_per_department
                                                         -- % of total workforce in each department
FROM employee_lifecycle.promotion_data p, total_employees t
GROUP BY p.department, total_employees
ORDER BY percent_employees_per_department DESC;
