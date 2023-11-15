-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
SELECT name
FROM Employee emp
INNER JOIN (SELECT managerId, COUNT(managerId) AS report_count
            FROM Employee
            GROUP BY managerId) rc ON emp.id = rc.managerId
WHERE rc.report_count>=5