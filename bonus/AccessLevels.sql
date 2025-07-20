-- Create server login

CREATE LOGIN Admin WITH PASSWORD = 'Admin';
CREATE LOGIN Librarian WITH PASSWORD = 'Librarian';
CREATE LOGIN [202311001] WITH PASSWORD = 'student';

-- Create database users

CREATE USER Admin FOR LOGIN Admin;
CREATE USER Librarian FOR LOGIN Librarian;
CREATE USER [202311001] FOR LOGIN [202311001];

-- Create database roles
CREATE ROLE DB_Admin;
CREATE ROLE DB_Librarian;
CREATE ROLE DB_Student;

-- Grant permissions to roles
GRANT INSERT, UPDATE, DELETE, SELECT ON Education.Student TO DB_Admin;

GRANT EXECUTE  ON Library.BorrowBook TO DB_Librarian;
GRANT EXECUTE  ON Library.ReturnBook TO DB_Librarian;

GRANT EXECUTE ON Education.EnrollCourse TO DB_Student;
GRANT SELECT ON Education.GetStudentExams TO DB_Student;
GRANT EXECUTE ON Education.TermGPA TO DB_Student;
GRANT EXECUTE ON Education.TotalGPA TO DB_Student;
GRANT EXECUTE ON Education.TotalPassedCredits TO DB_Student;


-- Grant roles to users
ALTER ROLE DB_Admin ADD MEMBER Admin;
ALTER ROLE DB_Librarian ADD MEMBER Librarian;
ALTER ROLE DB_Student ADD MEMBER [202311001];


-- Test

SELECT * FROM Education.Student;
SELECT * FROM Education.Advisor;

EXEC Library.BorrowBook 48, 26;
EXEC Library.ReturnBook 48, 26;

EXEC Education.TotalGPA 202311001;
EXEC Education.TermGPA 202311001, 2022, 'Fall';

SELECT name, is_disabled FROM sys.sql_logins WHERE name = '202311001';

ALTER LOGIN [202311001] WITH PASSWORD = '1234';