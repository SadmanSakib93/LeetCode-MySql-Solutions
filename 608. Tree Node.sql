-- https://leetcode.com/problems/tree-node/
WITH root AS(
    SELECT id, 'Root' AS type
    FROM Tree
    WHERE p_id IS NULL
),
leaf AS(
    SELECT id, 'Leaf' AS type
    FROM Tree
    WHERE id NOT IN (SELECT id FROM root) AND id NOT IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL)
),
inner_t AS(
    SELECT id, 'Inner' AS type
    FROM Tree
    WHERE id NOT IN (
        (SELECT id FROM root)
        UNION 
        (SELECT id FROM leaf)
    )
)

(SELECT * FROM root)
UNION 
(SELECT * FROM leaf)
UNION
(SELECT * FROM inner_t)
