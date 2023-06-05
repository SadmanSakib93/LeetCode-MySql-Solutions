-- https://leetcode.com/problems/customers-who-bought-all-products/
SELECT customer_id
FROM (SELECT DISTINCT * FROM Customer) AS Customer
GROUP BY customer_id
HAVING SUM(product_key) = (SELECT SUM(product_key) FROM Product)