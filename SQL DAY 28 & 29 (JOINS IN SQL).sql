--Create employees3 table

CREATE TABLE Employees3(
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  department_id INT
);

--INSERT  DATA INTO EMPLOYEES3

INSERT INTO Employees3(first_name, last_name, department_id) VALUES
   ('Sudhanshu', 'kumar', 101),
   ('Nitish', 'kumar', 102),
   ('Niranjan', 'kumar', 103),
   ('Anuradha', 'kumari', NULL),
   ('Ram ji', 'poddar', 101);


   SELECT * FROM EMPLOYEES3;


-- CREATE DEPARTMENTS TABLE
CREATE TABLE Departments(
   department_id INT PRIMARY KEY,
   department_name VARCHAR(50)
   
);


-- INSERT DATA INTO DEPARTMENTS
 INSERT INTO Departments(dePartment_id, department_name) VALUES
   (101,'Sales'),
   (102, 'Marketing'),
   (103, 'IT'),
   (104, 'HR');


  SELECT * FROM departments; 


--1. INNER JOIN- RETRIEVE EMPLOYEES3 AND THEIR DEPARTMENT NAMES WHERE A MATCH EXISTS.

SELECT e.employee_id, e.first_name, e.last_name,
       d.department_id, d.department_name
FROM Employees3 e
INNER JOIN
Departments d
ON e.department_id=d.department_id;



--2. LEFT JOIN- RETRIEVE ALL EMPLOYEES3 AND THEIR DEPARTMENT NAMES, INCLUDING THOSE WITHOUT A DEPARTMENT.

SELECT e.employee_id, e.first_name, e.last_name,
       d.department_id, d.department_name
FROM Employees3 e
LEFT JOIN
Departments d
ON e.department_id=d.department_id;


--3. RIGHT JOIN- RETRIEVE ALL DEPARTMENTS AND THE EMPLOYEES3 WORKING IN THEM, INCLUDING DEPARTMENTS WITHOUT

SELECT e.employee_id, e.first_name, e.last_name,
       d.department_id, d.department_name
FROM Employees3 e
RIGHT JOIN
Departments d
ON e.department_id=d.department_id;


--4. FULL JOIN-- Retrieve a complete list of employees and departments.
-- Include all employees and all departments, even if there is no match between them.

SELECT e.employee_id, e.first_name, e.last_name,
       d.department_id, d.department_name
FROM Employees3 e
FULL JOIN
Departments d
ON e.department_id = d.department_id;


--5. SELF JOIN -- Suppose we want to find pairs of employees who work in the same department.
-- Retrieve the names of employees who share the same department.

SELECT e1.first_name AS Employee1, e2.first_name AS Employee2, d.department_name
FROM employees3 e1 JOIN employees3 e2 
ON e1.department_id=e2.department_id AND e1.employee_id!=e2.employee_id
JOIN departments d ON 
   e1.department_id=d.department_id;
  

--6. CROSS JOIN-- Create all possible combinations of employees and departments.
-- This can be useful to simulate assigning each employee to every department.

SELECT e.first_name, e.last_name, d.department_name
FROM Employees3 e
CROSS JOIN Departments d;



  