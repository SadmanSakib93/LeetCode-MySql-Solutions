-- https://leetcode.com/problems/biggest-single-number/
SELECT MAX(single_max) AS num
FROM (SELECT MAX(num) AS single_max
  FROM MyNumbers
  GROUP BY num
  HAVING COUNT(num)=1
) single_max_numbers