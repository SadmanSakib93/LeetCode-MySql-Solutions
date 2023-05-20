-- https://leetcode.com/problems/reformat-department-table/
WITH temp AS(
    SELECT id,
    CASE WHEN month='Jan' THEN revenue END Jan_Revenue,
    CASE WHEN month='Feb' THEN revenue END Feb_Revenue,
    CASE WHEN month='Mar' THEN revenue END Mar_Revenue,
    CASE WHEN month='Apr' THEN revenue END Apr_Revenue,
    CASE WHEN month='May' THEN revenue END May_Revenue,
    CASE WHEN month='Jun' THEN revenue END Jun_Revenue,
    CASE WHEN month='Jul' THEN revenue END Jul_Revenue,
    CASE WHEN month='Aug' THEN revenue END Aug_Revenue,
    CASE WHEN month='Sep' THEN revenue END Sep_Revenue,
    CASE WHEN month='Oct' THEN revenue END Oct_Revenue,
    CASE WHEN month='Nov' THEN revenue END Nov_Revenue,
    CASE WHEN month='Dec' THEN revenue END Dec_Revenue
    FROM Department
)
SELECT a.id, 
SUM(Jan_Revenue) AS Jan_Revenue, 
SUM(Feb_Revenue) AS Feb_Revenue,
SUM(Mar_Revenue) AS Mar_Revenue,
SUM(Apr_Revenue) AS Apr_Revenue,
SUM(May_Revenue) AS May_Revenue,
SUM(Jun_Revenue) AS Jun_Revenue,
SUM(Jul_Revenue) AS Jul_Revenue,
SUM(Aug_Revenue) AS Aug_Revenue,
SUM(Sep_Revenue) AS Sep_Revenue,
SUM(Oct_Revenue) AS Oct_Revenue,
SUM(Nov_Revenue) AS Nov_Revenue,
SUM(Dec_Revenue) AS Dec_Revenue
FROM temp a
GROUP BY a.id