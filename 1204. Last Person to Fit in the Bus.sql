-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/
WITH cte_rolling_sum AS(
  SELECT *,
  SUM(weight) OVER(ORDER BY turn) AS total_weight
  FROM Queue
)
SELECT person_name FROM cte_rolling_sum
WHERE total_weight<=1000
ORDER BY total_weight DESC
LIMIT 1