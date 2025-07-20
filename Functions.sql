-- Education Schema Functions

CREATE FUNCTION Education.GetStudentExams (
    @student_id INT
)
RETURNS TABLE
AS
RETURN (
    SELECT
        S.year,                            
        S.term,                            
        C.title AS course_title,           
        E.exam_type,                       
        E.exam_date,
        R.room_number AS exam_room,
        B.name AS exam_building

    FROM Education.Enrollment EN
    JOIN Education.Offered_Course OC ON EN.offered_course_id = OC.offered_course_id
    JOIN Education.Semester S ON OC.semester_id = S.semester_id
    JOIN Education.Course C ON OC.course_id = C.course_id
    JOIN Education.Exam E ON E.offered_course_id = OC.offered_course_id
    JOIN Education.Room R ON E.room_id = R.room_id
    JOIN Education.Building B ON R.building_id = B.building_id

    WHERE EN.student_id = @student_id
);
GO

CREATE FUNCTION Education.TermGPA
(
    @student_id INT,
    @year INT,
    @term VARCHAR(20)
)
RETURNS FLOAT
AS
BEGIN
    DECLARE @gpa FLOAT;

    SELECT 
        @gpa = SUM(TRY_CAST(E.grade AS FLOAT) * C.credits) * 1.0 / NULLIF(SUM(C.credits), 0)
    FROM Education.Enrollment E
    JOIN Education.Offered_Course OC ON E.offered_course_id = OC.offered_course_id
    JOIN Education.Course C ON OC.course_id = C.course_id
    JOIN Education.Semester S ON OC.semester_id = S.semester_id
    WHERE E.student_id = @student_id
      AND S.year = @year
      AND S.term = @term
      AND TRY_CAST(E.grade AS FLOAT) IS NOT NULL;

    RETURN @gpa;
END;
GO
 
CREATE FUNCTION Education.TotalGPA (@student_id INT)
RETURNS NUMERIC(5,2)
AS
BEGIN
    RETURN (
        SELECT 
            TRY_CAST(SUM(TRY_CAST(E.grade AS FLOAT) * C.credits) / NULLIF(SUM(C.credits), 0) AS NUMERIC(5,2))
        FROM Education.Enrollment E
        JOIN Education.Offered_Course OC ON E.offered_course_id = OC.offered_course_id
        JOIN Education.Course C ON OC.course_id = C.course_id
        WHERE 
            E.student_id = @student_id
            AND TRY_CAST(E.grade AS FLOAT) >= 10  -- فقط نمرات بالای 10
    );
END;
GO

CREATE FUNCTION Education.TotalPassedCredits (@student_id INT)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT SUM(C.credits)
        FROM Education.Enrollment E
        JOIN Education.Offered_Course OC ON E.offered_course_id = OC.offered_course_id
        JOIN Education.Course C ON OC.course_id = C.course_id
        WHERE 
            E.student_id = @student_id
            AND CAST(E.grade AS FLOAT) >= 10
    );
END;
GO

