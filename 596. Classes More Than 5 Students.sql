-- https://leetcode.com/problems/classes-more-than-5-students/
WITH temp AS(
    SELECT class, COUNT(*) AS count
    FROM Courses
    GROUP BY class
)
SELECT class 
FROM temp
WHERE count>4