# SQL SUBQUERIES EXERCISES


USE employees;
SHOW TABLES;

SELECT * FROM employees LIMIT 5;
SELECT * FROM titles LIMIT 5;
SELECT * FROM salaries LIMIT 5;
SELECT * FROM departments LIMIT 5;
SELECT * FROM dept_manager LIMIT 5;

-- 1). Find ALL the current employees WITH the same hire DATE AS employee 101010 USING a sub-query.

SELECT `first_name`, `last_name`, `hire_date` 

FROM employees 

WHERE `hire_date` IN 

(SELECT `hire_date` FROM employees WHERE emp_no = 101010);

-- 2). Find ALL the titles ever held BY ALL current employees WITH the FIRST NAME Aamod.
SELECT title AS 'Titles Held by Aamod'

FROM titles 

WHERE `emp_no` IN 

(SELECT emp_no FROM employees  WHERE `first_name` LIKE '%Aamod%') AND `to_date` > NOW();  


-- 3). How many people IN the employees TABLE are NO longer working FOR the company? Give the answer IN a COMMENT IN your code. [ #30024 employees]
SELECT COUNT(CONCAT (first_name, ' ', last_name)) AS 'Employees Not Current With Company' 

FROM employees 

WHERE emp_no IN 

(SELECT emp_no FROM salaries WHERE `to_date` < '9999-01-01');


-- 4). Find ALL the current department managers that are female. LIST their NAMES IN a COMMENT IN your code. [__________ Hilary Kambil, Leon DasSarma, Karsten Sigstan, Isamu Legleitner_________]

SELECT * 

FROM employees

WHERE emp_no IN (SELECT emp_no FROM dept_manager WHERE to_date = '9999-01-01'

AND gender IN (SELECT gender FROM employees WHERE gender = 'F')

);


-- 5). Find ALL the employees who currently have a higher salary THAN the companies overall, historical average salary.
SELECT * FROM employees 

WHERE emp_no IN (

SELECT emp_no FROM salaries WHERE salary > (SELECT  AVG(salary) FROM salaries WHERE to_date > CURDATE()) 

AND to_date > now());


-- 6). How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can USE a built IN FUNCTION TO calculate the standard deviation.) What percentage of ALL salaries IS this?

# [************Expirienced difficulty- Need more practice with this question******************]

-- Hint Number 1 You will likely USE a combination of different kinds of subqueries.
-- Hint Number 2 Consider that the following CODE will produce the z score FOR current salaries.

# [************Expirienced difficulty- Need more practice with this question******************]

