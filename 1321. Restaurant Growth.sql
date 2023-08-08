-- https://leetcode.com/problems/restaurant-growth/
# Write your MySQL query statement below
WITH RECURSIVE all_date AS (
    SELECT MIN(visited_on) AS date
    FROM Customer
    UNION ALL
    SELECT ADDDATE(date, INTERVAL 1 DAY)
    FROM all_date 
    WHERE ADDDATE(date, INTERVAL 1 DAY) <= (SELECT MAX(visited_on) FROM Customer)
),
all_date_amount AS(
  SELECT date, amount
  FROM all_date ad
  LEFT JOIN Customer c ON ad.date = c.visited_on
),
output_cte AS(
  SELECT date, SUM(amount) OVER(ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount
  # AVG(amount) OVER(ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS average_amount
  FROM (SELECT date, SUM(amount) AS amount FROM all_date_amount GROUP BY date) date_wise_amount_sum
)
SELECT date AS visited_on, amount, ROUND(amount/7, 2) AS average_amount FROM output_cte
LIMIT 99999 OFFSET 6