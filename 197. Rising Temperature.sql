-- https://leetcode.com/problems/rising-temperature/
WITH temp AS(
    SELECT *, 
            LAG(temperature, 1) OVER(ORDER BY recordDate) AS previous_temp,
            LAG(recordDate, 1) OVER() AS previous_date
    FROM Weather
)
SELECT id 
FROM temp
WHERE temperature>previous_temp AND DATEDIFF(recordDate, previous_date)=1