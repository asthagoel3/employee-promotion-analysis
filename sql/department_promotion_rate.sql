WITH total_employees AS (
  SELECT count(p.employee_id) AS total_employees FROM employee_lifecycle.promotion_data p
)
SELECT total_employees, COUNT(p.employee_id) AS num_employees, p.department,
SUM(p.is_promoted) AS num_promoted,
ROUND(SAFE_DIVIDE(SUM(p.is_promoted), COUNT(p.employee_id)) * 100, 2) AS percent_promoted
FROM employee_lifecycle.promotion_data p, total_employees t
GROUP BY p.department, t.total_employees
ORDER BY percent_promoted DESC
