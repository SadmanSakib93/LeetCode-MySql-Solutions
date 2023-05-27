-- https://leetcode.com/problems/patients-with-a-condition/
SELECT *
FROM Patients
WHERE conditions LIKE '%DIAB1%' AND conditions NOT IN ('SADIAB100')
