SELECT * FROM subject;
SELECT * FROM mark;

SELECT * FROM subject WHERE Credit = (SELECT MAX(Credit) FROM subject);

SELECT subject.SubName FROM subject
JOIN mark ON mark.SubId = subject.SubId
WHERE mark.Mark = (SELECT MAX(Mark) FROM mark)
GROUP BY SubName;

SELECT s.StudentId, s.StudentName, AVG(m.Mark) AS AVG_MarK FROM student s
LEFT JOIN mark m ON (m.StudentID = s.StudentID)
GROUP BY s.StudentID, s.StudentName
ORDER BY AVG_Mark DESC;
