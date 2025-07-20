 -- Education Schema Stroed Procedures

CREATE PROCEDURE Education.Report_110
    @year_ INT = NULL,
    @term_ VARCHAR(20) = NULL,
    @course_title_ VARCHAR(100) = NULL,
    @instructor_fname_ VARCHAR(50) = NULL,
    @instructor_lname_ VARCHAR(50) = NULL,
    @deptname VARCHAR(100) = NULL
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = '
    SELECT
        S.year,
        S.term,
        C.title AS course_title,
        OC.section_number,
        I.first_name + '' '' + I.last_name AS instructor_name,
        R.room_number AS class_room,
        B.name AS class_building,
        STRING_AGG(ST.first_name + '' '' + ST.last_name, '', '') AS ta_list,
        E.exam_type,
        E.exam_date,
        ER.room_number AS exam_room,
        EB.name AS exam_building

    FROM Education.Offered_Course OC
    JOIN Education.Course C ON OC.course_id = C.course_id
    JOIN Education.Semester S ON OC.semester_id = S.semester_id
    JOIN Education.Instructor I ON OC.instructor_id = I.instructor_id
    JOIN Education.Department D ON I.department_id = D.department_id
    JOIN Education.Room R ON OC.room_id = R.room_id
    JOIN Education.Building B ON R.building_id = B.building_id

    LEFT JOIN Education.TA_Course_Assignment TA ON TA.offered_course_id = OC.offered_course_id
    LEFT JOIN Education.Student ST ON TA.student_id = ST.student_id

    LEFT JOIN Education.Exam E ON E.offered_course_id = OC.offered_course_id
    LEFT JOIN Education.Room ER ON E.room_id = ER.room_id
    LEFT JOIN Education.Building EB ON ER.building_id = EB.building_id

    WHERE 1 = 1';

    IF @year_ IS NOT NULL
        SET @sql += ' AND S.year = @year_';
    IF @term_ IS NOT NULL
        SET @sql += ' AND S.term = @term_';
    IF @course_title_ IS NOT NULL
        SET @sql += ' AND C.title = @course_title_';
    IF @instructor_fname_ IS NOT NULL
        SET @sql += ' AND I.first_name = @instructor_fname_';
    IF @instructor_lname_ IS NOT NULL
        SET @sql += ' AND I.last_name = @instructor_lname_';
    IF @deptname IS NOT NULL
        SET @sql += ' AND D.name = @deptname';

    SET @sql += '
    GROUP BY
        S.year,
        S.term,
        C.title,
        OC.section_number,
        I.first_name,
        I.last_name,
        R.room_number,
        B.name,
        E.exam_type,
        E.exam_date,
        ER.room_number,
        EB.name

    ORDER BY
        S.year,
        S.term,
        C.title,
        OC.section_number;';

    EXEC sp_executesql
        @sql,
        N'@year_ INT, @term_ VARCHAR(20), @course_title_ VARCHAR(100), 
          @instructor_fname_ VARCHAR(50), @instructor_lname_ VARCHAR(50), @deptname VARCHAR(100)',
        @year_, @term_, @course_title_, @instructor_fname_, @instructor_lname_, @deptname;
END;
GO

