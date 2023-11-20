-- https://leetcode.com/problems/investments-in-2016/
# Write your MySQL query statement below
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance a
WHERE a.tiv_2015 IN (SELECT tiv_2015 FROM Insurance b WHERE a.pid!=b.pid) AND
(a.lat, a.lon) NOT IN (SELECT lat, lon FROM Insurance b WHERE a.pid!=b.pid)