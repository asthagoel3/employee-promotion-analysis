WITH total_employees AS (
  SELECT COUNT(p.employee_id) AS total_employees 
  FROM employee_lifecycle.promotion_data p
)
SELECT total_employees, p.department, COUNT(p.employee_id) AS num_employees,SAFE_DIVIDE(count(p.employee_id),t.total_employees)*100 AS percent_employees_per_department
FROM employee_lifecycle.promotion_data p, total_employees t
GROUP BY p.department, total_employees
ORDER BY percent_employees_per_department DESC
