-- https://leetcode.com/problems/average-selling-price/
SELECT p.product_id, ROUND(SUM(p.price*us.units)/SUM(us.units), 2) AS average_price
FROM Prices p
INNER JOIN UnitsSold us ON p.product_id = us.product_id
WHERE us.purchase_date>=p.start_date AND us.purchase_date<=p.end_date 
GROUP BY p.product_id 