START TRANSACTION;

DROP TABLE IF EXISTS departments, students, library_resources, courses, borrow_records;

CREATE TABLE departments (
	department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name varchar(50) NOT NULL
);

CREATE TABLE courses (
	course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name varchar(50) NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE students (
	student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    student_email varchar(100) NOT NULL
);

CREATE TABLE library_resources (
	resource_id INT AUTO_INCREMENT PRIMARY KEY,
    title varchar(30) NOT NULL,
    resource_type varchar(30) NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE borrow_records (
	borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    resource_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (resource_id) REFERENCES library_resources(resource_id)
);

INSERT INTO departments (department_name) VALUES('Computer Science'),('Biology'),('Mathematics'),('History');
INSERT INTO courses (course_name, department_id) VALUES('Intro to Programming', 1),('Data Structures', 1),('Cell Biology', 2),('Calculus I', 3),('World History', 4);
INSERT INTO students (first_name, last_name, student_email) VALUES('Alice', 'Johnson', 'alice.johnson@example.edu'),('Bob', 'Smith', 'bob.smith@example.edu'),('Carol', 'Davis', 'carol.davis@example.edu'),('David', 'Lee', 'david.lee@example.edu');
INSERT INTO library_resources (title, resource_type, department_id) VALUES('Intro to Java', 'Book', 1),('Advanced Data Structures', 'Book', 1),('Biology Lab Manual', 'Book', 2),('Calculus Workbook', 'Book', 3),('World History Encyclopedia', 'Book', 4),('Programming Videos', 'DVD', 1);
INSERT INTO borrow_records (student_id, resource_id, borrow_date, return_date) VALUES(1, 1, '2026-01-10', '2026-01-20'),(2, 2, '2026-01-11', '2026-01-21'),(3, 3, '2026-01-12', '2026-01-22'),(4, 4, '2026-01-13', '2026-01-23'),(1, 6, '2026-01-14', '2026-01-24');

COMMIT;

-- test to make sure data was returned in the borrow_records
SELECT student_id, resource_id, borrow_date, return_date
FROM borrow_records;