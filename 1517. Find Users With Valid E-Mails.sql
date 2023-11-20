-- https://leetcode.com/problems/find-users-with-valid-e-mails/
SELECT user_id, name, mail
FROM users
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com$'