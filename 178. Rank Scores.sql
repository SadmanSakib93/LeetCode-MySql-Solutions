-- https://leetcode.com/problems/nth-highest-salary/
SELECT score, DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores