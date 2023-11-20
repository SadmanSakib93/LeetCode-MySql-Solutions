-- https://leetcode.com/problems/average-time-of-process-per-machine/
WITH reordered_activity AS(
  SELECT * FROM Activity ORDER BY machine_id, process_id
),

timestamp_calculated AS(
  SELECT *, 
  LAG(timestamp, 1) OVER (
          PARTITION BY machine_id, process_id
          ORDER BY activity_type
      ) processing_time
  FROM reordered_activity
)

SELECT machine_id, ROUND(AVG(timestamp-processing_time), 3) AS processing_time
FROM timestamp_calculated
WHERE activity_type='end'
GROUP BY machine_id