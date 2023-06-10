-- https://leetcode.com/problems/primary-department-for-each-employee/
WITH emp_with_one_dep AS(
  SELECT employee_id, department_id
  FROM Employee
  GROUP BY employee_id
  HAVING COUNT(*)=1
)
SELECT employee_id, department_id
FROM Employee
WHERE employee_id NOT IN (SELECT employee_id FROM emp_with_one_dep) AND
primary_flag = 'Y'
UNION ALL
SELECT * FROM emp_with_one_dep