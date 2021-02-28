-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no AS "Employee ID", e.last_name AS "Last Name", e.first_name AS "First Name", e.sex AS "Sex", s.salary AS "Salary"
FROM employees e NATURAL JOIN salaries s;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
-- Use TO_CHAR function to convert Date data type into String data type then search in the string that contains '1986'
SELECT first_name AS "First Name", last_name AS "Last Name", hire_date AS "Hire Date"
FROM employees
WHERE TO_CHAR(hire_date, 'Month DD, YYYY') LIKE '%1986';


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- Use the manager table to list out all the employees who are managers and join other 2 tables to list out their infor.
SELECT m.dept_no AS "Department Number", d.dept_name AS "Department Name", m.emp_no AS "Manager Employee Number", e.last_name AS "Last Name", e.first_name "First Name"
FROM dept_manager m NATURAL JOIN departments d NATURAL JOIN employees e;


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
-- Use the employees table to list out their infor. and then join the department to list their departments
SELECT p.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM employees e NATURAL JOIN dept_emp p NATURAL JOIN departments d; 

 
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name AS "First Name", last_name AS "Last Name", sex AS "Sex"
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT p.emp_no AS "Employees Number", e.last_name AS  "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM employees e NATURAL JOIN dept_emp p NATURAL JOIN departments d
WHERE dept_name LIKE 'Sales';


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT p.emp_no AS "Employees Number", e.last_name AS  "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM employees e NATURAL JOIN dept_emp p NATURAL JOIN departments d
WHERE dept_name IN ('Sales', 'Development');


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name AS "Last Name", COUNT(last_name) AS "Number of Employees"
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;
