-- https://leetcode.com/problems/delete-duplicate-emails/
DELETE t1 
FROM Person t1
JOIN Person t2
ON t2.email = t1.email
AND t2.id < t1.id