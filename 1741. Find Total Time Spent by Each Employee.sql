-- https://leetcode.com/problems/count-salary-categories/
(SELECT "Low Salary" as category,
(SELECT COUNT(*)  FROM Accounts WHERE income < 20000) AS accounts_count)
UNION ALL
(SELECT "Average Salary" as category,
(SELECT COUNT(*)  FROM Accounts WHERE income >= 20000 and income <= 50000) as accounts_count)
UNION ALL 
(SELECT "High Salary" as category,
(SELECT COUNT(*)  FROM Accounts WHERE income > 50000) as accounts_count)
