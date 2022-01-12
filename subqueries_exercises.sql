
USE employees;
SHOW TABLES;

SELECT * FROM employees LIMIT 5;
SELECT * FROM titles LIMIT 5;


-- 1). Find ALL the current employees WITH the same hire DATE AS employee 101010 USING a sub-query.

SELECT `first_name`, `last_name`, `hire_date` 

FROM employees 

WHERE `hire_date` IN 

(SELECT `hire_date` FROM employees WHERE emp_no = 101010);

-- 2). Find ALL the titles ever held BY ALL current employees WITH the FIRST NAME Aamod.
(SELECT * FROM employees WHERE `first_name` LIKE '%Aamod%');


-- 3). How many people IN the employees TABLE are NO longer working FOR the company? Give the answer IN a COMMENT IN your code.

-- 4). Find ALL the current department managers that are female. LIST their NAMES IN a COMMENT IN your code.

-- 5). Find ALL the employees who currently have a higher salary THAN the companies overall, historical average salary.

-- 6). How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can USE a built IN FUNCTION TO calculate the standard deviation.) What percentage of ALL salaries IS this?

-- Hint Number 1 You will likely USE a combination of different kinds of subqueries.
-- Hint Number 2 Consider that the following CODE will produce the z score FOR current salaries.