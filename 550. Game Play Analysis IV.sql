-- https://leetcode.com/problems/game-play-analysis-iv/
WITH CTE AS(
  SELECT *,
  LEAD(event_date, 1) OVER(PARTITION BY player_id ORDER BY event_date) AS next_login,
  ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) AS login_no
  FROM Activity
)
SELECT ROUND(((SELECT COUNT(DISTINCT player_id)
FROM CTE
WHERE DATEDIFF(next_login, event_date)=1 AND login_no=1)/(SELECT COUNT(DISTINCT player_id)
FROM Activity)), 2) AS fraction
