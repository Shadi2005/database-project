-- Mark the book which is not returned after 60 days as lost [EVERY WEEK]
UPDATE BC
    SET status = 'Lost'
    FROM Library.BookCopy BC
    JOIN Library.Borrowing B ON B.copy_id = BC.copy_id
    WHERE 
        B.return_date IS NULL
        AND DATEDIFF(DAY, B.due_date, GETDATE()) > 60;


SELECT BC.*
FROM Library.Borrowing AS B
JOIN Library.BookCopy AS BC ON B.copy_id = BC.copy_id
WHERE B.member_id = 25;

INSERT INTO Library.Borrowing (copy_id, member_id, borrow_date, due_date, return_date, fines_applied) VALUES
    (45, 25, DATEADD(WEEK, -40, GETDATE()), DATEADD(WEEK, -39, GETDATE()), NULL, 0);
INSERT INTO Library.Borrowing (copy_id, member_id, borrow_date, due_date, return_date, fines_applied) VALUES
    (46, 25, DATEADD(WEEK, -11, GETDATE()), DATEADD(WEEK, -10, GETDATE()), NULL, 0);
INSERT INTO Library.Borrowing (copy_id, member_id, borrow_date, due_date, return_date, fines_applied) VALUES
    (47, 25, DATEADD(WEEK, -1, GETDATE()), DATEADD(WEEK, 1, GETDATE()), NULL, 0);

-- Mark the reservation which is not completed after 1 week as canceled [EVERY THREE DAYS]
UPDATE BC
    SET BC.status = 'Available'
    FROM Library.BookCopy AS BC
    JOIN Library.Reservation AS R ON BC.copy_id = R.copy_id 
    WHERE R.status = 'Pending' AND DATEDIFF(WEEK, R.reservation_date, GETDATE()) > 1;

UPDATE Library.Reservation
    SET status = 'Canceled'
    WHERE status = 'Pending' AND DATEDIFF(WEEK, reservation_date, GETDATE()) > 1;

-- BookSuggestion [EVERY 5 MIN]
WITH TargetMemberBooks AS (
        SELECT BC.book_id
        FROM Library.Borrowing B
        JOIN Library.BookCopy BC ON B.copy_id = BC.copy_id
        WHERE B.member_id = 1
    ),

    SimilarMembers AS (
        SELECT B.member_id
        FROM Library.Borrowing B
        JOIN Library.BookCopy BC ON B.copy_id = BC.copy_id
        WHERE BC.book_id IN (SELECT book_id FROM TargetMemberBooks)
          AND B.member_id <> 1
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

-- Test
INSERT INTO Library.Reservation (copy_id, member_id, reservation_date) 
	VALUES (19, 19, DATEADD(WEEK, -2, GETDATE()));

SELECT *
FROM Library.BookCopy AS BC
JOIN Library.Reservation AS R ON BC.copy_id = R.copy_id 
WHERE R.status = 'Pending' AND DATEDIFF(WEEK, R.reservation_date, GETDATE()) > 1

SELECT *
FROM Library.BookCopy
WHERE copy_id = 19;