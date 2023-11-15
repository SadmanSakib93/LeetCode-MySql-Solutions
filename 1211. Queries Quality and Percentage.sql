-- https://leetcode.com/problems/queries-quality-and-percentage/
SELECT q.query_name, ROUND(AVG(q.rating/q.position), 2) AS quality,
ROUND(((SELECT COUNT(*) FROM Queries WHERE query_name=q.query_name AND rating<3)/(SELECT COUNT(*) FROM Queries WHERE query_name=q.query_name)*100), 2) AS poor_query_percentage
FROM Queries q
GROUP BY q.query_name