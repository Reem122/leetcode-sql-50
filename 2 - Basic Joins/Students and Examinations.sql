SELECT S.student_id, S.student_name, B.subject_name, COUNT(E.subject_name) AS attended_exams
FROM Subjects AS B CROSS JOIN Students AS S
FULL OUTER JOIN Examinations AS E
ON S.student_id = E.student_id AND B.subject_name = E.subject_name
GROUP BY S.student_id, S.student_name, B.subject_name