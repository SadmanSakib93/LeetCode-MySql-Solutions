-- https://leetcode.com/problems/department-highest-salary/
WITH unique_max_salary_by_dept AS (
    SELECT max(salary) AS maxSalary,  departmentId
    FROM Employee e
    GROUP BY DepartmentId
)
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM Employee e
INNER JOIN unique_max_salary_by_dept a ON (e.departmentId=a.departmentId AND e.salary=a.maxSalary)
INNER JOIN Department d ON (e.departmentId=d.id)