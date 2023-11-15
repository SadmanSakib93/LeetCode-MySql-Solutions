-- https://leetcode.com/problems/triangle-judgement/
SELECT x,y,z, 
CASE 
    WHEN x+y>z AND x+z>y AND z+y>x THEN 'Yes'
    ELSE 'No'
END AS triangle
FROM Triangle