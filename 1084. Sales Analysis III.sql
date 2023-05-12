-- https://leetcode.com/problems/sales-analysis-iii/
WITH sold_in_range AS(
    SELECT product_id, sale_date
    FROM Sales
    WHERE sale_date>='2019-01-01' AND sale_date<='2019-03-31'
),
sold_not_in_range AS(
    SELECT product_id, sale_date
    FROM Sales
    WHERE sale_date<'2019-01-01' OR sale_date>'2019-03-31'
)
SELECT DISTINCT sir.product_id, p.product_name
FROM sold_in_range sir
INNER JOIN Product p ON sir.product_id=p.product_id
WHERE p.product_id NOT IN (SELECT product_id FROM sold_not_in_range)