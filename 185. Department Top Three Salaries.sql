-- https://leetcode.com/problems/department-top-three-salaries/
WITH Employee_temp_1 AS(
    SELECT e.name AS Employee, e.salary AS Salary, e.departmentId, d.name AS Department
    FROM Employee e
    INNER JOIN Department d ON e.departmentId=d.id
),
Employee_temp_2 AS(
    SELECT Department, Employee, Salary, DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS Salary_rank
    FROM Employee_temp_1
)
SELECT Department, Employee, Salary
FROM Employee_temp_2
WHERE Salary_rank<=3
