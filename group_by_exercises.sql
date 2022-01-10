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

-- 5. WRITE a QUERY TO find the UNIQUE LAST NAMES WITH a 'q' but NOT 'qu'. Include those NAMES IN a COMMENT IN your SQL code. ********************************** Not using GROUP BY
SELECT last_name FROM employees WHERE  last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

-- 6. ADD a COUNT() TO your results (the QUERY above) TO find the number of employees WITH the same LAST name. # [ 547 RECORDS ]
SELECT COUNT(last_name) FROM employees WHERE  last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'; 


-- 7 Find ALL ALL employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya'. USE COUNT(*) AND GROUP BY TO find the number of employees FOR EACH gender WITH those names. ***********************
SELECT first_name, COUNT(gender) AS gender_count FROM employees GROUP BY first_name HAVING first_name = 'Irene' OR first_name = 'Vidya' OR first_name = 'Maya';


-- 8 USING your QUERY that generates a username FOR ALL of the employees, generate a count employees FOR EACH UNIQUE username. Are there ANY DUPLICATE usernames? BONUS: How many DUPLICATE usernames are there?*************************


SELECT LOWER(
	CONCAT(
		SUBSTR(first_name,1,1),
		SUBSTR(last_name,1, 4),
		'_',
		SUBSTR(birth_date,6, 2),
		SUBSTR(birth_date,3, 2)
	)) AS username, COUNT(*) FROM employees GROUP BY username ORDER BY COUNT(*) DESC;
	
	


-- 9. More practice WITH AGGREGATE functions:
-- 		a). Determine the historic average salary FOR EACH employee. WHEN you hear, READ, OR think "for each" WITH regard TO SQL, you'll probably be grouping BY that exact column.

-- For each mean GROUP BY THAT referrence.




--      b). USING the dept_emp TABLE, count how many current employees WORK IN EACH department. The QUERY result should SHOW 9 ROWS, ONE FOR EACH department AND the employee count.


-- 		c). Determine how many different salaries EACH employee has had. This includes BOTH historic AND current.


-- 		d). Find the maximum salary FOR EACH employee.


-- 		e). Find the minimum salary FOR EACH employee.


-- 		f). Find the standard deviation of salaries FOR EACH employee.


-- 		g). Now find the max salary FOR EACH employee WHERE that max salary IS greater THAN $150,000.


-- 		h). Find the average salary for each employee where that average salary is between $80k and $90k.

