-- https://leetcode.com/problems/sales-person/
SELECT s.name
FROM SalesPerson s
WHERE sales_id NOT IN (
    SELECT sales_id 
    FROM Orders 
    WHERE com_id=(SELECT com_id FROM Company WHERE name='RED')
)