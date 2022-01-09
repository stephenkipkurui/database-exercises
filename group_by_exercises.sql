-- GROUP BY EXERCISES
SHOW DATABASES;
USE employees;
SHOW TABLES;
DESCRIBE TABLE titles;


-- 1. Create a new file named group_by_exercises.sql
-- Completed

-- 2. IN your script, USE DISTINCT TO find the UNIQUE titles IN the titles table. How many UNIQUE titles have there ever been? Answer that IN a COMMENT IN your SQL file.
SELECT * FROM employees;
SELECT DISTINCT title AS distinct_titles  FROM titles; # 7 titles

-- 3. WRITE a QUERY TO find a LIST of ALL UNIQUE LAST NAMES of ALL employees that START AND END WITH 'E' USING GROUP BY.
#SELECT DISTINCT	last_name FROM employees WHERE last_name LIKE 'E%E';
SELECT last_name FROM employees WHERE last_name LIKE 'E%E' GROUP BY last_name;

-- 4. WRITE a QUERY TO find ALL UNIQUE combinations of FIRST AND LAST NAMES of ALL employees whose LAST NAMES START AND END WITH 'E'.**********************************
SELECT CONCAT(first_name, last_name) AS full_name FROM employees WHERE last_name  LIKE 'E%E' GROUP BY full_name;

-- 5. WRITE a QUERY TO find the UNIQUE LAST NAMES WITH a 'q' but NOT 'qu'. Include those NAMES IN a COMMENT IN your SQL code.


-- 6. ADD a COUNT() TO your results (the QUERY above) TO find the number of employees WITH the same LAST name.


-- 7 Find ALL ALL employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya'. USE COUNT(*) AND GROUP BY TO find the number of employees FOR EACH gender WITH those names.


-- 8 USING your QUERY that generates a username FOR ALL of the employees, generate a count employees FOR EACH UNIQUE username. Are there ANY DUPLICATE usernames? BONUS: How many DUPLICATE usernames are there?


-- 9. More practice WITH AGGREGATE functions:
-- 		a). Determine the historic average salary FOR EACH employee. WHEN you hear, READ, OR think "for each" WITH regard TO SQL, you'll probably be grouping BY that exact column.


--      b). USING the dept_emp TABLE, count how many current employees WORK IN EACH department. The QUERY result should SHOW 9 ROWS, ONE FOR EACH department AND the employee count.


-- 		c). Determine how many different salaries EACH employee has had. This includes BOTH historic AND current.


-- 		d). Find the maximum salary FOR EACH employee.


-- 		e). Find the minimum salary FOR EACH employee.


-- 		f). Find the standard deviation of salaries FOR EACH employee.


-- 		g). Now find the max salary FOR EACH employee WHERE that max salary IS greater THAN $150,000.


-- 		h). Find the average salary for each employee where that average salary is between $80k and $90k.

