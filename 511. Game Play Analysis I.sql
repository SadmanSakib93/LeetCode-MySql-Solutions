-- https://leetcode.com/problems/trips-and-users/description/
SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id