CREATE PROCEDURE Education.StudentTermGrades
    @student_id INT,
    @year INT = NULL,
    @term VARCHAR(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @year IS NOT NULL AND @term IS NOT NULL
    BEGIN
        SELECT 
            C.title AS course_title,
            E.grade,
            C.credits
        FROM Education.Enrollment E
        JOIN Education.Offered_Course OC ON E.offered_course_id = OC.offered_course_id
        JOIN Education.Semester S ON OC.semester_id = S.semester_id
        JOIN Education.Course C ON OC.course_id = C.course_id
        WHERE E.student_id = @student_id
          AND S.year = @year
          AND S.term = @term;

        SELECT 
            Education.TermGPA(@student_id, @year, @term) AS Term_GPA;
    END
    ELSE
    BEGIN

        SELECT 
            S.year,  
            S.term,  
            STRING_AGG(C.title + ': ' + ISNULL(E.grade, 'N/A'), ', ') AS courses_and_grades,  
            Education.TermGPA(@student_id, S.year, S.term) AS term_gpa 
        FROM Education.Enrollment E
        JOIN Education.Offered_Course OC ON E.offered_course_id = OC.offered_course_id
        JOIN Education.Semester S ON OC.semester_id = S.semester_id
        JOIN Education.Course C ON OC.course_id = C.course_id
        WHERE E.student_id = @student_id
        GROUP BY S.year, S.term
        ORDER BY S.year, S.term;  
    END
END;
GO

CREATE PROCEDURE Education.RemoveStudentFromCourse
    @instructor_id INT,
    @student_id INT,
    @course_id INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @current_semester_id INT;

  
    SELECT TOP 1 @current_semester_id = semester_id
    FROM Education.Semester
    WHERE start_date <= GETDATE() AND end_date >= GETDATE();

    IF @current_semester_id IS NULL
    BEGIN
        PRINT 'Current semester not found.';
        RETURN;
    END

    IF NOT EXISTS (
        SELECT 1 FROM Education.Offered_Course
        WHERE instructor_id = @instructor_id
          AND course_id = @course_id
          AND semester_id = @current_semester_id
    )
    BEGIN
        PRINT 'Instructor does not teach this course in the current semester.';
        RETURN;
    END

    DELETE E
    FROM Education.Enrollment E
    JOIN Education.Offered_Course OC ON E.offered_course_id = OC.offered_course_id
    WHERE E.student_id = @student_id
      AND OC.course_id = @course_id
      AND OC.semester_id = @current_semester_id
      AND OC.instructor_id = @instructor_id;

    IF @@ROWCOUNT > 0
    BEGIN
        PRINT 'Student successfully removed from the course.';
    END
    ELSE
    BEGIN
        PRINT 'No matching enrollment found to remove. (Please check course/student/instructor details).';
    END
END;
GO

CREATE PROCEDURE Education.EnrollCourse
    @student_id INT,
    @offered_course_id INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalGPA NUMERIC(5,2) = Education.TotalGPA(@student_id);
    DECLARE @MaxCredits INT;

    IF @TotalGPA >= 17
        SET @MaxCredits = 24;
    ELSE IF @TotalGPA >= 12
        SET @MaxCredits = 20;
    ELSE
        SET @MaxCredits = 14;

    DECLARE @semester_id INT;
    SELECT @semester_id = semester_id
    FROM Education.Offered_Course
    WHERE offered_course_id = @offered_course_id;

    IF NOT EXISTS (
        SELECT 1 FROM Education.Semester
        WHERE semester_id = @semester_id
          AND start_date <= GETDATE()
          AND end_date >= GETDATE()
    )
    BEGIN
        PRINT 'The offered course is not in the current semester.';
        RETURN;
    END

    IF EXISTS (
        SELECT 1 FROM Education.Enrollment
        WHERE student_id = @student_id AND offered_course_id = @offered_course_id
    )
    BEGIN
        PRINT 'Student is already enrolled in this course.';
        RETURN;
    END

    IF Education.HasScheduleConflict(@student_id, @offered_course_id) = 1
    BEGIN
        PRINT 'Schedule conflict detected.';
        RETURN;
    END

    DECLARE @credits INT;
    SELECT @credits = C.credits
    FROM Education.Offered_Course OC
    JOIN Education.Course C ON OC.course_id = C.course_id
    WHERE OC.offered_course_id = @offered_course_id;

    DECLARE @current_credits INT;
    SELECT @current_credits = ISNULL(SUM(C.credits), 0)
    FROM Education.Enrollment E
    JOIN Education.Offered_Course OC ON E.offered_course_id = OC.offered_course_id
    JOIN Education.Course C ON OC.course_id = C.course_id
    WHERE E.student_id = @student_id AND OC.semester_id = @semester_id;

    IF @current_credits + @credits > @MaxCredits
    BEGIN
        PRINT 'Exceeds maximum allowed credits for this semester.';
        RETURN;
    END

    INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date)
    VALUES (@student_id, @offered_course_id, GETDATE());

    PRINT 'Enrollment successful.';
