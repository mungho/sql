USE quanlysinhvien;

SELECT * FROM student;
SELECT * FROM mark;
SELECT * FROM subject;
SELECT * FROM class;

-- Select students with the name start by 'h' character.
SELECT * FROM student WHERE StudentName LIKE 'h%';

-- Display class list that start from November
SELECT ClassName FROM class WHERE MONTH(StartDate) = 12;

SELECT * FROM subject WHERE Credit >= 3 AND Credit <= 5;

UPDATE student SET ClassID = 2 WHERE StudentName ='Hung';

Insert into student (StudentID, StudentName, Address, Phone, Status, ClassID)
Values (30, 'Mung', 'Hue', '0342345442', 1, 3);

Insert into mark (MarkId, SubId, StudentId, Mark, ExamTimes)
Values (9, 2, 30, 12, 1);

Select StudentName, SubName as SubjectName, Mark From student s
Left Join mark m On (s.StudentId = m.StudentId)
Left Join subject sj On m.SubID = sj.SubID
Order by Mark desc, StudentName asc;


