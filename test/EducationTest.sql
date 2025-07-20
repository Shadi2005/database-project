-- Get Student Exam

INSERT INTO Education.Exam (offered_course_id, exam_type, exam_date, room_id) VALUES
(2, 'Midterm', '2023-11-20', 1),
(4, 'Midterm', '2023-11-22', 3),
(2, 'Final', '2024-01-15', 1),
(4, 'Final', '2024-01-17', 3);
GO

SELECT * FROM Education.GetStudentExams(202311001);
GO

----------------------------------------------------------------------------------

-- Term GPA

SELECT Education.TermGPA(202311001, 2023, 'Fall') AS GpaFall2023;

SELECT E.grade, C.credits
FROM Education.Enrollment E
JOIN Education.Offered_Course OC ON E.offered_course_id = OC.offered_course_id
JOIN Education.Course C ON OC.course_id = C.course_id
WHERE E.student_id = 202311001 AND OC.semester_id = 3;

-- Expected GPA: (17*3 + 18*3 + 14.5*4 + 16*1 + 16.25*2 + 19.9*1 + 18.5*2 + 17*2) / (3+3+4+1+2+1+2+2) = 16.80

SELECT Education.TermGPA(202311003, 2024, 'Fall') AS GpaFall2024;

SELECT E.grade, C.credits
FROM Education.Enrollment E
JOIN Education.Offered_Course OC ON E.offered_course_id = OC.offered_course_id
JOIN Education.Course C ON OC.course_id = C.course_id
WHERE E.student_id = 202311003 AND OC.semester_id = 5;

-- Expected GPA: (11.5*3 + 10*3 + 11*3 + 12.5*1 + 10.75*2 + 10.25*1) / (3+3+3+1+2+1) = 11.09

----------------------------------------------------------------------------------

-- Total GPA

SELECT Education.TotalGPA(202311001) AS TotalGPA_Student1;

SELECT Education.TotalGPA(202311002) AS TotalGPA_Student2;

----------------------------------------------------------------------------------

-- Total Passed Credit

-- case 1 : 
SELECT Education.TotalPassedCredits(202311001) AS PassedCredits_Student1;
GO

INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade)
VALUES (202311001, 227, '2025-02-07', '8.5');
GO

SELECT Education.TotalPassedCredits(202311001) AS PassedCredits_Student1;
Go

delete from education.enrollment where student_id = 202311001 and offered_course_id = 227;

-- case 2 : 
SELECT Education.TotalPassedCredits(202311001) AS PassedCredits_Student1;
GO

INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade)
VALUES (202311001, 227, '2025-02-07', '20');
GO

SELECT Education.TotalPassedCredits(202311001) AS PassedCredits_Student1;
Go

delete from education.enrollment where student_id = 202311001 and offered_course_id = 227;

----------------------------------------------------------------------------------

-- Recommonded Courses

-- case 1 : 
SELECT Education.TotalGPA(202311001); 
SELECT * FROM Education.RecommendCourses(202311001);  

--case 2:
SELECT Education.TotalGPA(202311003); 
SELECT * FROM Education.RecommendCourses(202311003); 

--case 3: 
SELECT Education.TotalGPA(202311004); 
SELECT * FROM Education.RecommendCourses(202311004);

----------------------------------------------------------------------------------

-- Report 110

-- Test 1: Get all reports without any filters
EXEC Education.Report_110;

-- Test 2: Filter by a specific year and term
EXEC Education.Report_110 @year_ = 2023, @term_ = 'Fall';

-- Test 3: Filter by course title
EXEC Education.Report_110 @course_title_ = 'Mathematics 1';

-- Test 4: Filter by instructor name
EXEC Education.Report_110 @instructor_fname_ = 'Bahram', @instructor_lname_ = 'Adeli';

-- Test 5: Filter by department name
EXEC Education.Report_110 @deptname = 'Mathematical Sciences';

-- Test 6: Test a combination of multiple filters
EXEC Education.Report_110 @year_ = 2023, @term_ = 'Fall', @deptname = 'Electrical and Computer Engineering';

----------------------------------------------------------------------------------

-- Term Grades

EXEC Education.StudentTermGrades @student_id = 202311001, @year = 2023, @term = 'Fall';

EXEC Education.StudentTermGrades @student_id = 202311001;

----------------------------------------------------------------------------------

-- Set Grade

-- Test 1: Attempt to set an invalid grade (outside the 0-20 range)
EXEC Education.SetGrade @student_id = 202311004, @course_id = 21, @term = 'Fall', @year = 2023, @grade = 25, @instructor_id = 72;
-- An error message is expected to be printed

