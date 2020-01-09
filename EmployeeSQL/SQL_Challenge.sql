-- Code for Tables --

CREATE TABLE departments (
  dept_no VARCHAR(30) NOT NULL PRIMARY KEY,
  dept_name VARCHAR(30)
);

CREATE TABLE dept_emp (
  emp_no BIGINT,
  dept_no VARCHAR(30),
  from_date DATE,
  to_date DATE)
);

CREATE TABLE dept_manager (
  dept_no VARCHAR(30),
  emp_no BIGINT,
  from_date DATE,
  to_date DATE
);

CREATE TABLE employees (
  emp_no BIGINT NOT NULL PRIMARY KEY,
  birth_date DATE,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  gender VARCHAR(10),
  hire_date DATE
);

CREATE TABLE titles (
  emp_no BIGINT,
  title VARCHAR(30),
  from_date DATE,
  to_date DATE
);

CREATE TABLE salaries (
  emp_no BIGINT NOT NULL PRIMARY KEY,
  salary INT,
  from_date DATE,
  to_date DATE
);

-- Data Analysis 

/* 1. */
SELECT employees.emp_no, employees.last_name, employees.first_name, 
       employees.gender, salaries.salary
 FROM employees
  JOIN salaries 
   ON (employees.emp_no=salaries.emp_no)
;

/* 2. */
SELECT *
FROM employees
  WHERE employees.hire_date >= '1986-01-01'
       and employees.hire_date < '1987-01-01'
;

/* 3. */
SELECT departments.dept_name, dept_manager.dept_no, dept_manager.emp_no, 
       dept_manager.from_date, dept_manager.to_date, 
	   employees.last_name, employees.first_name
 FROM dept_manager
  JOIN employees
   ON (employees.emp_no=dept_manager.emp_no)
  JOIN departments
   ON (departments.dept_no=dept_manager.dept_no) 
;

/* 4. */
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, 
       departments.dept_name
  FROM dept_emp
   JOIN departments
    ON (departments.dept_no=dept_emp.dept_no)
   JOIN employees
    ON (employees.emp_no=dept_emp.emp_no)
;

/* 5. */
SELECT employees.last_name, employees.first_name
 FROM employees
  WHERE employees.first_name = 'Hercules'
  AND employees.last_name LIKE 'B%'
;

/* 6. */
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, 
       departments.dept_name
  FROM dept_emp
   JOIN departments
    ON (departments.dept_no=dept_emp.dept_no)
     JOIN employees
    ON (employees.emp_no=dept_emp.emp_no)
	 WHERE departments.dept_name = 'Sales'
;

/* 7. */
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, 
       departments.dept_name
  FROM dept_emp
   JOIN departments
    ON (departments.dept_no=dept_emp.dept_no)
     JOIN employees
    ON (employees.emp_no=dept_emp.emp_no)
	 WHERE departments.dept_name = 'Sales'
   OR departments.dept_name = 'Development'
;

/* 8. */
SELECT employees.last_name, COUNT(employees.last_name)
 FROM employees
  GROUP BY employees.last_name
  ORDER BY COUNT(employees.last_name) DESC

/* ERD CODE
Departments
-----------
dept_no PK VARCHAR(30) 
dept_name VARCHAR(30)

Dept_Emp
-----------
emp_no BIGINT
dept_no VARCHAR(30)
from_date DATE
  to_date DATE

Dept_Manager
-----------  
dept_no PK VARCHAR(30)
emp_no BIGINT
from_date DATE
to_date DATE

Employees
-----------
emp_no PK BIGINT
birth_date DATE,
first_name VARCHAR(30),
last_name VARCHAR(30),
gender VARCHAR(10),
hire_date DATE

Titles
------------
emp_no PK BIGINT 
title VARCHAR(30)
from_date DATE
to_date DATE

Salaries
------------
emp_no PK BIGINT
salary INT
from_date DATE
to_date DATE

*/