-- Education Schema Triggers 

CREATE TRIGGER Education.CreateLibraryMembership  
ON Education.Student  
AFTER INSERT  
AS  
BEGIN  
    INSERT INTO Library.LibraryMember (student_id, registration_date, account_status)
    SELECT I.student_id, GETDATE(), 'Active'
    FROM INSERTED AS I;
END;  
GO

CREATE TRIGGER Education.UpdateLibraryAccess
ON Education.Student
AFTER UPDATE
AS
BEGIN
    IF UPDATE(student_status)
    BEGIN
        UPDATE Library.LibraryMember
        SET account_status = 'Inactive'
        FROM INSERTED I
        JOIN Library.LibraryMember LM ON LM.student_id = I.student_id
        WHERE I.student_status IN ('Graduated', 'Withdrawn', 'Expelled');
    END
END;
GO

CREATE TRIGGER Education.CheckNationalID 
ON Education.Student 
FOR INSERT, UPDATE 
AS
BEGIN
	IF EXISTS ( SELECT * FROM INSERTED WHERE Education.IsValidNationalID(national_id) = 0 )
	BEGIN
		ROLLBACK;
	END
END;
GO

CREATE TRIGGER Education.CheckExpellee
ON Education.Enrollment
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @student_id INT, @offered_course_id INT, @semester_id INT, @year INT, @term VARCHAR(20);

    DECLARE cur CURSOR FOR
    SELECT DISTINCT student_id, offered_course_id
    FROM inserted
    WHERE grade IS NOT NULL;

    OPEN cur;
    FETCH NEXT FROM cur INTO @student_id, @offered_course_id;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT 
            @semester_id = OC.semester_id,
            @year = S.year,
            @term = S.term
        FROM Education.Offered_Course OC
        JOIN Education.Semester S ON OC.semester_id = S.semester_id
        WHERE OC.offered_course_id = @offered_course_id;

        IF NOT EXISTS (
            SELECT 1
            FROM Education.Enrollment E
            JOIN Education.Offered_Course OC ON E.offered_course_id = OC.offered_course_id
            WHERE E.student_id = @student_id
              AND OC.semester_id = @semester_id
              AND (E.grade IS NULL OR TRY_CAST(E.grade AS FLOAT) IS NULL)
        )
        BEGIN
            DECLARE @gpa_current FLOAT = Education.TermGPA(@student_id, @year, @term);
            DECLARE @prev_year INT = @year;
            DECLARE @prev_term VARCHAR(20);

            IF @term = 'Spring'
            BEGIN
                SET @prev_term = 'Fall';
                SET @prev_year = @year - 1; 
            END
            ELSE IF @term = 'Fall'
            BEGIN
                SET @prev_term = 'Spring';
                
            END
            
            ELSE
            BEGIN
                SET @prev_term = NULL;
            END

            DECLARE @gpa_prev FLOAT = NULL;
            IF @prev_term IS NOT NULL
                SET @gpa_prev = Education.TermGPA(@student_id, @prev_year, @prev_term);

            IF @gpa_current < 12 AND @gpa_prev IS NOT NULL AND @gpa_prev < 12
            BEGIN
                UPDATE Education.Student
                SET student_status = 'Expelled'
                WHERE student_id = @student_id;

                INSERT INTO Education.Change_Log (table_name, operation_type, primary_key_info, change_details)
                VALUES ('Student', 'UPDATE', 'student_id=' + CAST(@student_id AS VARCHAR), 'Student expelled due to two consecutive GPAs < 12');
            END
        END
        FETCH NEXT FROM cur INTO @student_id, @offered_course_id;
    END
    CLOSE cur;
    DEALLOCATE cur;
END;
GO

CREATE TRIGGER Education.CheckGraduationAfterGrade
ON Education.Enrollment
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM inserted WHERE grade IS NOT NULL)
        RETURN;

    DECLARE @student_id INT;
    SELECT TOP 1 @student_id = student_id FROM inserted;

    IF Education.CheckGraduationStatus(@student_id) = 1
    BEGIN
        DECLARE @debt NUMERIC(5,2);
        DECLARE @unreturned_books INT;

        SET @debt = Library.CalculateMemberDebt(@student_id);
        SET @unreturned_books = Library.CountMemberBorrowedBooks(@student_id);

        IF (@debt IS NULL OR @debt = 0) AND (@unreturned_books IS NULL OR @unreturned_books = 0)
        BEGIN
            UPDATE Education.Student
            SET student_status = 'Graduated'
            WHERE student_id = @student_id;

            INSERT INTO Education.Change_Log (
                table_name,
                operation_type,
                primary_key_info,
                change_details
            )
            VALUES (
                'Student',
                'UPDATE',
                'student_id=' + CAST(@student_id AS VARCHAR),
                'Graduation status updated to Graduated.'
            );
        END
        ELSE
        BEGIN
            DECLARE @block_reason VARCHAR(255);
            SET @block_reason = 'Graduation blocked. ';
            
            IF @debt > 0
                SET @block_reason = @block_reason + 'Outstanding debt: ' + CAST(@debt AS VARCHAR) + '. ';

            IF @unreturned_books > 0
                SET @block_reason = @block_reason + 'Unreturned books: ' + CAST(@unreturned_books AS VARCHAR) + '.';

            INSERT INTO Education.Change_Log (
                table_name,
                operation_type,
                primary_key_info,
                change_details
            )
            VALUES (
                'Student',
                'CHECK',
                'student_id=' + CAST(@student_id AS VARCHAR),
                @block_reason
            );
        END
    END