CREATE FUNCTION Education.RecommendCourses
(
    @student_id INT
)
RETURNS TABLE
AS
RETURN
(
    WITH StudentInfo AS (
        SELECT
            s.major_id,
            s.current_term_number,
            Education.TotalGPA(s.student_id) AS gpa
        FROM Education.Student s
        WHERE s.student_id = @student_id
    ),

    PassedCourses AS (
        SELECT oc.course_id
        FROM Education.Enrollment e
        JOIN Education.Offered_Course oc ON e.offered_course_id = oc.offered_course_id
        WHERE e.student_id = @student_id AND TRY_CAST(e.grade AS FLOAT) >= 10
    ),

    PotentialCourses AS (
        SELECT
            cu.course_id, c.title, c.credits, cu.suggested_term, cu.priority,
            CASE
                WHEN cu.suggested_term < si.current_term_number THEN 1
                WHEN cu.suggested_term = si.current_term_number THEN 2
                ELSE 3
            END AS priority_level
        FROM Education.Curriculum cu
        JOIN Education.Course c ON cu.course_id = c.course_id
        JOIN StudentInfo si ON cu.major_id = si.major_id
        LEFT JOIN Education.Prerequisite p ON cu.course_id = p.course_id
        LEFT JOIN PassedCourses pc ON p.prerequisite_course_id = pc.course_id
        WHERE cu.course_id NOT IN (SELECT course_id FROM PassedCourses)
        GROUP BY cu.course_id, c.title, c.credits, cu.suggested_term, cu.priority, si.current_term_number
        HAVING COUNT(p.prerequisite_course_id) = COUNT(pc.course_id)
    ),

    FilteredForDependencies AS (
        SELECT pot.*
        FROM PotentialCourses pot
        WHERE NOT EXISTS (
            SELECT 1
            FROM Education.Prerequisite p
            WHERE p.course_id = pot.course_id
              AND p.prerequisite_course_id IN (SELECT course_id FROM PotentialCourses)
        )
    ),

    RankedCourses AS (
        SELECT
            f.course_id, f.title, f.credits,
            SUM(f.credits) OVER (ORDER BY f.priority_level, f.suggested_term, f.priority) AS cumulative_credits
        FROM FilteredForDependencies f
    )

    SELECT
        r.course_id, r.title, r.credits
    FROM RankedCourses r
    CROSS JOIN StudentInfo si
    WHERE
        r.cumulative_credits <= (
            CASE
                WHEN si.gpa >= 17 THEN 24
                WHEN si.gpa < 12 THEN 14
                ELSE 20
            END
        )
);
GO

CREATE FUNCTION Education.HasScheduleConflict (
    @student_id INT,
    @offered_course_id INT
)
RETURNS BIT
AS
BEGIN
    DECLARE @conflict_exists BIT = 0;

    IF EXISTS (
        SELECT 1
        FROM Education.Enrollment E
        JOIN Education.Offered_Course OC1 ON E.offered_course_id = OC1.offered_course_id
        JOIN Education.Offered_Course OC2 ON OC2.offered_course_id = @offered_course_id
        WHERE 
            E.student_id = @student_id
            AND OC1.semester_id = OC2.semester_id
            AND OC1.class_day_type = OC2.class_day_type
            AND OC1.start_hour = OC2.start_hour
    )
        SET @conflict_exists = 1;

    RETURN @conflict_exists;
END;
GO

CREATE FUNCTION Education.CheckGraduationStatus
(
    @student_id INT
)
RETURNS BIT
AS
BEGIN
    DECLARE @is_graduated BIT = 0;

    IF NOT EXISTS (
        SELECT 1
        FROM Education.Curriculum CU
        WHERE 
            CU.is_optional = 0 
            AND CU.major_id = (SELECT major_id FROM Education.Student WHERE student_id = @student_id)
            AND CU.course_id NOT IN (
                SELECT OC.course_id
                FROM Education.Enrollment E
                JOIN Education.Offered_Course OC ON E.offered_course_id = OC.offered_course_id
                WHERE E.student_id = @student_id AND TRY_CAST(E.grade AS FLOAT) >= 10
            )
    )
    BEGIN
        DECLARE @passed_credits INT = (SELECT Education.TotalPassedCredits(@student_id));

        IF @passed_credits >= 140
        BEGIN
            SET @is_graduated = 1;
        END
    END

    RETURN @is_graduated;
END;
GO

