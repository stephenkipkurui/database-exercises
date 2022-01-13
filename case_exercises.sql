# Use CASE statements or IF() function to explore information in the employees database


-- CREATE a FILE named case_exercises.sql AND craft queries TO RETURN the results FOR the following criteria:
USE `employees`;
SHOW TABLES;
SELECT * FROM employees LIMIT 5;
SELECT * FROM departments LIMIT 5;
SELECT * FROM dept_emp LIMIT 5;


-- 1).  WRITE a QUERY that RETURNS ALL employees, their department number, their START DATE, their END DATE, AND a NEW COLUMN 'is_current_employee' that IS a 1 IF the employee IS still WITH the company AND 0 IF not.

SELECT CONCAT(`first_name`, ' ',`last_name`) AS 'Full Name', `dept_no` AS 'Department Number', from_date AS 'FROM DATE', `to_date` AS 'END DATE',  

  CASE 
  
    WHEN `to_date` > NOW() THEN 1
    
    WHEN `to_date` < NOW() THEN 0
    
  END AS 'IS _current_employee'
  
FROM dept_emp

JOIN employees USING (`emp_no`);
    
    
  
-- 2). WRITE a QUERY that RETURNS ALL employee NAMES (previous AND current), AND a NEW COLUMN 'alpha_group' that RETURNS 'A-H', 'I-Q', OR 'R-Z' depending ON the FIRST letter of their LAST name.

SELECT `first_name` AS 'FIRST NAME', `last_name` AS 'LAST NAME',

  CASE 
  
    WHEN UPPER(SUBSTR(`last_name`, 1,1)) BETWEEN  'A' AND 'H' THEN 'A-H'
    
    WHEN UPPER(SUBSTR(`last_name`, 1,1)) BETWEEN  'I' AND 'Q' THEN 'I-Q'
    
    WHEN UPPER(SUBSTR(`last_name`, 1,1)) BETWEEN  'R' AND 'Z' THEN 'R-Z'
    
  END AS 'alpha_group'
  
FROM `employees`

JOIN `dept_emp` USING (`emp_no`);


-- 3). How many employees (current OR previous) were born IN EACH decade?

SELECT 

  birth_date, CONCAT(first_name,' ',last_name) AS 'FULL NAME',

  CASE birth_date
  
    WHEN birth_date <  1900-01-01 THEN 'You were born BEFORE the 19000s '
   
    WHEN birth_date BETWEEN '1900-01-01' AND '1910-12-31' THEN 'You were born IN the 1900s'
    WHEN birth_date BETWEEN '1910-01-01' AND '1920-12-31' THEN 'You were born BETWEEN the 1910-1920'
    WHEN birth_date BETWEEN '1930-01-01' AND '1940-12-31' THEN 'You were born BETWEEN the 1910-1920'
    WHEN birth_date BETWEEN '1950-01-01' AND '1960-12-31' THEN 'You were born BETWEEN the 1910-1920'
    WHEN birth_date BETWEEN '1970-01-01' AND '1980-12-31' THEN 'You were born BETWEEN the 1910-1920'
    WHEN birth_date BETWEEN '1990-01-01' AND '2000-12-31' THEN 'You were born BETWEEN the 1910-1920'

  
  
  END AS 'Employees Count BY Decade'
  
  
FROM employees

GROUP BY birth_date;
  
  
  
    




-- What IS the current average salary FOR EACH of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?