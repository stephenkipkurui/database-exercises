#SQL FUNCTIONS EXERCISES
SHOW DATABASES;

SHOW TABLES;
SELECT * FROM employees;
SELECT * FROM salaries;


-- 1. Copy the ORDER BY exercise AND save it AS functions_exercises.sql.
# Completed


-- 2.  WRITE a QUERY TO TO find ALL employees whose LAST NAME STARTS AND ENDS WITH 'E'. USE concat() TO combine their FIRST AND LAST NAME together AS a single COLUMN named full_name.

SELECT CONCAT(first_name, ' ',last_name) AS full_name  FROM employees;

-- 3. CONVERT the NAMES produced IN your LAST QUERY TO ALL uppercase.
SELECT UPPER(CONCAT(first_name, ' ',last_name)) AS full_name  FROM employees ;


-- 4. Find ALL employees hired IN the 90s AND born ON Christmas. USE datediff() FUNCTION TO find how many days they have been working AT the company (Hint: You will also need TO USE NOW() OR CURDATE()),
SELECT birth_date, first_name, last_name, hire_date FROM employees WHERE (birth_date LIKE '%-12-25%') AND hire_date BETWEEN '1990-01-01 ' AND '1999-12-31';


-- 5. Find the smallest AND largest current salary FROM the salaries table.
SELECT MIN(salary) AS minimum_salary, MAX(salary)  AS maximum_salary FROM salaries; # max 



-- 6. USE your knowledge of built IN SQL functions TO generate a username FOR ALL of the employees. A username should be ALL lowercase, AND consist of the FIRST CHARACTER of the employees FIRST NAME, the FIRST 4 characters of the employees LAST NAME, an underscore, the MONTH the employee was born, AND the LAST two digits of the YEAR that they were born. Below IS an example of what the FIRST 10 ROWS will look LIKE:
SELECT * FROM  employees;

SELECT CONCAT(CONCAT(SUBSTR(LOWER(first_name), 1,1), SUBSTR(LOWER(last_name), 1, 4)),'_') AS username, first_name, last_name, birth_date FROM employees;

