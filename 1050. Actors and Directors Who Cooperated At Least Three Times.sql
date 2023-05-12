-- https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/
WITH temp AS(
    SELECT actor_id, director_id, COUNT(*) AS count
    FROM ActorDirector
    GROUP BY actor_id, director_id
    HAVING count>=3
)
SELECT actor_id, director_id
FROM temp