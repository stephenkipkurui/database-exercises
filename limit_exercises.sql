--  LIMIT EXERCISES
USE employees;
SELECT * FROM employees LIMIT 5;

-- 1. CREATE a NEW SQL script named limit_exercises.sql.
--  Completed


-- 2. MySQL provides a way TO RETURN only UNIQUE results FROM our queries WITH the keyword DISTINCT. FOR example, TO find ALL the UNIQUE titles within the company, we could run the following QUERY:
SELECT DISTINCT title FROM titles;

--  LIST the FIRST 10 DISTINCT LAST NAME sorted IN descending order.
SELECT DISTINCT last_name

FROM employees 

ORDER BY last_name 

DESC LIMIT 10;

-- 3. Find ALL previous OR current employees hired IN the 90s AND born ON Christmas. Find the FIRST 5 employees hired IN the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.
SELECT first_name, last_name, hire_date 

FROM employees 

  WHERE hire_date 

    LIKE '199%' 

  AND birth_date 

    LIKE '%-12-25' 

  ORDER BY hire_date 

LIMIT 5;

-- 4. Try TO think of your results AS batches, sets, OR pages. The FIRST five results are your FIRST page. The five AFTER that would be your SECOND page, etc. UPDATE the QUERY TO find the tenth page of results.
-- LIMIT AND OFFSET can be used TO CREATE multiple pages of data. What IS the relationship BETWEEN OFFSET (number of results TO skip), LIMIT (number of results per page), AND the page number?

SELECT first_name, last_name, hire_date 

FROM employees 

  WHERE hire_date 

    LIKE '199%' 

AND birth_date 

    LIKE '%-12-25' 

  ORDER BY hire_date 

LIMIT 5 

OFFSET 45;


