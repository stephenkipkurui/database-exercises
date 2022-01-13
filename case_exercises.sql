# Use CASE statements or IF() function to explore information in the employees database


-- CREATE a FILE named case_exercises.sql AND craft queries TO RETURN the results FOR the following criteria:
USE `employees`;
SHOW TABLES;
SELECT * FROM employees LIMIT 5;
SELECT * FROM departments LIMIT 5;
SELECT * FROM dept_emp LIMIT 5;


-- 1).  WRITE a QUERY that RETURNS ALL employees, their department number, their START DATE, their END DATE, AND a NEW COLUMN 'is_current_employee' that IS a 1 IF the employee IS still WITH the company AND 0 IF not.

SELECT CONCAT(`first_name`, ' ',`last_name`), `dept_no`, from_date AS 'FROM DATE', `to_date` AS 'END DATE',  

  CASE 
  
    WHEN `to_date` > NOW() THEN 1
    
    WHEN `to_date` < NOW() THEN 0
    
  END AS 'IS _current_employee'
  
FROM dept_emp

JOIN employees USING (`emp_no`);
    
    
  
-- WRITE a QUERY that RETURNS ALL employee NAMES (previous AND current), AND a NEW COLUMN 'alpha_group' that RETURNS 'A-H', 'I-Q', OR 'R-Z' depending ON the FIRST letter of their LAST name.


-- How many employees (current OR previous) were born IN EACH decade?


-- What IS the current average salary FOR EACH of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?