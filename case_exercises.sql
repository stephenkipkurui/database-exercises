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

  CASE
  
    WHEN birth_date <  '1900-01-01' THEN 'You were born BEFORE the 19000s in the other centuary '
   
    WHEN birth_date BETWEEN '1900-01-01' AND '1909-12-31' THEN 'You were born IN the 1900s'
    WHEN birth_date BETWEEN '1911-01-01' AND  '1919-12-31' THEN 'You were born BETWEEN the 1910-1920s'
    WHEN birth_date BETWEEN '1921-01-01' AND  '1929-12-31' THEN 'You were born BETWEEN the 1921-1920s'
    WHEN birth_date BETWEEN '1931-01-01' AND  '1939-12-31' THEN 'You were born BETWEEN the 1931-1940s'
    WHEN birth_date BETWEEN '1941-01-01' AND  '1949-12-31' THEN 'You were born BETWEEN the 1911-1920s'
    WHEN birth_date BETWEEN '1951-01-01' AND  '1959-12-31' THEN 'You were born BETWEEN the 1941-1950s'
    WHEN birth_date BETWEEN '1961-01-01' AND  '1970-12-31' THEN 'You were born BETWEEN the 1951-1960s'
    WHEN birth_date BETWEEN '1971-01-01' AND  '1980-12-31' THEN 'You were born BETWEEN the 1961-1970s'
    WHEN birth_date BETWEEN '1981-01-01' AND  '1989-12-31' THEN 'You were born BETWEEN the 1911-1920s'

    WHEN birth_date BETWEEN '1991-01-01' AND  '2000-12-31' THEN 'You were born BETWEEN the 1971-1980s'
    
    WHEN birth_date > NOW() THEN 'You are yet to be born'
  
  END AS 'Employees Count BY Decade'
  
FROM employees;



# [Correction version-------------Start ----------------]
SELECT 

  CONCAT(SUBSTR(birth_date, 1, 3), '0') AS decade,
  
  COUNT(*)
  
FROM employees

GROUP BY decade;
# [ Corrections ------------ End -----------------------]
  

-- 4). What IS the current average salary FOR EACH of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
/* SELECT * FROM employees LIMIT 5;
SELECT * FROM departments LIMIT 50;
SELECT * FROM dept_emp LIMIT 5;
SELECT * FROM salaries LIMIT 5; */

SELECT 

  CASE 
  
    WHEN d.dept_name IN ('Research', 'Development') THEN 'R&D'
    
    WHEN d.dept_name IN ('Marketing', 'Sales') THEN 'Sales AND Marketing' 
    
    WHEN d.dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
    
    WHEN d.dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
    
    WHEN d.dept_name IN ('Customer Service') THEN 'Customer Service'
      
    ELSE d.dept_name
  
  END AS average_salary,
  
  AVG(s.salary) AS 'Average Salary'
  
FROM departments d

JOIN dept_emp de USING (dept_no)

JOIN salaries s USING (emp_no)

GROUP BY average_salary;