-- Test 2: Attempt to set a grade by an instructor who does not teach the course
EXEC Education.SetGrade @student_id = 202311004, @course_id = 21, @term = 'Fall', @year = 2023, @grade = 18, @instructor_id = 1; -- Incorrect instructor
-- An error message is expected to be printed

-- Test 3: Successful grade setting
EXEC Education.SetGrade @student_id = 202311004, @course_id = 21, @term = 'Fall', @year = 2023, @grade = 17.5, @instructor_id = 72; -- Correct instructor
-- A success message is expected to be printed

-- Verify the result
SELECT grade FROM Education.Enrollment WHERE student_id = 202311004 AND offered_course_id = 2;

----------------------------------------------------------------------------------

-- Enroll Course

UPDATE Education.Semester SET start_date = DATEADD(month, -2, GETDATE()), end_date = DATEADD(month, 2, GETDATE()) WHERE semester_id = 6;

-- Test 1: Successful enrollment for a student with a high GPA
EXEC Education.EnrollCourse @student_id = 202311001, @offered_course_id = 219;

delete from Education.Enrollment WHERE student_id = 202311001 AND offered_course_id = 219;

EXEC Education.EnrollCourse @student_id = 202311001, @offered_course_id = 219;

-- Test 2: Attempting to enroll in a course with a schedule conflict
-- Course 220 and 252 have a time conflict (both on even days, 8 o'clock)
delete from Education.Enrollment WHERE student_id = 202311001 AND offered_course_id = 220;
EXEC Education.EnrollCourse @student_id = 202311001, @offered_course_id = 220; -- Success
EXEC Education.EnrollCourse @student_id = 202311001, @offered_course_id = 252; -- Error: Schedule conflict
-- A schedule conflict error message should be printed

-- Test 3: Attempting to exceed the maximum allowed credits
-- Student 202311003 has a GPA below 12 (14-credit limit)
-- We enroll the student in several courses to get close to the limit
SELECT Education.TotalGPA(202311004) AS TotalGPA_Student1; --12.01 > 12 So The Student Can Enrolle Up To 20 Credits

EXEC Education.EnrollCourse @student_id = 202311004, @offered_course_id = 223; -- 3 credits
EXEC Education.EnrollCourse @student_id = 202311004, @offered_course_id = 224; -- 3 credits
EXEC Education.EnrollCourse @student_id = 202311004, @offered_course_id = 225; -- 2 credits
EXEC Education.EnrollCourse @student_id = 202311004, @offered_course_id = 226; -- 3 credits
EXEC Education.EnrollCourse @student_id = 202311004, @offered_course_id = 229; -- 2 credits
EXEC Education.EnrollCourse @student_id = 202311004, @offered_course_id = 230; -- 3 credits

delete from Education.Enrollment WHERE student_id = 202311004 AND offered_course_id = 223;
delete from Education.Enrollment WHERE student_id = 202311004 AND offered_course_id = 224;
delete from Education.Enrollment WHERE student_id = 202311004 AND offered_course_id = 225;
delete from Education.Enrollment WHERE student_id = 202311004 AND offered_course_id = 226;
delete from Education.Enrollment WHERE student_id = 202311004 AND offered_course_id = 229;
delete from Education.Enrollment WHERE student_id = 202311004 AND offered_course_id = 230;

EXEC Education.SetGrade @student_id = 202311004, @course_id = 21, @term = 'Fall', @year = 2023, @grade = 11, @instructor_id = 72;
SELECT Education.TotalGPA(202311004) AS TotalGPA_Student1;

EXEC Education.EnrollCourse @student_id = 202311004, @offered_course_id = 223;
EXEC Education.EnrollCourse @student_id = 202311004, @offered_course_id = 224;
EXEC Education.EnrollCourse @student_id = 202311004, @offered_course_id = 225;
EXEC Education.EnrollCourse @student_id = 202311004, @offered_course_id = 226;
EXEC Education.EnrollCourse @student_id = 202311004, @offered_course_id = 228; 
EXEC Education.EnrollCourse @student_id = 202311004, @offered_course_id = 229; 
EXEC Education.EnrollCourse @student_id = 202311004, @offered_course_id = 230; -- Error: Exceeds the 14-credit limit

----------------------------------------------------------------------------------

-- Remove Student From Course

-- Test 1: Attempt to remove by the wrong instructor
EXEC Education.RemoveStudentFromCourse @instructor_id = 1, @student_id = 202311001, @course_id = 21;
-- An error message is expected to be printed

select * from education.offered_course where offered_course_id = 219
-- Test 2: Successful removal by the correct instructor
-- Correct test case using the actual data for offered_course_id = 219
EXEC Education.RemoveStudentFromCourse @instructor_id = 63, @student_id = 202311001, @course_id = 47;-- A success message is expected to be printed

-- Verify the result
SELECT * FROM Education.Enrollment WHERE student_id = 202311001 AND offered_course_id = 219;
-- This query should not return any records

----------------------------------------------------------------------------------

-- Check Graduation

SELECT Education.CheckGraduationStatus(202111001) AS Eligible_For_Graduation;
SELECT student_status FROM Education.Student WHERE student_id = 202111001;
EXEC Education.SetGrade @student_id = 202111001, @course_id = 111, @term = 'Spring', @year = 2025, @grade = 19.5, @instructor_id = 138; 
SELECT student_status FROM Education.Student WHERE student_id = 202111001;
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date)
VALUES (202111001, 650, '2023-02-06');
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date)
VALUES (202111001, 657, '2023-02-06');
EXEC Education.SetGrade @student_id = 202111001, @course_id = 47, @term = 'Spring', @year = 2023, @grade = 18.5,@instructor_id = 63;
EXEC Education.SetGrade @student_id = 202111001, @course_id = 1, @term = 'Spring', @year = 2023, @grade = 17.0, @instructor_id = 134;
SELECT student_status FROM Education.Student WHERE student_id = 202111001;


