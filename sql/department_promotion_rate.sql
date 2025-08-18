-- Promotion analysis by department
-- This query calculates:
-- 1) Department headcount
-- 2) Number of employees promoted in each department
-- 3) Promotion rate within the department (# promoted ÷ # in dept)
-- 4) Share of total company promotions coming from that department (# promoted in dept ÷ total company promoted)

WITH company_totals AS (
  SELECT 
    COUNT(employee_id) AS total_employees,       -- Total employees in company
    SUM(is_promoted) AS total_promotions         -- Total number of promotions in company
  FROM employee_lifecycle.promotion_data
),
dept_totals AS (
  SELECT 
    department,
    COUNT(employee_id) AS dept_employees,        -- Headcount per department
    SUM(is_promoted) AS dept_promotions          -- Promotions per department
  FROM employee_lifecycle.promotion_data
  GROUP BY department
)

SELECT 
  d.department,
  d.dept_employees,
  d.dept_promotions,
  SAFE_DIVIDE(d.dept_promotions, d.dept_employees) * 100 AS promotion_rate_within_dept,   -- % of employees in dept who were promoted
  SAFE_DIVIDE(d.dept_promotions, c.total_promotions) * 100 AS share_of_total_promotions    -- % of company promotions that came from this dept
FROM dept_totals d
CROSS JOIN company_totals c
ORDER BY promotion_rate_within_dept DESC;
