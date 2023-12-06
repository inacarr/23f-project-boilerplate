'''SELECT dueDate
FROM homeworkAssignment
JOIN onus.student s on s.studentId = homeworkAssignment.studentId
WHERE s.studentId ='''+ str(studentID);

SELECT homeworkSubmission.homeworkId, grade
FROM homeworkSubmission
JOIN onus.homeworkAssignment hA on homeworkSubmission.homeworkId = hA.homeworkId
Join onus.course c on hA.courseId = c.courseId
JOIN onus.section s on c.courseId = s.courseId
JOIN onus.studentSection sS on s.sectionId = sS.sectionId
JOIN onus.student s2 on s2.studentId = sS.studentId
WHERE s2.studentId = 7