END;
GO

CREATE PROCEDURE Education.SetGrade
    @student_id INT,
    @course_id INT,
    @term VARCHAR(20),
    @year INT,
    @grade FLOAT,
    @instructor_id INT
AS
BEGIN
    SET NOCOUNT ON;

    IF @grade < 0 OR @grade > 20
    BEGIN
        PRINT 'Invalid grade. Grade must be between 0 and 20.';
        RETURN;
    END

    DECLARE @semester_id INT;
    SELECT @semester_id = semester_id
    FROM Education.Semester
    WHERE term = @term AND year = @year;

    IF @semester_id IS NULL
    BEGIN
        PRINT 'Semester not found.';
        RETURN;
    END

    DECLARE @offered_course_id INT;
    SELECT @offered_course_id = offered_course_id
    FROM Education.Offered_Course
    WHERE semester_id = @semester_id
      AND course_id = @course_id
      AND instructor_id = @instructor_id;

    IF @offered_course_id IS NULL
    BEGIN
        PRINT 'Instructor is not teaching this course in the specified semester.';
        RETURN;
    END

    IF EXISTS (
        SELECT 1
        FROM Education.Enrollment
        WHERE student_id = @student_id AND offered_course_id = @offered_course_id
    )
    BEGIN
        UPDATE Education.Enrollment
        SET grade = CAST(@grade AS VARCHAR(5))
        WHERE student_id = @student_id AND offered_course_id = @offered_course_id;

        PRINT 'Grade successfully recorded.';
    END
    ELSE
    BEGIN
        PRINT 'Student is not enrolled in this course.';
    END
END;
GO

CREATE PROCEDURE Education.AssignTA
    @assigning_instructor_id INT, 
    @student_id_for_ta INT,      
    @offered_course_id INT       
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (
        SELECT 1
        FROM Education.Offered_Course
        WHERE offered_course_id = @offered_course_id
          AND instructor_id = @assigning_instructor_id
    )
    BEGIN
        PRINT 'Error: You are not the instructor for this offered course and cannot assign a TA.';
        RETURN;
    END

    IF NOT EXISTS (
        SELECT 1
        FROM Education.Student
        WHERE student_id = @student_id_for_ta
          AND student_status IN ('Active', 'Graduated')
    )
    BEGIN
        PRINT 'Error: The selected student is not valid (must be Active or Graduated).';
        RETURN;
    END

    IF EXISTS (
        SELECT 1
        FROM Education.TA_Course_Assignment
        WHERE student_id = @student_id_for_ta
          AND offered_course_id = @offered_course_id
    )
    BEGIN
        PRINT 'Info: This student has already been assigned as a TA for this course.';
        RETURN;
    END

    INSERT INTO Education.TA_Course_Assignment (student_id, offered_course_id, assigned_by_instructor_id, assigned_date)
    VALUES (@student_id_for_ta, @offered_course_id, @assigning_instructor_id, GETDATE());

    PRINT 'Success: Student ' + CAST(@student_id_for_ta AS VARCHAR) + ' has been assigned as TA for offered course ' + CAST(@offered_course_id AS VARCHAR) + '.';

END;
GO


 -- Library Schema Stroed Procedures

CREATE PROCEDURE Library.BorrowBook
(
	@copy_id INT,
	@member_id INT
)
AS
BEGIN 

	IF EXISTS (
		SELECT 1 
		FROM Library.Borrowing 
		WHERE member_id = @member_id AND copy_id = @copy_id AND return_date IS NULL
	)
	BEGIN
		PRINT 'You already borrowed this copy.';
		RETURN;
	END

	IF EXISTS (SELECT 1 FROM Library.LibraryMember WHERE member_id = @member_id AND account_status = 'Active') AND
	   Library.CountMemberBorrowedBooks(@member_id) < 3 
	BEGIN
		INSERT INTO Library.Borrowing (copy_id, member_id, borrow_date, due_date, return_date, fines_applied)
			VALUES (@copy_id, @member_id, GETDATE(), DATEADD(WEEK, 1, GETDATE()), NULL, 0);

	END
	ELSE
	BEGIN
		PRINT 'Cannot borrow book: Member account is not active or Member has borrowed maximum of 3 books.';
	END
