-- https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/
# Write your MySQL query statement below
WITH temp AS( SELECT customer_number, COUNT(customer_number) AS order_count
FROM Orders
GROUP BY customer_number)
SELECT customer_number
FROM temp
WHERE order_count=(SELECT MAX(order_count) FROM temp)