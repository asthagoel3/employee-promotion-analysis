-- Promotion analysis by gender
-- This query calculates:
-- 1) Gender headcount
-- 2) Number of employees promoted in each gender group
-- 3) Promotion rate within gender (# promoted ÷ # in gender)
-- 4) Share of total company promotions coming from that gender (# promoted in gender ÷ total company promoted)
-- This checks if gender differences exist in promotions


WITH company_totals AS (
  SELECT 
    COUNT(employee_id) AS total_employees,       -- Total employees in company
    SUM(is_promoted) AS total_promotions         -- Total number of promotions in company
  FROM employee_lifecycle.promotion_data
),
gender_totals AS (
  SELECT 
    gender,
    COUNT(employee_id) AS gender_employees,      -- Headcount per gender
    SUM(is_promoted) AS gender_promotions        -- Promotions per gender
  FROM employee_lifecycle.promotion_data
  GROUP BY gender
)

SELECT 
  g.gender,
  g.gender_employees,
  g.gender_promotions,
  SAFE_DIVIDE(g.gender_promotions, g.gender_employees) * 100 AS promotion_rate_within_gender,   -- % of employees in this gender promoted
  SAFE_DIVIDE(g.gender_promotions, c.total_promotions) * 100 AS share_of_total_promotions       -- % of all promotions that went to this gender
FROM gender_totals g
CROSS JOIN company_totals c
ORDER BY promotion_rate_within_gender DESC;
