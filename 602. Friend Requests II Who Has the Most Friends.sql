-- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
SELECT a.id, COUNT(a.id) AS num
FROM (
  SELECT requester_id AS id
  FROM RequestAccepted
  UNION ALL
  SELECT accepter_id AS id
  FROM RequestAccepted
) a
GROUP BY id
ORDER BY num DESC
LIMIT 1