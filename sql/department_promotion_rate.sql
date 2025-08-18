-- Query: Calculate promotion rates by department
-- This shows how each department contributes to promotions relative to company size

WITH total_employees AS (
  -- Get total number of employees in the company
  SELECT COUNT(p.employee_id) AS total_employees 
  FROM employee_lifecycle.promotion_data p
)
SELECT 
  t.total_employees,                                   -- Total company employees
  p.department,                                        -- Department name
  COUNT(p.employee_id) AS num_employees,               -- Employees in that department
  SUM(p.is_promoted) AS num_promoted,                  -- Promotions in that department
  ROUND(SAFE_DIVIDE(SUM(p.is_promoted), t.total_employees) * 100, 2) AS percent_promoted
                                                       -- % of company-wide promotions from this department
FROM employee_lifecycle.promotion_data p, total_employees t
GROUP BY p.department, t.total_employees
ORDER BY percent_promoted DESC;
