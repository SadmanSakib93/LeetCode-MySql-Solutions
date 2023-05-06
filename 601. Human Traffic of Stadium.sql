-- https://leetcode.com/problems/human-traffic-of-stadium/
WITH people_more_than_100 AS(
    SELECT *, LAG(id, 1) OVER() AS prev_id, LEAD(id, 1) OVER() AS next_id 
    FROM Stadium 
    WHERE people>=100
),
temp_res AS(
    SELECT *, COALESCE(id-prev_id, 0) AS prev_id_diff, COALESCE(id-next_id, 0) AS next_id_diff, COALESCE(next_id-prev_id, 0) AS prev_next_id_diff
    FROM people_more_than_100
),
temp_res_2 AS(
    SELECT id AS id1, id+1 AS id2, id-1 AS id3
    FROM temp_res
    WHERE prev_id_diff=1 AND next_id_diff=-1
)
SELECT *
FROM Stadium
WHERE id IN(
    SELECT id1 FROM temp_res_2
    UNION
    SELECT id2 FROM temp_res_2
    UNION
    SELECT id3 FROM temp_res_2
    ORDER BY id1
)