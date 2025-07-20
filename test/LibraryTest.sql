-- CountMemberBorrowedBooks

SELECT Library.CountMemberBorrowedBooks(1);

SELECT *
FROM Library.Borrowing
WHERE member_id = 1;

----------------------------------------------------------------------------------

-- CountMemberReservations

EXEC Library.ReserveBook 30, 1;

SELECT Library.CountMemberReservations(1);

SELECT *
FROM Library.Reservation
WHERE member_id = 1;

----------------------------------------------------------------------------------

-- CalculateMemberDebt

INSERT INTO Library.Borrowing (copy_id, member_id, borrow_date, due_date, return_date, fines_applied) VALUES 
	(50, 6, GETDATE(), DATEADD(WEEK, 1, GETDATE()), DATEADD(WEEK, 2, GETDATE()), 2);
INSERT INTO Library.Borrowing (copy_id, member_id, borrow_date, due_date, return_date, fines_applied) VALUES 
	(51, 6, GETDATE(), DATEADD(WEEK, 1, GETDATE()), DATEADD(WEEK, 2, GETDATE()), 2);
INSERT INTO Library.Borrowing (copy_id, member_id, borrow_date, due_date, return_date, fines_applied) VALUES 
	(52, 6, GETDATE(), DATEADD(WEEK, 1, GETDATE()), DATEADD(WEEK, 2, GETDATE()), 2);
INSERT INTO Library.Borrowing (copy_id, member_id, borrow_date, due_date, return_date, fines_applied) VALUES 
	(53, 6, GETDATE(), DATEADD(WEEK, 1, GETDATE()), DATEADD(WEEK, 2, GETDATE()), 2);
INSERT INTO Library.Borrowing (copy_id, member_id, borrow_date, due_date, return_date, fines_applied) VALUES 
	(54, 6, GETDATE(), DATEADD(WEEK, 1, GETDATE()), DATEADD(WEEK, 2, GETDATE()), 2);
			
SELECT Library.CalculateMemberDebt(6);

SELECT *
FROM Library.Borrowing
WHERE member_id = 6;

UPDATE Library.BookCopy
SET status = 'Available'
WHERE copy_id IN (50, 51, 52, 53, 54);

----------------------------------------------------------------------------------

-- GetMemberBorrowedBooks

SELECT *
FROM Library.GetMemberBorrowedBooks(3)
ORDER BY return_date DESC;

----------------------------------------------------------------------------------

-- GetMembeReservedBooks

SELECT *
FROM Library.GetMemberReservedBooks(1)
ORDER BY status;

----------------------------------------------------------------------------------

-- GetMemberFavoriteCategories

SELECT *
FROM Library.GetMemberFavoriteCategories(1);

----------------------------------------------------------------------------------

-- BorrowBook / ReserveBook / ReturnBook 
-- UpdateBookCopyStatusToBorrowed / UpdateBookCopyStatusToReserved / UpdateReservationToCompleted
-- BlockInvalidBorrowing
 
SELECT status
FROM Library.BookCopy
WHERE copy_id = 50;

EXEC Library.BorrowBook 50, 7; -- SUCCESS 

SELECT status
FROM Library.BookCopy
WHERE copy_id = 50; -- [TRIGGER UpdateBookCopyStatusToBorrowed]

SELECT *
FROM Library.Borrowing
WHERE member_id = 7;

EXEC Library.BorrowBook 50, 7; -- ERROR (already borrowed this copy)

UPDATE Library.LibraryMember
SET account_status = 'Inactive'
WHERE member_id = 7;

EXEC Library.ReserveBook 51, 7; -- ERROR (account is not active)
EXEC Library.BorrowBook 51, 7;  -- ERROR (account is not active)


UPDATE Library.LibraryMember
SET account_status = 'Active'
WHERE member_id = 7;

SELECT status
FROM Library.BookCopy
WHERE copy_id = 54;

EXEC Library.ReserveBook 54, 8;

SELECT status
FROM Library.BookCopy
WHERE copy_id = 54; -- [TRIGGER UpdateBookCopyStatusToReserved]

EXEC Library.BorrowBook 54, 7; -- ERROR (not available) [Trigger]


EXEC Library.BorrowBook 54, 8; 

SELECT status
FROM Library.Reservation
WHERE copy_id = 54 AND member_id = 8; -- [TRIGGER UpdateReservationToCompleted]

SELECT status
FROM Library.BookCopy
WHERE copy_id = 54; -- [TRIGGER UpdateBookCopyStatusToBorrowed]

EXEC Library.BorrowBook 54, 7; -- ERROR (not available) [Trigger]

EXEC Library.ReserveBook 51, 7;
EXEC Library.ReserveBook 51, 7; -- ERROR (duplicate reserve)
EXEC Library.BorrowBook 51, 7; -- SUCCESS

EXEC Library.BorrowBook 52, 7; 
EXEC Library.BorrowBook 53, 7; -- ERROR (has borrowed maximum of 3 books)


EXEC Library.ReturnBook 1, 7; -- ERROR (no active borrowing)
EXEC Library.ReturnBook 50, 7;
EXEC Library.ReturnBook 51, 7;
EXEC Library.ReturnBook 52, 7;
EXEC Library.ReturnBook 54, 8;

----------------------------------------------------------------------------------

-- MarkOverdueAsLost

INSERT INTO Library.Borrowing (copy_id, member_id, borrow_date, due_date) VALUES 
	(55, 6, DATEADD(WEEK, -11, GETDATE()), DATEADD(WEEK, -10, GETDATE()));

SELECT *
FROM Library.BookCopy
WHERE copy_id = 55;

EXEC Library.MarkOverdueAsLost;

SELECT *
FROM Library.BookCopy
WHERE copy_id = 55;

----------------------------------------------------------------------------------

-- BookSuggestion

EXEC Library.BookSuggestion 1;

----------------------------------------------------------------------------------

-- LogLibraryMemberChanges / LogBorrowingChanges / LogReservationChanges
SELECT *
FROM Library.Change_Log;