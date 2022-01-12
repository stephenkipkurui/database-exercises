-- 1). Use the employees database.
SHOW DATABASES;
USE employees; 
SHOW TABLES;

SELECT * FROM dept_manager LIMIT 50;
SELECT * FROM departments LIMIT 50;
SELECT * FROM employees LIMIT 50;
SELECT * FROM dept_emp LIMIT 50;
SELECT * FROM salaries;
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

SELECT d.`dept_name`, CONCAT(e.`first_name`,' ',e.`last_name`) AS 'Manager NAME' 

FROM employees AS e

JOIN `dept_emp` AS de 

	ON de.`emp_no` = `e`.emp_no

JOIN departments AS d 

	ON d.dept_no = de.dept_no
	
JOIN dept_manager AS dm
	
	ON dm.`emp_no` = e.`emp_no`
	
WHERE e.gender = 'F' AND dm.`to_date` ='9999-01-01' ORDER BY `dept_name`;



-- 4). Find the current titles of employees currently working in the Customer Service department.**********************

SELECT t.title AS Title

FROM titles AS t 
	
JOIN employees AS e
	
	ON e.emp_no = t.emp_no

JOIN dept_emp AS de 

	ON de.emp_no = `e`.emp_no

JOIN departments AS d 

	ON d.dept_no = de.dept_no
	
JOIN dept_manager AS dm
	
	ON dm.emp_no = e.emp_no
	
WHERE d.dept_name = 'Customer Service';


-- 5). Current salary of all current managers

SELECT d.`dept_name`, CONCAT(e.`first_name`,' ',e.`last_name`) AS 'Manager NAME' 

FROM employees AS e

JOIN `dept_emp` AS de 

	ON de.`emp_no` = `e`.emp_no

JOIN departments AS d 

	ON d.dept_no = de.dept_no
	
JOIN dept_manager AS dm
	
	ON dm.`emp_no` = e.`emp_no`
	
WHERE e.gender = 'F' AND dm.`to_date` ='9999-01-01' ORDER BY `dept_name`;



-- 6). num of current employees in each dept

SELECT d.`dept_no` AS `dept_no`, d.`dept_name` AS 'dept_name', COUNT(e.`emp_no`) AS num_employees

FROM employees AS e

JOIN `dept_emp` AS de 

	ON de.`emp_no` = `e`.emp_no

JOIN departments AS d 

	ON d.dept_no = de.dept_no
	
JOIN dept_manager AS dm
	
	ON dm.`emp_no` = e.`emp_no` GROUP BY `dept_no`;








