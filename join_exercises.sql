-- 1). Use the employees database.
SHOW DATABASES;
USE employees; 
SHOW TABLES;

SELECT * FROM dept_manager LIMIT 50;
SELECT * FROM departments LIMIT 50;
SELECT * FROM employees LIMIT 50;
SELECT * FROM dept_emp LIMIT 50;
SELECT * FROM salaries;
SELECT * FROM titles LIMIT 10;

DESCRIBE `dept_manager`;

-- 2). Using the example in the Associative Table Joins section as a guide, write a query that shows each department along 
-- with the name of the current manager for that department.

SELECT CONCAT(employees.`first_name`, ' ', employees.`last_name`) AS full_name, 
departments.`dept_name` AS department_name,
debt_manager.`dept_no` AS employee_number,
dept_emp.`dept_no` AS depatment_number
FROM `employees` AS ACH
JOIN `dept_manager` ON `dept_manager`.`emp_no` = `employees`.`emp_no`
JOIN `departments` ON `departments`.`dept_no` = `dept_emp`.`dept_no`
JOIN `dept_manager` ON `dept_manager`.`dept_no` = `departments`.`dept_no`

WHERE `dept_emp`.`to_date` = '9999-01-01';


-- 3). Find the name of all departments currently managed by women.

SELECT d.`dept_name` AS 'Department Name', CONCAT(e.`first_name`,' ',e.`last_name`) AS 'Manager Name' 

FROM employees AS e

JOIN `dept_emp` AS de 

	ON de.`emp_no` = `e`.emp_no

JOIN departments AS d 

	ON d.dept_no = de.dept_no
	
JOIN dept_manager AS dm
	
	ON dm.`emp_no` = e.`emp_no`
	
WHERE e.gender = 'F' AND dm.`to_date` ='9999-01-01';



-- 4). Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),

SELECT CONCAT(employees.`first_name`,' ', employees.`last_name`) AS full_name, 
`dept_emp`.`dept_no` AS department_number,

DATEDIFF(CURDATE(),(employees.`hire_date`)) AS days_in_company
FROM employees
JOIN `dept_emp` ON `dept_emp`.`emp_no` = `employees`.`emp_no`
WHERE  `employees`.`hire_date` LIKE '199%' AND employees.`birth_date` LIKE '%-12-25'

-- 5). Current salary of all current managers

SELECT `departments`.`dept_name` AS dept_name, CONCAT(employees.`first_name`,' ',employees.`last_name`),
salaries.`salary` AS Salary 
FROM employees
JOIN salaries ON `salaries`.`emp_no` = `employees`.`emp_no`
JOIN departments ON `departments`.`dept_no` = `dept_emp`.`dept_no`
WHERE `dept_emp`.`to_date` = '9999-01-01';


-- 6). num of current employees in each dept

SELECT departments.`dept_no`, departments.`dept_name`, COUNT(employees.`emp_no`) 
FROM `employees`
JOIN employees.`emp_no`








