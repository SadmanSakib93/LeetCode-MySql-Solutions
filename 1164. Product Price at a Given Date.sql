-- https://leetcode.com/problems/product-price-at-a-given-date/
WITH cte_filtered_products AS(
  SELECT *,
  ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS row_num
  FROM Products
  WHERE change_date <= '2019-08-16'
),
cte_10 AS(
  SELECT DISTINCT product_id, 10 AS price
  FROM Products
  WHERE product_id NOT IN(
    SELECT product_id
    FROM cte_filtered_products
    GROUP BY product_id
  )
)
SELECT product_id, new_price AS price
FROM cte_filtered_products
GROUP BY product_id
UNION ALL
SELECT * FROM cte_10