CREATE FUNCTION Education.IsValidNationalID(@ID CHAR(10))
RETURNS INT
AS
BEGIN
	DECLARE @output INT, @c INT, @n INT, @r INT
	IF ( LEN(@ID) <> 10
		OR @ID = '0000000000' OR @ID = '1111111111' OR @ID = '2222222222' OR @ID = '3333333333' OR @ID = '4444444444'
		OR @ID = '5555555555' OR @ID = '6666666666' OR @ID = '7777777777' OR @ID = '8888888888' OR @ID = '9999999999' )
		BEGIN
			SET @output = 0
		END
	ELSE
		BEGIN
			SET @c = cast(substring(@ID, 10, 1) AS INT)
			SET @n =(cast(substring(@ID, 1, 1) AS INT) * 10)+
					(cast(substring(@ID, 2, 1) AS INT) * 9) +
					(cast(substring(@ID, 3, 1) AS INT) * 8) +
					(cast(substring(@ID, 4, 1) AS INT) * 7) +
					(cast(substring(@ID, 5, 1) AS INT) * 6) +
					(cast(substring(@ID, 6, 1) AS INT) * 5) +
					(cast(substring(@ID, 7, 1) AS INT) * 4) +
					(cast(substring(@ID, 8, 1) AS INT) * 3) +
					(cast(substring(@ID, 9, 1) AS INT) * 2)
			SET @r = @n % 11
			IF ( (@r = 0 AND @c = 0) OR (@r = 1 AND @c = 1) OR (@r > 1 AND @c = 11 - @r) )
				SET @output = 1
			ELSE
				SET @output = 0
		END

	RETURN @output
END;
GO


-- Library Shema Functions

CREATE FUNCTION Library.CountMemberBorrowedBooks (@member_id INT)
RETURNS INT
BEGIN
	DECLARE @borrowings INT;
	SET @borrowings = (
		SELECT COUNT(*)
		FROM Library.Borrowing
		WHERE Library.Borrowing.member_id = @member_id AND return_date IS NULL);
	RETURN @borrowings;
END;
GO

CREATE FUNCTION Library.CountMemberReservations (@member_id INT)
RETURNS INT
BEGIN
	DECLARE @reservations INT;
	SET @reservations = (
		SELECT COUNT(*)
		FROM Library.Reservation
		WHERE Library.Reservation.member_id = @member_id AND status = 'Pending');
	RETURN @reservations;
END;
GO

CREATE FUNCTION Library.CalculateMemberDebt (@member_id INT)
RETURNS NUMERIC(5,2)
BEGIN
	DECLARE @debt NUMERIC(5,2);
	
	SELECT @debt = SUM(fines_applied)
	FROM Library.Borrowing
	WHERE Library.Borrowing.member_id = @member_id AND fines_applied IS NOT NULL;

	RETURN @debt;
END;
GO			

CREATE FUNCTION Library.GetMemberBorrowedBooks (@member_id INT)
RETURNS TABLE
AS
RETURN
(
    SELECT DISTINCT C.title, A.borrow_date, A.due_date, A.return_date, A.fines_applied
    FROM Library.Borrowing AS A
    JOIN Library.BookCopy AS B ON A.copy_id = B.copy_id
    JOIN Library.Book AS C ON B.book_id = C.book_id
    WHERE A.member_id = @member_id 
);
GO

CREATE FUNCTION Library.GetMemberReservedBooks (@member_id INT)
RETURNS TABLE
AS
RETURN
(
	SELECT DISTINCT C.title, A.reservation_date, A.status
    FROM Library.Reservation AS A
    JOIN Library.BookCopy AS B ON A.copy_id = B.copy_id
    JOIN Library.Book AS C ON B.book_id = C.book_id
    WHERE A.member_id = @member_id 
);
GO 

CREATE FUNCTION Library.GetMemberFavoriteCategories (@member_id INT)
RETURNS TABLE
AS
RETURN
(
	SELECT TOP(3) WITH TIES CT.name, COUNT(*) AS CategoryRepeat
	FROM Library.Borrowing AS BR
	JOIN Library.BookCopy AS C ON BR.copy_id = C.copy_id
	JOIN Library.Book_Category AS BC ON C.book_id = BC.book_id
	JOIN Library.Category AS CT ON BC.category_id = CT.category_id
	WHERE BR.member_id = @member_id
	GROUP BY CT.name
	ORDER BY CategoryRepeat DESC
);
GO