END;
GO

CREATE TRIGGER Education.LogEnrollmentInsert
ON Education.Enrollment
AFTER INSERT
AS
BEGIN
    INSERT INTO Education.Change_Log (table_name, operation_type, primary_key_info, change_details)
    SELECT 
        'Enrollment',
        'INSERT',
        'enrollment_id=' + CAST(I.enrollment_id AS VARCHAR),
        'Student ' + CAST(I.student_id AS VARCHAR) + ' enrolled in offered_course ' + CAST(I.offered_course_id AS VARCHAR)
    FROM INSERTED I;
END;
GO

CREATE TRIGGER Education.PreventEnrollment
ON Education.Enrollment
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    
    DELETE E
    FROM inserted I
    JOIN Education.Enrollment E ON E.enrollment_id = I.enrollment_id
    JOIN Education.Offered_Course OC ON I.offered_course_id = OC.offered_course_id
    WHERE (
        SELECT COUNT(*) 
        FROM Education.Enrollment
        WHERE offered_course_id = OC.offered_course_id
    ) > OC.capacity;

    
    IF EXISTS (
        SELECT 1
        FROM inserted I
        LEFT JOIN Education.Enrollment E ON I.enrollment_id = E.enrollment_id
        WHERE E.enrollment_id IS NULL
    )
    BEGIN
        
        PRINT 'Enrollment denied: Course capacity has been exceeded.';

        
        INSERT INTO Education.Change_Log (
            table_name,
            operation_type,
            primary_key_info,
            change_details
        )
        SELECT 
            'Enrollment',
            'DELETE',
            'enrollment_id = ' + CAST(I.enrollment_id AS VARCHAR),
            'Enrollment deleted: class capacity exceeded.'
        FROM inserted I;
    END
END;
GO

CREATE TRIGGER Education.LogEnrollmentDelete
ON Education.Enrollment
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Education.Change_Log (
        table_name,
        operation_type,
        change_time,
        user_name,
        primary_key_info,
        change_details
    )
    SELECT
        'Enrollment',                                
        'DELETE',                                
        GETDATE(),                                   
        SYSTEM_USER,                                 
        'enrollment_id=' + CAST(deleted.enrollment_id AS VARCHAR), 
        'StudentID=' + CAST(deleted.student_id AS VARCHAR) + 
        ', OfferedCourseID=' + CAST(deleted.offered_course_id AS VARCHAR)
    FROM deleted;
END;
GO

CREATE TRIGGER Education.AssignAdvisorOnStudentInsert
ON Education.Student
AFTER INSERT
AS
BEGIN
    
    SET NOCOUNT ON;

    DECLARE @student_id INT;
    DECLARE @major_id INT;
    DECLARE @department_id INT;
    DECLARE @advisor_id INT;

    DECLARE new_student_cursor CURSOR FOR
    SELECT student_id, major_id FROM inserted;

    OPEN new_student_cursor;

    FETCH NEXT FROM new_student_cursor INTO @student_id, @major_id;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT @department_id = department_id
        FROM Education.Major
        WHERE major_id = @major_id;

        SELECT TOP 1 @advisor_id = instructor_id
        FROM Education.Instructor
        WHERE department_id = @department_id
        ORDER BY NEWID(); 

        IF @advisor_id IS NOT NULL
        BEGIN
            INSERT INTO Education.Advisor (student_id, instructor_id, assigned_date)
            VALUES (@student_id, @advisor_id, GETDATE());
        END
        ELSE
        BEGIN
            PRINT 'Warning: No instructor found for department ID ' + CAST(@department_id AS VARCHAR) + '. Advisor not assigned for student ' + CAST(@student_id AS VARCHAR) + '.';
        END

        FETCH NEXT FROM new_student_cursor INTO @student_id, @major_id;
    END;

    CLOSE new_student_cursor;
    DEALLOCATE new_student_cursor;
END;
GO


-- Library Schema Triggers

CREATE TRIGGER Library.UpdateBookCopyStatusToBorrowed
ON Library.Borrowing
AFTER INSERT 
AS
BEGIN  
	UPDATE Library.BookCopy
	SET status = 'Borrowed'
	WHERE copy_id IN (SELECT copy_id FROM INSERTED);