----------------------------------------------------------------------------------

-- Check Expelee

SELECT Education.TermGPA(202311005, 2024, 'Fall') AS GpaFall2023; --10.90

SELECT student_status FROM Education.Student WHERE student_id = 202311005;


EXEC Education.SetGrade @student_id = 202311005, @course_id = 47, @term = 'Spring', @year = 2025, @grade = 11, @instructor_id = 63; 
SELECT student_status FROM Education.Student WHERE student_id = 202311005;

EXEC Education.SetGrade @student_id = 202311005, @course_id = 51, @term = 'Spring', @year = 2025, @grade = 11, @instructor_id = 64; 
SELECT student_status FROM Education.Student WHERE student_id = 202311005;

EXEC Education.SetGrade @student_id = 202311005, @course_id = 49, @term = 'Spring', @year = 2025, @grade = 11, @instructor_id = 66;
SELECT student_status FROM Education.Student WHERE student_id = 202311005;

EXEC Education.SetGrade @student_id = 202311005, @course_id = 81, @term = 'Spring', @year = 2025, @grade = 11, @instructor_id = 67;
SELECT student_status FROM Education.Student WHERE student_id = 202311005;

EXEC Education.SetGrade @student_id = 202311005, @course_id = 14, @term = 'Spring', @year = 2025, @grade = 11, @instructor_id = 122; 
SELECT student_status FROM Education.Student WHERE student_id = 202311005;

SELECT Education.TermGPA(202311005, 2025, 'Spring') AS GpaFall2023;-- 11

----------------------------------------------------------------------------------

-- Assign TA

delete from Education.TA_Course_Assignment
SELECT student_status FROM Education.Student WHERE student_id = 202311005;

-- Test 1: Assign an ACTIVE student (Should succeed)
EXEC Education.AssignTA @assigning_instructor_id = 68, @student_id_for_ta = 202111002,@offered_course_id = 38;
GO

-- Test 2: Assign a GRADUATED student (Should succeed)
EXEC Education.AssignTA @assigning_instructor_id = 68, @student_id_for_ta = 202111001, @offered_course_id = 38;
GO

-- Test 3: Assign an EXPELLED student (Should fail and print an error)
UPDATE Education.Student SET student_status = 'Expelled' WHERE student_id = 202311005;
GO
EXEC Education.AssignTA @assigning_instructor_id = 68, @student_id_for_ta = 202311005, @offered_course_id = 38;
GO

UPDATE Education.Student SET student_status = 'Active' WHERE student_id = 202311005;

----------------------------------------------------------------------------------

-- Logs 

select * from Education.Change_Log;

----------------------------------------------------------------------------------

-- Advisor

SELECT 
    ST.student_id,
    ST.first_name + ' ' + ST.last_name AS student_name,
    I.first_name + ' ' + I.last_name AS advisor_name,
    D.name AS department_name
FROM Education.Student ST
JOIN Education.Advisor A ON ST.student_id = A.student_id
JOIN Education.Instructor I ON A.instructor_id = I.instructor_id
JOIN Education.Department D ON I.department_id = D.department_id;