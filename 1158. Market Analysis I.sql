-- https://leetcode.com/problems/market-analysis-i/
WITH orders_2019 AS(
    SELECT u.user_id AS buyer_id, u.join_date, COUNT(o.item_id) AS orders_in_2019
    FROM Users u
    LEFT JOIN Orders o ON u.user_id = o.buyer_id
    WHERE o.order_date >= '2019-01-01' AND o.order_date <= '2019-12-31'
    GROUP BY buyer_id, u.join_date
)
SELECT u.user_id AS buyer_id, u.join_date, coalesce(orders_in_2019, 0) AS orders_in_2019
FROM Users u
LEFT JOIN orders_2019 o ON u.user_id = o.buyer_id