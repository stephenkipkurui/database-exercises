# SQL TEMPORARY TABLE EXERCISES 01/13/22
USE innis_1672;
SHOW TABLES;

-- Create a file named temporary_tables.sql to do your work for this exercise.
# Completed


/* 1). USING the example FROM the lesson, CREATE a TEMPORARY TABLE called employees_with_departments that CONTAINS first_name, last_name, AND dept_name FOR employees currently WITH that department. Be absolutely sure TO CREATE this TABLE ON your own database. IF you see "Access denied for user ...", it means that the QUERY was attempting TO WRITE a NEW TABLE TO a DATABASE that you can only read. */

CREATE TEMPORARY TABLE employees_with_departments(first_name VARCHAR(50) NOT NULL, last_name VARCHAR(50) NOT NULL , dept_name VARCHAR(50) NOT NULL );

-- a).  ADD a COLUMN named full_name TO this table. It should be a VARCHAR whose length IS the sum of the lengths of the FIRST NAME AND LAST NAME COLUMNS
ALTER TABLE employees_with_departments ADD full_name VARCHAR(100);

-- b).  UPDATE the TABLE so that FULL NAME COLUMN CONTAINS the correct DATA
SELECT * FROM employees_with_departments;

DESCRIBE employees_with_departments;


UPDATE TABLE employees_with_departments SET full_name = CONCAT('first_name', ' ','last_name');

-- c).  Remove the first_name AND last_name COLUMNS FROM the table.
ALTER TABLE employees_with_departments DROP COLUMN full_name;


-- d).  What IS another way you could have ended up WITH this same TABLE?

/* 
 2). CREATE a TEMPORARY TABLE based ON the payment TABLE FROM the sakila database. */ 
 
#USE sakila;

#DESCRIBE TABLE payment;
 
CREATE TEMPORARY TABLE temp_payment AS (SELECT * FROM sakila.payment); 

DESCRIBE temp_payment;

 # WRITE the SQL necessary TO transform the amount COLUMN such that it IS stored AS an INTEGER representing the number of cents of the payment. FOR example, 1.99 should become 199.*/
DROP TABLE IF EXISTS temp_payments;

CREATE TEMPORARY TABLE temp_payment 

AS (

    SELECT payment_id, customer_id, staff_id, rental_id, amount * 100, payment_date, last_update 
    
    FROM sakila.payment);


/* 3).  Find OUT how the current average pay IN EACH department compares TO the overall, historical average pay. IN order TO make the comparison easier, you should USE the Z-score FOR salaries. IN terms of salary, what IS the best department RIGHT now TO WORK FOR? The worst? */
USE employees;
SHOW TABLES;

SELECT * FROM employees LIMIT 5;
SELECT * FROM dept_emp LIMIT 5;
SELECT * FROM dept_manager LIMIT 5;
SELECT * FROM salaries LIMIT 5;
SELECT * FROM departments LIMIT 5;


SELECT AVG(salary) AS average_salary, STD(salary) AS standard_dev_salary

FROM employees.salaries;

CREATE TEMPORARY TABLE current_info AS (

SELECT dept_name, AVG(salary) AS department_current_average

    FROM employees.salaries
      
      JOIN employees.dept_emp USING(emp_no)
      
      JOIN employees.departments USING(dept_no)
    
        WHERE employees.dept_emp.to_date > curdate()
    
    AND employees.salaries.to_date > curdate()
    
GROUP BY dept_name
);

-- Create columns to hold the average salary, std, and the zscore
ALTER TABLE current_info ADD average FLOAT(10,2);
ALTER TABLE current_info ADD standard_deviation FLOAT(10,2);
ALTER TABLE current_info ADD zscore FLOAT(10,2);

UPDATE current_info SET average = 63810;
UPDATE current_info SET standard_deviation = 16904;


-- z_score  = (avg(x) - x) / std(x) */
UPDATE current_info 
SET zscore = (department_current_average - historic_avg) / historic_std;

SELECT * FROM current_info
ORDER BY zscore DESC;






-- [----------------Start__________________________]
/* # Current Average Salary
SELECT d.dept_name, AVG(s.salary) AS 'Average Current Department Salary'

FROM departments d 

JOIN dept_emp de USING(dept_no)

JOIN salaries s USING(emp_no) 

WHERE s.to_date = '9999-01-01'

GROUP BY dept_name; 


# Historical Average Salary
SELECT d.dept_name, AVG(s.salary) AS 'Average Historical Department Salary'

FROM departments d 

JOIN dept_emp de USING(dept_no)

JOIN salaries s USING(emp_no) 

WHERE s.to_date != '9999-01-01'

GROUP BY dept_name;  */
-- [------------------END---------------------------]



# SUMMARY:

-- ********Need more practice with subqueries and undestanding z-score concepts*******

















