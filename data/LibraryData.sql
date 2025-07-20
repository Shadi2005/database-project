-- Authors

INSERT INTO Library.Author (first_name, last_name) VALUES
('Jane', 'Austen'),
('Mark', 'Twain'),
('George', 'Orwell'),
('J.K.', 'Rowling'),
('Gabriel', 'García Márquez');
GO

---------------------------------------------------------------------------------------------------

--Publishers

INSERT INTO Library.Publisher (name, address, contact_number) VALUES
('Penguin Random House', '1745 Broadway, New York, NY 10019', '+12345678901'),
('HarperCollins', '195 Broadway, New York, NY 10007', '+19876543210'),
('Simon & Schuster', '1230 Avenue of the Americas, New York, NY 10020', '+11234567890'),
('Macmillan Publishers', '120 Broadway, New York, NY 10271', '+10987654321'),
('Hachette Livre', '43 Quai de Grenelle, 75015 Paris, France', '+33123456789');
GO

---------------------------------------------------------------------------------------------------

-- Categories

INSERT INTO Library.Category (name) VALUES
('Fiction'),
('Non-Fiction'),
('Science Fiction'),
('Fantasy'),
('Biography');
GO

---------------------------------------------------------------------------------------------------

-- Books

INSERT INTO Library.Book (title, publication_year, edition, language, publisher_id) VALUES
('Pride and Prejudice', 1813, 1, 'English', 1),
('Adventures of Huckleberry Finn', 1884, 1, 'English', 2),
('1984', 1949, 3, 'English', 3),
('Harry Potter and the Philosopher', 1997, 2, 'English', 4),
('One Hundred Years of Solitude', 1967, 1, 'Spanish', 5),
('Emma', 1815, 1, 'English', 1),
('The Adventures of Tom Sawyer', 1876, 2, 'English', 2),
('Animal Farm', 1945, 1, 'English', 3),
('Harry Potter and the Chamber of Secrets', 1998, 1, 'English', 4),
('Love in the Time of Cholera', 1985, 1, 'Spanish', 5),
('Sense and Sensibility', 1811, 2, 'English', 1),
('The Prince and the Pauper', 1881, 1, 'English', 2),
('Homage to Catalonia', 1938, 1, 'English', 3),
('Harry Potter and the Prisoner of Azkaban', 1999, 1, 'English', 4),
('Chronicle of a Death Foretold', 1981, 1, 'Spanish', 5);
GO

---------------------------------------------------------------------------------------------------

-- Book_Category

INSERT INTO Library.Book_Category (book_id, category_id) VALUES
(1, 1),  -- Pride and Prejudice — Fiction
(2, 1),  -- Adventures of Huckleberry Finn — Fiction
(3, 3),  -- 1984 — Science Fiction
(4, 4),  -- Harry Potter and the Philosopher — Fantasy
(5, 1),  -- One Hundred Years of Solitude — Fiction
(6, 1),  -- Emma — Fiction
(7, 1),  -- The Adventures of Tom Sawyer — Fiction
(8, 3),  -- Animal Farm — Science Fiction
(9, 4),  -- Harry Potter and the Chamber of Secrets — Fantasy
(10, 1), -- Love in the Time of Cholera — Fiction
(11, 1), -- Sense and Sensibility — Fiction
(12, 1), -- The Prince and the Pauper — Fiction
(13, 2), -- Homage to Catalonia — Non-Fiction
(14, 4), -- Harry Potter and the Prisoner of Azkaban — Fantasy
(15, 1); -- Chronicle of a Death Foretold — Fiction
GO

---------------------------------------------------------------------------------------------------

-- Book_Author

INSERT INTO Library.Book_Author (book_id, author_id) VALUES
(1, 1),  -- Pride and Prejudice — Jane Austen
(2, 2),  -- Adventures of Huckleberry Finn — Mark Twain
(3, 3),  -- 1984 — George Orwell
(4, 4),  -- Harry Potter and the Philosopher — J.K. Rowling
(5, 5),  -- One Hundred Years of Solitude — Gabriel García Márquez
(6, 1),  -- Emma — Jane Austen
(7, 2),  -- The Adventures of Tom Sawyer — Mark Twain
(8, 3),  -- Animal Farm — George Orwell
(9, 4),  -- Harry Potter and the Chamber of Secrets — J.K. Rowling
(10, 5), -- Love in the Time of Cholera — Gabriel García Márquez
(11, 1), -- Sense and Sensibility — Jane Austen
(12, 2), -- The Prince and the Pauper — Mark Twain
(13, 3), -- Homage to Catalonia — George Orwell
(14, 4), -- Harry Potter and the Prisoner of Azkaban — J.K. Rowling
(15, 5); -- Chronicle of a Death Foretold — Gabriel García Márquez
GO

---------------------------------------------------------------------------------------------------

--Branches

INSERT INTO Library.Branch (name) VALUES
('Central Library'),
('Westside Branch');
GO

---------------------------------------------------------------------------------------------------

-- Locations

INSERT INTO Library.Location (branch_id) VALUES
(1),
(1),
(1),
(2),
(2),
(2);
GO

---------------------------------------------------------------------------------------------------

-- BookCopies

