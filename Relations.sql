CREATE SCHEMA Education;
GO

CREATE SCHEMA Library;
GO
 
-- EDUCATION SCHEMA TABLES
CREATE TABLE Education.Building (
    building_id INT IDENTITY PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    location VARCHAR(255) 
);

CREATE TABLE Education.Department (
    department_id INT IDENTITY PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    building_id INT,
    FOREIGN KEY (building_id) REFERENCES Education.Building(building_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Education.Major (
    major_id INT IDENTITY(20,1) PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Education.Department(department_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Education.Student (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    national_id CHAR(10) UNIQUE NOT NULL,
    birth_date DATE,
    entry_year INT,
    current_term_number INT CHECK (current_term_number BETWEEN 1 AND 10),
    major_id INT,
    student_status VARCHAR(20) CHECK (student_status IN ('Active', 'Graduated', 'Withdrawn', 'Expelled')) NOT NULL DEFAULT 'Active',
    FOREIGN KEY (major_id) REFERENCES Education.Major(major_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Education.Instructor (
    instructor_id INT IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE CHECK (email LIKE '%_@_%._%'),
    phone VARCHAR(15) UNIQUE CHECK (phone LIKE '+%' AND LEN(phone) BETWEEN 10 AND 15),
    title VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Education.Department(department_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Education.Advisor (
    student_id INT,
    instructor_id INT,
    assigned_date DATE,
    PRIMARY KEY (student_id, instructor_id),
    FOREIGN KEY (student_id) REFERENCES Education.Student(student_id),
    FOREIGN KEY (instructor_id) REFERENCES Education.Instructor(instructor_id)
);

CREATE TABLE Education.Department_Head (
    department_id INT PRIMARY KEY,
    instructor_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (department_id) REFERENCES Education.Department(department_id),
    FOREIGN KEY (instructor_id) REFERENCES Education.Instructor(instructor_id)
);

CREATE TABLE Education.Room (
    room_id INT IDENTITY PRIMARY KEY,
    building_id INT,
    room_number VARCHAR(10),
    capacity INT,
    FOREIGN KEY (building_id) REFERENCES Education.Building(building_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Education.Course (
    course_id INT IDENTITY PRIMARY KEY,
    title VARCHAR(100) UNIQUE,
    credits INT CHECK (credits BETWEEN 1 AND 4),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Education.Department(department_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Education.Curriculum (
    curriculum_id INT IDENTITY PRIMARY KEY,
    major_id INT,
    course_id INT,
    suggested_term INT,
    is_optional BIT,
    priority INT,
    FOREIGN KEY (major_id) REFERENCES Education.Major(major_id),
    FOREIGN KEY (course_id) REFERENCES Education.Course(course_id)
);

CREATE TABLE Education.Prerequisite (
    course_id INT,
    prerequisite_course_id INT,
    PRIMARY KEY (course_id, prerequisite_course_id),
    FOREIGN KEY (course_id) REFERENCES Education.Course(course_id),
    FOREIGN KEY (prerequisite_course_id) REFERENCES Education.Course(course_id)
);

CREATE TABLE Education.Semester (
    semester_id INT IDENTITY PRIMARY KEY,
    term VARCHAR(20) CHECK (term IN ('Fall', 'Spring', 'Summer')),
    year INT,
    start_date DATE,
    end_date DATE
);
              
CREATE TABLE Education.Offered_Course (
    offered_course_id INT IDENTITY PRIMARY KEY,
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    semester_id INT NOT NULL,
    room_id INT,
    capacity INT CHECK (capacity > 0),
    section_number VARCHAR(10) NOT NULL,
    class_day_type VARCHAR(10) CHECK (class_day_type IN ('Odd', 'Even')),
    start_hour TINYINT CHECK (start_hour IN (8, 10, 13, 15)),               

    FOREIGN KEY (course_id) REFERENCES Education.Course(course_id),
    FOREIGN KEY (instructor_id) REFERENCES Education.Instructor(instructor_id),
    FOREIGN KEY (semester_id) REFERENCES Education.Semester(semester_id),
    FOREIGN KEY (room_id) REFERENCES Education.Room(room_id),
    CONSTRAINT UQ_OfferedCourse_CourseSemesterSection
        UNIQUE (course_id, semester_id, section_number)
);

CREATE TABLE Education.TA_Course_Assignment (
    student_id INT,
    offered_course_id INT,
    assigned_by_instructor_id INT,
    assigned_date DATE,
    PRIMARY KEY (student_id, offered_course_id),
    FOREIGN KEY (student_id) REFERENCES Education.Student(student_id),
    FOREIGN KEY (offered_course_id) REFERENCES Education.Offered_Course(offered_course_id),
    FOREIGN KEY (assigned_by_instructor_id) REFERENCES Education.Instructor(instructor_id)
);

CREATE TABLE Education.Enrollment (
    enrollment_id INT IDENTITY PRIMARY KEY,
    student_id INT,
    offered_course_id INT,
    enrollment_date DATE,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES Education.Student(student_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (offered_course_id) REFERENCES Education.Offered_Course(offered_course_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Education.Exam (
    exam_id INT IDENTITY PRIMARY KEY,
    offered_course_id INT,
    exam_type VARCHAR(50),
    exam_date DATE,
    room_id INT,
    FOREIGN KEY (offered_course_id) REFERENCES Education.Offered_Course(offered_course_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (room_id) REFERENCES Education.Room(room_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Education.Change_Log (
  log_id INT IDENTITY(1,1) PRIMARY KEY,
  table_name VARCHAR(100),
  operation_type VARCHAR(10) CHECK (operation_type IN ('INSERT','UPDATE','DELETE')),
  change_time DATETIME DEFAULT GETDATE(),
  user_name VARCHAR(100) DEFAULT SYSTEM_USER,
  primary_key_info VARCHAR(255),     
  change_details TEXT                
);

---- LIBRARY SCHEMA TABLES

CREATE TABLE Library.Author (
    author_id INT IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE Library.Publisher (
    publisher_id INT IDENTITY PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(255) UNIQUE,
    contact_number VARCHAR(15) CHECK (contact_number LIKE '+%' AND LEN(contact_number) BETWEEN 10 AND 15)
);

CREATE TABLE Library.Category (
    category_id INT IDENTITY PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Library.Book (
    book_id INT IDENTITY PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    publication_year INT CHECK (publication_year BETWEEN 1400 AND YEAR(GETDATE())),
    edition INT CHECK (edition > 0),
    language VARCHAR(100),
    publisher_id INT,
    FOREIGN KEY (publisher_id) REFERENCES Library.Publisher(publisher_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Library.Book_Category (
    book_id INT,
    category_id INT,
    PRIMARY KEY (book_id, category_id),
    FOREIGN KEY (book_id) REFERENCES Library.Book(book_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Library.Category(category_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Library.Book_Author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Library.Book(book_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (author_id) REFERENCES Library.Author(author_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Library.Branch (
    branch_id INT IDENTITY PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Library.Location (
    location_id INT IDENTITY PRIMARY KEY,
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Library.Branch(branch_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Library.BookCopy (
    copy_id INT IDENTITY PRIMARY KEY,
    book_id INT,
    location_id INT,
    status VARCHAR(20) CHECK (status IN ('Available', 'Borrowed', 'Reserved', 'Lost', 'Damaged')) DEFAULT 'Available',
    FOREIGN KEY (book_id) REFERENCES Library.Book(book_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (location_id) REFERENCES Library.Location(location_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Library.LibraryMember (
    member_id INT IDENTITY PRIMARY KEY,
	student_id INT,
    registration_date DATE DEFAULT GETDATE(),
    account_status VARCHAR(20) CHECK (account_status IN ('Active', 'Inactive', 'Suspended', 'Closed')) DEFAULT 'Active',
	FOREIGN KEY (student_id) REFERENCES Education.Student(student_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Library.Borrowing (
    borrowing_id INT IDENTITY PRIMARY KEY,
    copy_id INT,
    member_id INT,
    borrow_date DATE DEFAULT GETDATE(),
    due_date DATE,
    return_date DATE,
    fines_applied NUMERIC(5,2) CHECK (fines_applied >= 0) DEFAULT 0,
    FOREIGN KEY (copy_id) REFERENCES Library.BookCopy(copy_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (member_id) REFERENCES Library.LibraryMember(member_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Library.Reservation (
    reservation_id INT IDENTITY PRIMARY KEY,
    copy_id INT,
    member_id INT,
    reservation_date DATE DEFAULT GETDATE(),
    status VARCHAR(20) CHECK (status IN ('Pending', 'Completed', 'Cancelled')) DEFAULT 'Pending',
    FOREIGN KEY (copy_id) REFERENCES Library.BookCopy(copy_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (member_id) REFERENCES Library.LibraryMember(member_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Library.Change_Log (
  log_id INT IDENTITY(1,1) PRIMARY KEY,
  table_name VARCHAR(100),
  operation_type VARCHAR(10) CHECK (operation_type IN ('INSERT','UPDATE','DELETE')),
  change_time DATETIME DEFAULT GETDATE(),
  user_name VARCHAR(100) DEFAULT SYSTEM_USER,
  primary_key_info VARCHAR(255),
  change_details TEXT
);
