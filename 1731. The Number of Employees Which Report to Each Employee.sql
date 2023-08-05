-- https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/
SELECT emp.employee_id,  emp.name, rep_count.reports_count, rep_count.average_age
FROM Employees emp
INNER JOIN 
  (SELECT reports_to, COUNT(reports_to) AS reports_count, ROUND(AVG(age)) AS average_age
  FROM Employees
  WHERE reports_to IS NOT NULL
  GROUP BY reports_to) rep_count
ON emp.employee_id = rep_count.reports_to
ORDER BY emp.employee_id