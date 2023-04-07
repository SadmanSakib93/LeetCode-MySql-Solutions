-- https://leetcode.com/problems/consecutive-numbers/
WITH temp AS(
    SELECT num, 
    LAG(num, 1) OVER () prev_num, LAG(num, 2) OVER () prev_num_2
    FROM Logs
)

SELECT DISTINCT num AS ConsecutiveNums
FROM temp
WHERE num=prev_num AND num=prev_num_2
