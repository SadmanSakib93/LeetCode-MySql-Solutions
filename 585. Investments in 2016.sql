-- https://leetcode.com/problems/investments-in-2016/
SELECT SUM(tiv_2016) AS tiv_2016
FROM Insurance a
WHERE a.tiv_2015 IN (SELECT tiv_2015 FROM Insurance b WHERE a.pid!=b.pid) AND
a.lat NOT IN (SELECT lat FROM Insurance b WHERE a.pid!=b.pid) AND
a.lon NOT IN (SELECT lon FROM Insurance b WHERE a.pid!=b.pid) 