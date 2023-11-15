-- https://leetcode.com/problems/students-and-examinations/
SELECT std.student_id, std.student_name, sub.subject_name, COUNT(exam.subject_name) AS attended_exams
FROM Students std
JOIN Subjects sub
LEFT JOIN Examinations exam ON std.student_id = exam.student_id AND sub.subject_name = exam.subject_name
GROUP BY std.student_id, std.student_name, sub.subject_name 
ORDER BY std.student_id, sub.subject_name