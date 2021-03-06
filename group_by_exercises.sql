-- GROUP BY EXERCISES
USE employees;
DESCRIBE TABLE titles;
SELECT * FROM employees LIMIT 4;


-- 1. Create a new file named group_by_exercises.sql
-- Completed

-- 2. IN your script, USE DISTINCT TO find the UNIQUE titles IN the titles table. How many UNIQUE titles have there ever been? Answer that IN a COMMENT IN your SQL file.
SELECT COUNT(DISTINCT title) AS distinct_titles FROM titles; # 7 titles
#display all titles
SELECT title FROM titles GROUP BY title;

-- 3. WRITE a QUERY TO find a LIST of ALL UNIQUE LAST NAMES of ALL employees that START AND END WITH 'E' USING GROUP BY.
#SELECT DISTINCT	last_name FROM employees WHERE last_name LIKE 'E%E';
SELECT last_name 

FROM employees 

  WHERE last_name 

    LIKE 'E%E' 

GROUP BY last_name;

-- 4. WRITE a QUERY TO find ALL UNIQUE combinations of FIRST AND LAST NAMES of ALL employees whose LAST NAMES START AND END WITH 'E'.
SELECT CONCAT(first_name, last_name) AS full_name 

FROM employees 

    WHERE last_name  

      LIKE 'E%E' 

GROUP BY full_name;

-- 5. WRITE a QUERY TO find the UNIQUE LAST NAMES WITH a 'q' but NOT 'qu'. Include those NAMES IN a COMMENT IN your SQL code.
SELECT last_name 

FROM employees 

    WHERE  last_name 

      LIKE '%q%' 

    AND last_name 

      NOT LIKE '%qu%' 

GROUP BY last_name;

-- 6. ADD a COUNT() TO your results (the QUERY above) TO find the number of employees WITH the same LAST name.
SELECT last_name, COUNT(*) 'Employee Count'  

FROM employees 

  WHERE  last_name 

    LIKE '%q%' 

  AND last_name 

    NOT LIKE '%qu%' 

GROUP BY last_name; 


-- 7 Find ALL ALL employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya'. USE COUNT(*) AND GROUP BY TO find the number of employees FOR EACH gender WITH those names.
SELECT first_name, gender, COUNT(*) AS gender_count 

FROM employees 

WHERE first_name 

  IN ('Irena', 'Vidya', 'Maya') 

GROUP BY first_name, gender;

 
-- 8 USING your QUERY that generates a username FOR ALL of the employees, generate a count employees FOR EACH UNIQUE username. Are there ANY DUPLICATE usernames? BONUS: How many DUPLICATE usernames are there?

SELECT DISTINCT  COUNT(

   LOWER(
      CONCAT(
          SUBSTR(first_name, 1, 1),
          SUBSTR(last_name, 1, 4),
          '_',
          SUBSTR(birth_date, 6, 2),
          SUBSTR(birth_date, 3, 2)
          ) 
        )
      ) 
            
  AS 'Unique Username Count'

FROM employees 

GROUP BY  first_name;
	

-- 9. More practice WITH AGGREGATE functions:
-- 		a). Determine the historic average salary FOR EACH employee. WHEN you hear, READ, OR think "for each" WITH regard TO SQL, you'll probably be grouping BY that exact column.

-- For each mean GROUP BY THAT referrence.
SELECT emp_no, AVG(salary) AS average_salaries FROM salaries GROUP BY emp_no;


--      b). USING the dept_emp TABLE, count how many current employees WORK IN EACH department. The QUERY result should SHOW 9 ROWS, ONE FOR EACH department AND the employee count.
SELECT * FROM dept_emp LIMIT 5;

SELECT dept_no, COUNT(*) 'Employee Count By Department' 

FROM dept_emp  

    WHERE to_date 

      LIKE '%9999-01-01%' 

GROUP BY dept_no;



-- 		c). Determine how many different salaries EACH employee has had. This includes BOTH historic AND current.***********************
SELECT emp_no 'Employee', COUNT(salary) 'Number of Salary Ever Earned'

FROM salaries 

GROUP BY emp_no; 



-- 		d). Find the maximum salary FOR EACH employee.

SELECT MAX(salaries.`emp_no`) AS 'Maximum Salary', employees.`first_name` 'FIRST NAME', employees.`last_name` 'LAST NAME' 

FROM employees 

  INNER JOIN salaries 

    ON salaries.`emp_no` = employees.`emp_no` 

GROUP BY employees.`emp_no`;


-- 		e). Find the minimum salary FOR EACH employee.

SELECT emp_no 'Employee Number', MIN(salary) 'Minimum Salary' 

FROM salaries 

GROUP BY emp_no;



# [______ DISPLAY EMPLOYEE NAME AND MIN SALARY ABOVE ________]
SELECT MIN(salaries.`emp_no`) AS min_salary, employees.`first_name`, employees.`last_name` 

FROM employees 

  INNER JOIN salaries 

    ON salaries.`emp_no` = employees.`emp_no` 

GROUP BY employees.`emp_no`;

-- 		f). Find the standard deviation of salaries FOR EACH employee.**************************
SELECT emp_no 'Employee Number', ROUND(STD(salary), 2) 'Employee Standard Deviation' 

FROM salaries 

GROUP BY emp_no;


-- 		g). Now find the max salary FOR EACH employee WHERE that max salary IS greater THAN $150,000.
SELECT emp_no 'Employee Number', MAX(salary) 'Employee Maximum Salary Greater than 150,000'

FROM salaries 

WHERE salary > 15000 GROUP BY emp_no;


-- [_______MAX SALARY WITH NAMES ABOVE________]
SELECT MAX(salaries.`emp_no`) AS max_salary, employees.`first_name`, employees.`last_name` 

FROM employees 

INNER JOIN salaries 

ON salaries.`emp_no` = employees.`emp_no` 

GROUP BY employees.`emp_no` 

HAVING max_salary > 150000;


-- 		h). Find the average salary for each employee where that average salary is between $80k and $90k.

SELECT salaries.emp_no 'Employee Number', MAX(salaries.`emp_no`) AS max_salary, CONCAT (employees.`first_name`, employees.`last_name`) 'Full Name' 

FROM employees 

INNER JOIN salaries 

ON salaries.`emp_no` = employees.`emp_no` 

GROUP BY employees.`emp_no` 

HAVING max_salary 

BETWEEN 80000 AND 90000;