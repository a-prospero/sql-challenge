CREATE TABLE departments(
	id SERIAL PRIMARY KEY,
	dept_no VARCHAR,
	dept_name VARCHAR
);

SELECT * FROM departments

CREATE TABLE dept_emp(
	id SERIAL PRIMARY KEY,
	emp_no INT,
	dept_no VARCHAR
);

ALTER TABLE dept_emp 
ADD CONSTRAINT FK_emp_no FOREIGN KEY (id) 
REFERENCES dept_emp(id);

SELECT * FROM dept_emp

CREATE TABLE dept_manager(
	id SERIAL PRIMARY KEY,
	dept_no VARCHAR,
	emp_no INT
);

ALTER TABLE dept_manager 
ADD CONSTRAINT FK_dept_no FOREIGN KEY (id) 
REFERENCES dept_manager(id);

SELECT * FROM dept_manager

CREATE TABLE employees(
	id SERIAL PRIMARY KEY,
	emp_no INT,
	emp_title VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

ALTER TABLE employees 
ADD CONSTRAINT FK_emp_no FOREIGN KEY (id) 
REFERENCES employees(id);

SELECT * from employees

CREATE TABLE salaries(
	id SERIAL PRIMARY KEY,
	emp_no INT,
	salary INT
);

ALTER TABLE salaries 
ADD CONSTRAINT FK_emp_no FOREIGN KEY (id) 
REFERENCES salaries(id);

SELECT * FROM salaries

CREATE TABLE titles(
	id SERIAL PRIMARY KEY,
	title_id VARCHAR,
	title VARCHAR
);

SELECT * FROM titles

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN employees ON (dept_manager.emp_no=employees.emp_no)
JOIN departments ON (departments.dept_no=dept_manager.dept_no)

SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
FROM employees
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no;

SELECT employees.



