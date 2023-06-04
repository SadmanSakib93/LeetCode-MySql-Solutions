-- https://leetcode.com/problems/list-the-products-ordered-in-a-period/
SELECT product_name, SUM(unit) AS unit
FROM Orders o
INNER JOIN Products p ON o.product_id=p.product_id
WHERE order_date>='2020-02-01' AND order_date<'2020-03-01'
GROUP BY product_name
HAVING unit>=100
