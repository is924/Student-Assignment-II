
SQL> -- Create Students Table
SQL> CREATE TABLE Students (
  2      student_id NUMBER PRIMARY KEY,
  3      name VARCHAR2(100),
  4      email VARCHAR2(100),
  5      date_of_birth DATE
  6  );

Table created.

SQL>
SQL> -- Create Courses Table
SQL> CREATE TABLE Courses (
  2      course_id NUMBER PRIMARY KEY,
  3      course_name VARCHAR2(100),
  4      credits NUMBER
  5  );

Table created.

SQL>
SQL> -- Create Enrollments Table (many-to-many between students and courses)
SQL> CREATE TABLE Enrollments (
  2      enrollment_id NUMBER PRIMARY KEY,
  3      student_id NUMBER,
  4      course_id NUMBER,
  5      enrollment_date DATE,
  6      FOREIGN KEY (student_id) REFERENCES Students(student_id),
  7      FOREIGN KEY (course_id) REFERENCES Courses(course_id)
  8  );

Table created.

SQL>
SQL> -- Create Departments Table
SQL> CREATE TABLE Departments (
  2      department_id NUMBER PRIMARY KEY,
  3      department_name VARCHAR2(100)
  4  );

Table created.

SQL>
SQL> -- Create Instructors Table
SQL> CREATE TABLE Instructors (
  2      instructor_id NUMBER PRIMARY KEY,
  3      name VARCHAR2(100),
  4      department_id NUMBER,
  5      FOREIGN KEY (department_id) REFERENCES Departments(department_id)
  6  );

Table created.


SQL> -- Insert students data
SQL> INSERT INTO Students (student_id, name, email, date_of_birth)
  2  VALUES (1, 'John Doe', 'john.doe@example.com', TO_DATE('2000-01-15', 'YYYY-MM-DD'));

1 row created.

SQL> INSERT INTO Students (student_id, name, email, date_of_birth)
  2  VALUES (2, 'Jane Smith', 'jane.smith@example.com', TO_DATE('1999-02-20', 'YYYY-MM-DD'));

1 row created.

SQL> INSERT INTO Students (student_id, name, email, date_of_birth)
  2  VALUES (3, 'Michael Johnson', 'michael.johnson@example.com', TO_DATE('2001-03-10', 'YYYY-MM-DD'));

1 row created.

SQL> INSERT INTO Students (student_id, name, email, date_of_birth)
  2  VALUES (4, 'Emily Davis', 'emily.davis@example.com', TO_DATE('1998-08-25', 'YYYY-MM-DD'));

1 row created.

SQL> INSERT INTO Students (student_id, name, email, date_of_birth)
  2  VALUES (5, 'Chris Brown', 'chris.brown@example.com', TO_DATE('2000-04-12', 'YYYY-MM-DD'));

1 row created.

SQL> INSERT INTO Students (student_id, name, email, date_of_birth)
  2  VALUES (6, 'Sarah Connor', 'sarah.connor@example.com', TO_DATE('1997-11-30', 'YYYY-MM-DD'));

1 row created.

SQL> -- Insert courses data
SQL> INSERT INTO Courses (course_id, course_name, credits)
  2  VALUES (101, 'Database Systems', 3);

1 row created.

SQL> INSERT INTO Courses (course_id, course_name, credits)
  2  VALUES (102, 'Data Structures', 4);

1 row created.

SQL> INSERT INTO Courses (course_id, course_name, credits)
  2  VALUES (103, 'Operating Systems', 3);

1 row created.

SQL> INSERT INTO Courses (course_id, course_name, credits)
  2  VALUES (104, 'Computer Networks', 3);

1 row created.

SQL> INSERT INTO Courses (course_id, course_name, credits)
  2  VALUES (105, 'Artificial Intelligence', 4);

1 row created.

SQL> INSERT INTO Courses (course_id, course_name, credits)
  2  VALUES (106, 'Software Engineering', 3);

1 row created.

SQL> -- Insert departments data
SQL> INSERT INTO Departments (department_id, department_name)
  2  VALUES (1, 'Computer Science');

1 row created.

SQL> INSERT INTO Departments (department_id, department_name)
  2  VALUES (2, 'Information Technology');

1 row created.

SQL> INSERT INTO Departments (department_id, department_name)
  2  VALUES (3, 'Data Science');

1 row created.

SQL> INSERT INTO Departments (department_id, department_name)
  2  VALUES (4, 'Artificial Intelligence');

1 row created.

SQL> INSERT INTO Departments (department_id, department_name)
  2  VALUES (5, 'Cyber Security');

1 row created.

SQL> -- Insert instructors data
SQL> INSERT INTO Instructors (instructor_id, name, department_id)
  2  VALUES (1, 'Dr. Sarah Lee', 1);

1 row created.

SQL> INSERT INTO Instructors (instructor_id, name, department_id)
  2  VALUES (2, 'Dr. Alan Brown', 2);

1 row created.

SQL> INSERT INTO Instructors (instructor_id, name, department_id)
  2  VALUES (3, 'Dr. Michael Green', 3);

1 row created.

SQL> INSERT INTO Instructors (instructor_id, name, department_id)
  2  VALUES (4, 'Dr. Elizabeth Black', 4);

1 row created.

SQL> INSERT INTO Instructors (instructor_id, name, department_id)
  2  VALUES (5, 'Dr. Robert White', 5);

1 row created.

SQL> INSERT INTO Instructors (instructor_id, name, department_id)
  2  VALUES (6, 'Dr. Emma Thompson', 1);

1 row created.

SQL> -- Insert enrollments data (enrolling students into courses)
SQL> INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
  2  VALUES (1, 1, 101, SYSDATE);

1 row created.

SQL> INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
  2  VALUES (2, 2, 102, SYSDATE);

1 row created.

SQL> INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
  2  VALUES (3, 3, 101, SYSDATE);

1 row created.

SQL> INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
  2  VALUES (4, 4, 103, SYSDATE);

1 row created.

SQL> INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
  2  VALUES (5, 5, 104, SYSDATE);

1 row created.

SQL> INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
  2  VALUES (6, 6, 105, SYSDATE);

1 row created.

UPDATE Students
SET email = 'new.email@example.com'
WHERE student_id = 1;


DELETE FROM Enrollments
WHERE enrollment_id = 2;


-- Join students and their enrolled courses
SELECT s.name AS student_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;



SELECT name
FROM Students
WHERE student_id IN (SELECT student_id FROM Enrollments WHERE course_id = 101);




SELECT course_name
FROM Courses
WHERE course_id IN (
    SELECT course_id 
    FROM Enrollments 
    GROUP BY course_id 
    HAVING COUNT(student_id) > 1
);



COMMIT;  -- Save changes
-- or
ROLLBACK;  -- Undo changes



CREATE USER student_user IDENTIFIED BY student123;


GRANT CONNECT TO student_user;
GRANT SELECT ON Courses TO student_user;
GRANT INSERT ON Enrollments TO student_user;


REVOKE INSERT ON Enrollments FROM student_user;


SQL> CREATE USER C##student_user IDENTIFIED BY student123;

User created.

SQL> GRANT CONNECT TO C##student_user;

Grant succeeded.




SQL> REVOKE CONNECT FROM C##student_user;

Revoke succeeded.


