-- queries.sql file used to query the tables created by tables.sql
-- Jonathan Surgeon 5/18/21

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no AS "Employee Number", e.first_name as "First Name", e.last_name as "Last Name", e.sex as "Sex", s.salary as "Salary"
FROM employees as e
INNER JOIN SALARIES as s 
	ON (e.emp_no=s.emp_no)
ORDER BY e.emp_no ASC;

------------------------------------------------------------------------------------------------------------------------------------------
-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name AS "First Name", last_name AS "Last Name", hire_date as "Hire Date"
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'; 

------------------------------------------------------------------------------------------------------------------------------------------
-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no AS "Department Number", 
	d.dept_name AS "Department Name", 
	m.emp_no AS "Manager ID", 
	e.first_name AS "Manager First Name", 
	e.last_name AS "Manager Last Name"
FROM departments AS d
INNER JOIN dept_manager AS m
	ON (d.dept_no=m.dept_no)
INNER JOIN employees AS e
	ON (e.emp_no=m.emp_no)
ORDER BY d.dept_no DESC;

------------------------------------------------------------------------------------------------------------------------------------------
-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number", e.first_name AS "First Name", e.last_name AS "Last Name", n.dept_name as "Department Name"
FROM employees AS e
INNER JOIN dept_emp AS d
	ON (e.emp_no=d.emp_no)
INNER JOIN departments as n
	ON (d.dept_no=n.dept_no);
	
------------------------------------------------------------------------------------------------------------------------------------------
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name AS "First Name", last_name AS "Last Name", sex AS "Sex"
FROM EMPLOYEES
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

------------------------------------------------------------------------------------------------------------------------------------------
-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE VIEW sales_employees_join AS
SELECT e.emp_no AS "Employee Number", e.first_name AS "First Name", e.last_name AS "Last Name", d.dept_name as "Department"
FROM employees e
INNER JOIN dept_emp de
	ON (e.emp_no=de.emp_no)
INNER JOIN departments d
	ON (de.dept_no=d.dept_no)
WHERE dept_name = 'Sales';
--check count to validate
SELECT COUNT(*)
FROM sales_employees_join;


------------------------------------------------------------------------------------------------------------------------------------------
-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW sales_and_development_employees_join AS
SELECT e.emp_no AS "Employee Number", e.first_name AS "First Name", e.last_name AS "Last Name", d.dept_name as "Department"
FROM employees e
INNER JOIN dept_emp de
	ON (e.emp_no=de.emp_no)
INNER JOIN departments d
	ON (de.dept_no=d.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development';
--check count to validate
SELECT COUNT(*)
FROM sales_and_development_employees_join;
------------------------------------------------------------------------------------------------------------------------------------------
-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name AS "Last Name", COUNT(last_name) AS "Count"
FROM employees e
GROUP BY last_name
ORDER BY "Count" DESC;