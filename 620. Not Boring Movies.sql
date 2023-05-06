-- https://leetcode.com/problems/not-boring-movies/
SELECT id, movie, description, rating
FROM Cinema
WHERE id%2=1 AND description NOT LIKE "boring"
ORDER BY rating DESC
