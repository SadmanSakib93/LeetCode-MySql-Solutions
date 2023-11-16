-- https://leetcode.com/problems/immediate-food-delivery-ii/
WITH CTE AS(
  SELECT *, ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS row_num,
  CASE
    WHEN order_date=customer_pref_delivery_date THEN 'yes'
    ELSE 'no'
  END AS is_immidiate
  FROM Delivery
)
SELECT ROUND(100 * (SELECT COUNT(*) FROM CTE
WHERE row_num=1 AND is_immidiate='yes') / (SELECT COUNT(DISTINCT customer_id) FROM CTE), 2) AS immediate_percentage