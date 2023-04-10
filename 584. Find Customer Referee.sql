-- https://leetcode.com/problems/find-customer-referee/
SELECT name
FROM Customer
WHERE referee_id!=2 or referee_id is null