END;
GO


CREATE TRIGGER Library.UpdateBookCopyStatusToReserved
ON Library.Reservation
AFTER INSERT 
AS
BEGIN  
	UPDATE Library.BookCopy
	SET status = 'Reserved'
	WHERE copy_id IN (SELECT copy_id FROM INSERTED);
END;
GO


CREATE TRIGGER Library.UpdateReservationToCompleted
ON Library.Borrowing
AFTER INSERT 
AS
BEGIN  
	UPDATE Library.Reservation
	SET status = 'Completed'
	WHERE copy_id IN (SELECT copy_id FROM INSERTED) AND member_id IN (SELECT member_id FROM INSERTED);
END;
GO

CREATE TRIGGER Library.BlockInvalidBorrowing
ON Library.Borrowing
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM INSERTED I
        JOIN Library.BookCopy BC ON I.copy_id = BC.copy_id
        WHERE NOT (
            BC.status = 'Available' 
            OR (BC.status = 'Reserved' AND I.member_id IN (
                SELECT R.member_id 
                FROM Library.Reservation R 
                WHERE R.copy_id = BC.copy_id AND R.status = 'Pending'
            ))
        )
    )
    BEGIN
        RAISERROR ('Cannot borrow book. The copy is not available.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    INSERT INTO Library.Borrowing (copy_id, member_id, borrow_date, due_date, return_date, fines_applied)
    SELECT copy_id, member_id, borrow_date, due_date, return_date, fines_applied
    FROM INSERTED;
END;
GO

CREATE TRIGGER Library.LogLibraryMemberChanges
ON Library.LibraryMember
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS(SELECT * FROM INSERTED) AND NOT EXISTS(SELECT * FROM DELETED)
    BEGIN
        INSERT INTO Library.Change_Log (table_name, operation_type, primary_key_info, change_details)
        VALUES ('LibraryMember', 'INSERT', (SELECT CONVERT(VARCHAR, member_id) FROM INSERTED), 'Inserted new member');
    END
    ELSE IF EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED)
    BEGIN
        INSERT INTO Library.Change_Log (table_name, operation_type, primary_key_info, change_details)
        VALUES ('LibraryMember', 'UPDATE', (SELECT CONVERT(VARCHAR, member_id) FROM INSERTED), 'Updated member details');
    END
    ELSE IF NOT EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED)
    BEGIN
        INSERT INTO Library.Change_Log (table_name, operation_type, primary_key_info, change_details)
        VALUES ('LibraryMember', 'DELETE', (SELECT CONVERT(VARCHAR, member_id) FROM DELETED), 'Deleted member');
    END
END;
GO

CREATE TRIGGER Library.LogBorrowingChanges
ON Library.Borrowing
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS(SELECT * FROM INSERTED) AND NOT EXISTS(SELECT * FROM DELETED)
    BEGIN
        INSERT INTO Library.Change_Log (table_name, operation_type, primary_key_info, change_details)
        VALUES ('Borrowing', 'INSERT', (SELECT CONVERT(VARCHAR, borrowing_id) FROM INSERTED), 'Book borrowed');
    END
    ELSE IF EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED)
    BEGIN
        INSERT INTO Library.Change_Log (table_name, operation_type, primary_key_info, change_details)
        VALUES ('Borrowing', 'UPDATE', (SELECT CONVERT(VARCHAR, borrowing_id) FROM INSERTED), 'Updated borrowing record');
    END
    ELSE IF NOT EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED)
    BEGIN
        INSERT INTO Library.Change_Log (table_name, operation_type, primary_key_info, change_details)
        VALUES ('Borrowing', 'DELETE', (SELECT CONVERT(VARCHAR, borrowing_id) FROM DELETED), 'Removed borrowing record');
    END
END;
GO

CREATE TRIGGER Library.LogReservationChanges
ON Library.Reservation
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS(SELECT * FROM INSERTED) AND NOT EXISTS(SELECT * FROM DELETED)
    BEGIN
        INSERT INTO Library.Change_Log (table_name, operation_type, primary_key_info, change_details)
        VALUES ('Reservation', 'INSERT', (SELECT CONVERT(VARCHAR, reservation_id) FROM INSERTED), 'Book reserved');
    END
    ELSE IF EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED)
    BEGIN
        INSERT INTO Library.Change_Log (table_name, operation_type, primary_key_info, change_details)
        VALUES ('Reservation', 'UPDATE', (SELECT CONVERT(VARCHAR, reservation_id) FROM INSERTED), 'Updated reservation');
    END
    ELSE IF NOT EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED)
    BEGIN
        INSERT INTO Library.Change_Log (table_name, operation_type, primary_key_info, change_details)
        VALUES ('Reservation', 'DELETE', (SELECT CONVERT(VARCHAR, reservation_id) FROM DELETED), 'Cancelled reservation');
    END
END;
GO

