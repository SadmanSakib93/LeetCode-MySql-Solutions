-- https://leetcode.com/problems/employees-earning-more-than-their-managers/
SELECT e.name AS Employee
FROM Employee e
INNER JOIN Employee m ON m.id=e.managerId
WHERE e.salary>m.salary