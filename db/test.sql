'''SELECT dueDate
FROM homeworkAssignment
JOIN onus.student s on s.studentId = homeworkAssignment.studentId
WHERE s.studentId ='''+ str(studentID);

SELECT dueDate
FROM homeworkAssignment
JOIN onus.student s on s.studentId = homeworkAssignment.studentId
WHERE s.studentId = 7