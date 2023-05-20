-- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
SELECT unique_id, name
FROM Employees emp
LEFT JOIN EmployeeUNI emp_uni ON emp.id=emp_uni.id