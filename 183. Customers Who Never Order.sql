-- https://leetcode.com/problems/customers-who-never-order/
SELECT name as Customers
FROM Customers
WHERE id NOT IN (SELECT DISTINCT customerId FROM Orders)