INSERT INTO Library.BookCopy (book_id, location_id, status) VALUES
(1, 1, 'Available'),
(2, 1, 'Available'),
(3, 1, 'Available'),
(4, 1, 'Available'),
(5, 1, 'Available'),
(6, 1, 'Available'),
(7, 1, 'Available'),
(8, 1, 'Available'),
(9, 1, 'Available'),
(10, 1, 'Available'),
(11, 1, 'Available'),
(12, 1, 'Available'),
(13, 1, 'Available'),
(14, 1, 'Available'),
(15, 1, 'Available'),
(1, 2, 'Available'),
(3, 2, 'Available'),
(5, 2, 'Available'),
(6, 2, 'Available'),
(7, 2, 'Available'),
(8, 2, 'Available'),
(9, 2, 'Available'),
(10, 2, 'Available'),
(1, 3, 'Available'),
(2, 3, 'Available'),
(3, 3, 'Available'),
(4, 3, 'Available'),
(5, 3, 'Available'),
(6, 3, 'Available'),
(7, 3, 'Available'),
(8, 3, 'Available'),
(9, 3, 'Available'),
(10, 3, 'Available'),
(11, 3, 'Available'),
(12, 3, 'Available'),
(3, 4, 'Available'),
(4, 4, 'Available'),
(5, 4, 'Available'),
(6, 4, 'Available'),
(7, 4, 'Available'),
(1, 5, 'Available'),
(2, 5, 'Available'),
(3, 5, 'Available'),
(4, 5, 'Available'),
(5, 5, 'Available'),
(6, 5, 'Available'),
(7, 5, 'Available'),
(8, 5, 'Available'),
(9, 5, 'Available'),
(10, 5, 'Available'),
(11, 6, 'Available'),
(12, 6, 'Available'),
(13, 6, 'Available'),
(14, 6, 'Available'),
(15, 6, 'Available');
GO

---------------------------------------------------------------------------------------------------

-- Borrowings & Reservations

EXEC Library.BorrowBook 1, 1;
EXEC Library.BorrowBook 2, 1;
EXEC Library.BorrowBook 3, 1;
EXEC Library.BorrowBook 4, 2;
EXEC Library.BorrowBook 5, 2;
EXEC Library.BorrowBook 6, 3;
EXEC Library.BorrowBook 7, 4;
EXEC Library.BorrowBook 8, 4;
EXEC Library.BorrowBook 9, 5;
EXEC Library.BorrowBook 10, 5;
EXEC Library.BorrowBook 11, 5;

EXEC Library.ReserveBook 12, 1;
EXEC Library.ReserveBook 13, 1;
EXEC Library.ReserveBook 14, 1;

EXEC Library.ReturnBook 1, 1;
EXEC Library.ReturnBook 2, 1;
EXEC Library.ReturnBook 3, 1;

EXEC Library.BorrowBook 12, 1;
EXEC Library.BorrowBook 13, 1;
EXEC Library.BorrowBook 14, 1;

EXEC Library.ReturnBook 6, 3;
EXEC Library.ReturnBook 7, 4;
EXEC Library.ReturnBook 8, 4;

EXEC Library.BorrowBook 1, 3;
EXEC Library.BorrowBook 2, 3;
EXEC Library.BorrowBook 3, 3;
EXEC Library.BorrowBook 6, 4;

EXEC Library.ReturnBook 12, 1;
EXEC Library.ReturnBook 13, 1;
EXEC Library.ReturnBook 14, 1;
EXEC Library.ReturnBook 1, 3;
EXEC Library.ReturnBook 2, 3;
EXEC Library.ReturnBook 3, 3;
EXEC Library.ReturnBook 6, 4;

EXEC Library.BorrowBook 7, 1;
EXEC Library.BorrowBook 8, 1;
EXEC Library.BorrowBook 12, 3;
EXEC Library.BorrowBook 13, 3;
EXEC Library.BorrowBook 14, 4;
EXEC Library.BorrowBook 15, 4;

EXEC Library.ReturnBook 4, 2;
EXEC Library.ReturnBook 5, 2;
EXEC Library.ReturnBook 9, 5;
EXEC Library.ReturnBook 10, 5;
EXEC Library.ReturnBook 11, 5;
EXEC Library.ReturnBook 7, 1;
EXEC Library.ReturnBook 8, 1;
EXEC Library.ReturnBook 12, 3;
EXEC Library.ReturnBook 13, 3;
EXEC Library.ReturnBook 14, 4;
EXEC Library.ReturnBook 15, 4;

EXEC Library.BorrowBook 10, 1;
EXEC Library.BorrowBook 11, 1;
EXEC Library.BorrowBook 4, 3;
EXEC Library.BorrowBook 5, 3;
EXEC Library.BorrowBook 1, 4;
EXEC Library.BorrowBook 2, 4;
EXEC Library.BorrowBook 3, 5;
EXEC Library.BorrowBook 4, 5;
EXEC Library.BorrowBook 6, 5;
EXEC Library.BorrowBook 7, 2;
EXEC Library.BorrowBook 8, 2;

EXEC Library.ReserveBook 4, 3;
EXEC Library.ReserveBook 5, 3;

EXEC Library.ReturnBook 10, 1;
EXEC Library.ReturnBook 11, 1;
EXEC Library.ReturnBook 4, 3;
EXEC Library.ReturnBook 5, 3;

EXEC Library.BorrowBook 4, 1;
EXEC Library.BorrowBook 5, 1;
EXEC Library.BorrowBook 10, 3;
EXEC Library.BorrowBook 11, 3;