END;
GO 

CREATE PROCEDURE Library.ReserveBook
(
	@copy_id INT,
	@member_id INT
)
AS
BEGIN 

	IF EXISTS (SELECT 1 FROM Library.BookCopy WHERE copy_id = @copy_id AND status = 'Available') AND
	   EXISTS (SELECT 1 FROM Library.LibraryMember WHERE member_id = @member_id AND account_status = 'Active') AND
	   Library.CountMemberReservations(@member_id) < 5
	BEGIN
		INSERT INTO Library.Reservation (copy_id, member_id, reservation_date, status)
			VALUES (@copy_id, @member_id, GETDATE(), 'Pending');
	END
	ELSE
	BEGIN
		PRINT 'Cannot reserve book: Book is not available or Member account is not active or Member has reserved maximum of 5 books.';
	END
END;
GO 

CREATE PROCEDURE Library.ReturnBook
(
    @copy_id INT,
    @member_id INT
)
AS
BEGIN
    DECLARE @fine NUMERIC(5,2) = 0;
    DECLARE @borrowing_id INT;

    SELECT TOP 1 @fine = 
        CASE 
            WHEN due_date < GETDATE() THEN 2 * DATEDIFF(DAY, due_date, GETDATE()) 
            ELSE 0 
        END,
        @borrowing_id = borrowing_id
    FROM Library.Borrowing
    WHERE copy_id = @copy_id AND member_id = @member_id AND return_date IS NULL;

    IF @borrowing_id IS NULL
    BEGIN
        PRINT 'No active borrowing found for this member and copy.';
        RETURN;
    END

    UPDATE Library.Borrowing
    SET return_date = GETDATE(),
        fines_applied = @fine
    WHERE borrowing_id = @borrowing_id;

    UPDATE Library.BookCopy
    SET status = 'Available'
    WHERE copy_id = @copy_id;

END;
GO

CREATE PROCEDURE Library.MarkOverdueAsLost
AS
BEGIN
    UPDATE BC
    SET status = 'Lost'
    FROM Library.BookCopy BC
    JOIN Library.Borrowing B ON B.copy_id = BC.copy_id
    WHERE 
        B.return_date IS NULL
        AND DATEDIFF(DAY, B.due_date, GETDATE()) > 60;
END;
GO

CREATE PROCEDURE Library.BookSuggestion (@member_id INT)
AS
BEGIN
    WITH TargetMemberBooks AS (
        SELECT BC.book_id
        FROM Library.Borrowing B
        JOIN Library.BookCopy BC ON B.copy_id = BC.copy_id
        WHERE B.member_id = @member_id
    ),

    SimilarMembers AS (
        SELECT B.member_id
        FROM Library.Borrowing B
        JOIN Library.BookCopy BC ON B.copy_id = BC.copy_id
        WHERE BC.book_id IN (SELECT book_id FROM TargetMemberBooks)
          AND B.member_id <> @member_id
        GROUP BY B.member_id
        HAVING COUNT(DISTINCT BC.book_id) >= 2
    ),

    SuggestedBooks AS (
        SELECT BC.book_id
        FROM Library.Borrowing B
        JOIN Library.BookCopy BC ON B.copy_id = BC.copy_id
        WHERE B.member_id IN (SELECT member_id FROM SimilarMembers)
          AND BC.book_id NOT IN (SELECT book_id FROM TargetMemberBooks)
    )

    SELECT TOP 3 SB.book_id, COUNT(*) AS Frequency
    FROM SuggestedBooks SB
    GROUP BY SB.book_id
    ORDER BY Frequency DESC;
END;
GO


