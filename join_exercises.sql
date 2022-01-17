# JOIN SQL EXERCISES 


-- 1). Use the employees database.
SHOW DATABASES;
USE employees; 
SHOW TABLES;

SELECT * FROM dept_manager LIMIT 50;
SELECT * FROM departments LIMIT 50;
SELECT * FROM employees LIMIT 50;
SELECT * FROM dept_emp LIMIT 50;
SELECT * FROM salaries LIMIT 5;
SELECT * FROM titles LIMIT 50;

DESCRIBE `dept_manager`;

-- 2). Using the example in the Associative Table Joins section as a guide, write a query that shows each department along 
-- with the name of the current manager for that department.


SELECT d.`dept_name` AS 'Department Name', CONCAT(e.`first_name`,' ',e.`last_name`) AS 'Department Manager' 

FROM employees AS e

JOIN `dept_emp` AS de 

	ON de.`emp_no` = `e`.emp_no

JOIN departments AS d 

	ON d.dept_no = de.dept_no
	
JOIN dept_manager AS dm
	
	ON dm.`emp_no` = e.`emp_no`
	
WHERE dm.`to_date` ='9999-01-01' ORDER BY dept_name;



-- 3). Find the name of all departments currently managed by women.

SELECT d.`dept_name`, CONCAT(e.`first_name`,' ',e.`last_name`) AS 'Manager Name' 

FROM employees AS e

JOIN `dept_emp` AS de 

	ON de.`emp_no` = e.`emp_no`

JOIN departments AS d 

	ON d.`dept_no` = de.`dept_no`
	
JOIN dept_manager AS dm
	
	ON dm.`emp_no` = e.`emp_no`
	
WHERE e.`gender` = 'F' AND dm.`to_date` ='9999-01-01' ORDER BY `dept_name`;



-- 4). Find the current titles of employees currently working in the Customer Service department

SELECT t.title AS Title, CONCAT(e.first_name, ' ',e.last_name) 'Full Name'

FROM titles AS t 
	
JOIN employees AS e
	
	ON e.emp_no = t.emp_no

JOIN dept_emp AS de 

	ON de.emp_no = `e`.emp_no

JOIN departments AS d 

	ON d.dept_no = de.dept_no
	
JOIN dept_manager AS dm
	
	ON dm.emp_no = e.emp_no
	
WHERE d.dept_name = 'Customer Service' AND de.to_date = '9999-01-01';


-- 5). Current salary of all current managers
SELECT dm.dept_no, d.dept_name, CONCAT(e.first_name, ' ', e.last_name) 'Current Manager', s.salary

FROM salaries s

JOIN dept_emp de USING (emp_no)

JOIN departments d USING (dept_no)

JOIN employees e USING (emp_no)

JOIN dept_manager dm USING (emp_no)

WHERE  dm.to_date = '9999-01-01'

GROUP BY  dept_no, dept_name, first_name, last_name, salary

ORDER BY MAX(s.salary) DESC;



-- 6). num of current employees in each dept

SELECT d.`dept_no` AS `dept_no`, d.`dept_name` AS 'dept_name', COUNT(e.`emp_no`) AS num_employees

FROM employees AS e

JOIN `dept_emp` AS de 

	ON de.`emp_no` = `e`.emp_no

JOIN departments AS d 

	ON d.dept_no = de.dept_no
	
JOIN dept_manager AS dm
	
	ON dm.`emp_no` = e.`emp_no` GROUP BY `dept_no`;


-- 7). Which department has the highest average salary? Hint: Use current not historic information. SALES DEPARTMENT

SELECT de.dept_no, d.dept_name, AVG(s.salary)

FROM salaries s

JOIN dept_emp de USING (emp_no)

JOIN departments d USING (dept_no)

WHERE s.to_date = '9999-01=01' 

GROUP BY  dept_no, dept_name, salary ORDER BY AVG(s.salary) DESC LIMIT 1;
	

-- 8). Who IS the highest paid employee IN the Marketing department? AKEMI WARWICK

SELECT de.dept_no, d.dept_name, e.first_name, e.last_name, MAX(s.salary)

FROM salaries s

JOIN dept_emp de USING (emp_no)

JOIN departments d USING (dept_no)

JOIN employees e USING (emp_no)

WHERE  d.dept_name = 'Marketing' 

GROUP BY  dept_no, dept_name, first_name, last_name

ORDER BY MAX(s.salary) DESC LIMIT 1;



-- 9). Which current department manager has the highest salary? VISHWANI MINAKAWA
SELECT dm.dept_no, d.dept_name, CONCAT(e.first_name, ' ', e.last_name) 'Current Manager', s.salary

FROM salaries s

JOIN dept_emp de USING (emp_no)

JOIN departments d USING (dept_no)

JOIN employees e USING (emp_no)

JOIN dept_manager dm USING (emp_no)

WHERE  dm.to_date = '9999-01-01'

GROUP BY  dept_no, dept_name, first_name, last_name, salary

ORDER BY MAX(s.salary) DESC LIMIT 1;


-- 10). Determine the average salary for each department. Use all salary information and round your results.

SELECT d.`dept_name` AS 'Department NAME', ROUND(AVG(s.`salary`), 2) AS Salary 

FROM departments AS d

JOIN dept_emp AS de

	ON de.`dept_no` = d.`dept_no`
	
JOIN salaries AS s

	ON s.`emp_no` = de.`emp_no`
	
GROUP BY `dept_name`;


-- 11). Bonus Find the names of all current employees, their department name, and their current manager's name.

SELECT CONCAT (e.`first_name`,' ', e.`last_name`) AS 'Employee Name', d.`dept_name` AS 'Department NAME', dm.`emp_no` AS 'Manager Name' 

FROM employees AS e

JOIN `dept_emp` AS de 

	ON de.`emp_no` = e.`emp_no`

JOIN departments AS d 

	ON d.`dept_no` = de.`dept_no`
	
JOIN dept_manager AS dm
	
	ON dm.`emp_no` = e.`emp_no`
	
WHERE dm.`to_date` ='9999-01-01' ORDER BY `dept_name`;


-- 12. Bonus Who is the highest paid employee within each department.

SELECT CONCAT (e.`first_name`,' ', e.`last_name`) AS 'Full Employee Name', d.`dept_name` AS 'Department NAME', MAX(s.`salary`) AS 'Highest Pay'

FROM employees AS e

JOIN `dept_emp` AS de 

	ON de.`emp_no` = e.`emp_no`

JOIN departments AS d 

	ON d.`dept_no` = de.`dept_no`
	
JOIN dept_manager AS dm
	
	ON dm.`emp_no` = e.`emp_no`
	
JOIN salaries AS s

	ON s.`emp_no` = de.`emp_no`
	
WHERE dm.`to_date` ='9999-01-01'  

GROUP BY dept_name, salary, first_name, last_name ORDER BY salary DESC ;
