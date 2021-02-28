-- You have to create all of these tables in order because of they Primary Key and Foreign Key relationship.
-- You can't create table with a Foreign Key without table with Primary Key first because I am using in line constraint.

CREATE TABLE titles(
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(30) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex char(5) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
	emp_no INT, 
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE departments (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(40) NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INT, 
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(10),
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


