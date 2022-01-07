#SQL EXERCISE ORDER BY

SHOW DATABASES;
USE `employees`;


#WHERE Exercises
USE `employees`;
SHOW TABLES;
SELECT * FROM `employees`;
SELECT count(emp_no) FROM employees;

/* 
#1. CREATE a FILE named where_exercises.sql. Make sure TO USE the employees database.
#Completed

#2. Find ALL current OR previous employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya' USING IN. Enter a COMMENT WITH the number of records returned.

SELECT  * FROM `employees` WHERE first_name IN ('Irene', 'Vidya', 'Maya'); 

SELECT COUNT(first_name) FROM `employees` WHERE first_name IN ('Irene', 'Vidya', 'Maya'); # count: 731


#3. Find ALL current OR previous employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya', AS IN Q2, but USE OR instead of IN. Enter a COMMENT WITH the number of records returned. Does it MATCH number of ROWS FROM Q2?
SELECT  * FROM `employees` WHERE first_name = ('Irene' OR	 'Vidya' OR	 'Maya'); 
SELECT COUNT(emp_no)  FROM `employees` WHERE first_name  = 'Irene' OR	 first_name =  'Vidya' OR first_name =	 'Maya'; # 731. It matches


#4. Find ALL current OR previous employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya', USING OR, AND who IS male. Enter a COMMENT WITH the number of records returned.
SELECT * FROM employees WHERE first_name = 'Irene' OR first_name = 'Vidya' OR first_name = 'Maya' AND gender = 'M';


#5. Find ALL current OR previous employees whose LAST NAME STARTS WITH 'E'. Enter a COMMENT WITH the number of employees whose LAST NAME STARTS WITH E.
SELECT COUNT(last_name) FROM employees WHERE last_name LIKE "E%" 
#Count: 7330


#6. Find ALL current OR previous employees whose LAST NAME STARTS OR ENDS WITH 'E'. Enter a COMMENT WITH the number of employees whose LAST NAME STARTS OR ENDS WITH E. How many employees have a LAST NAME that ENDS WITH E, but does NOT START WITH E?


SELECT last_name FROM employees WHERE last_name LIKE "E%E" ; 

SELECT COUNT(last_name) FROM employees WHERE last_name LIKE "E%E" ; # count: 899 starts and ends with E

SELECT COUNT(last_name) FROM employees WHERE last_name LIKE "%E" ;  #count: 2492 ends with E


#7. Find ALL current OR previous employees employees whose LAST NAME STARTS AND ENDS WITH 'E'. Enter a COMMENT WITH the number of employees whose LAST NAME STARTS AND ENDS WITH E. How many employees' LAST NAMES END WITH E, regardless of whether they START WITH E?
SELECT last_name FROM employees WHERE last_name LIKE "E%E" ; 
SELECT COUNT(last_name) FROM employees WHERE last_name LIKE "E%E" ;# count: 899 starts and ends with E
SELECT COUNT(last_name) FROM employees WHERE last_name LIKE "%E" ;  #count: 2492 ends with E


#8. Find ALL current OR previous employees hired IN the 90s. Enter a COMMENT WITH the number of employees returned.
SELECT first_name, last_name, hire_date FROM `employees` WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

SELECT COUNT(first_name) FROM `employees` WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'; # count: 135214



#9. Find ALL current OR previous employees born ON Christmas. Enter a COMMENT WITH the number of employees returned.
SELECT first_name, last_name, birth_date FROM `employees` WHERE birth_date LIKE  '%12-25%';
SELECT COUNT(first_name) FROM `employees` WHERE birth_date LIKE  '%25%'; #9994


#10. Find ALL current OR previous employees hired IN the 90s AND born ON Christmas. Enter a COMMENT WITH the number of employees returned.
SELECT first_name, last_name, birth_date, hire_date FROM `employees` WHERE birth_date LIKE  '%12-25%' AND `hire_date` BETWEEN 1990-01-01 AND  1999-12-31;




#11. Find ALL current OR previous employees WITH a 'q' IN their LAST name. Enter a COMMENT WITH the number of records returned.
SELECT last_name FROM employees WHERE last_name LIKE '%q%';
SELECT COUNT(last_name) FROM employees WHERE last_name LIKE '%q%'; #COUNT: 1873


#12. Find ALL current OR previous employees WITH a 'q' IN their LAST NAME but NOT 'qu'. How many employees are FOUND?
SELECT last_name FROM employees WHERE last_name LIKE '%q%' AND last_name IS NOT LIKE '%qu%'; */


/* #1.Create a NEW FILE named order_by_exercises.sql AND copy in the contents of your exercise from the previous lesson.
#Completed */


#2. Find ALL employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya', AND order your results returned BY FIRST name. IN your comments, answer: What was the FIRST AND LAST NAME IN the FIRST ROW of the results? What was the FIRST AND LAST NAME of the LAST person IN the TABLE?
SELECT first_name, last_name FROM employees   WHERE first_name = 'Irene' OR  first_name = 'Vidya' OR first_name = 'Maya'  ORDER BY first_name ASC;

#3. Find ALL employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya', AND order your results returned BY FIRST NAME AND THEN LAST name. IN your comments, answer: What was the FIRST AND LAST NAME IN the FIRST ROW of the results? What was the FIRST AND LAST NAME of the LAST person IN the TABLE?
SELECT first_name, last_name FROM employees   WHERE first_name = 'Irene' OR  first_name = 'Vidya' OR first_name = 'Maya'  ORDER BY first_name ASC;


#4. Find ALL employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya', AND order your results returned BY LAST NAME AND THEN FIRST name. IN your comments, answer: What was the FIRST AND LAST NAME IN the FIRST ROW of the results? What was the FIRST AND LAST NAME of the LAST person IN the TABLE?
SELECT first_name, last_name FROM employees   WHERE first_name = 'Irene' OR  first_name = 'Vidya' OR first_name = 'Maya'  ORDER BY last_name, first_name ASC;


#5. WRITE a QUERY TO TO find ALL employees whose LAST NAME STARTS AND ENDS WITH 'E'. Sort the results BY their employee number. Enter a COMMENT WITH the number of employees returned, the FIRST employee number AND their FIRST AND LAST NAME, AND the LAST employee number WITH their FIRST AND LAST name.
SELECT last_name, first_name FROM employees WHERE last_name LIKE "E%E" ORDER BY emp_no  DESC; 



#6. WRITE a QUERY TO TO find ALL employees whose LAST NAME STARTS AND ENDS WITH 'E'. Sort the results BY their hire DATE, so that the newest employees are listed first. Enter a COMMENT WITH the number of employees returned, the NAME of the newest employee, AND the NAME of the oldest employee.

SELECT * FROM employees WHERE last_name LIKE "E%E" ORDER BY hire_date  DESC; 




#7. Find ALL employees hired IN the 90s AND born ON Christmas. Sort the results so that the oldest employee who was hired LAST IS the FIRST result. Enter a COMMENT WITH the number of employees returned, the NAME of the oldest employee who was hired LAST, AND the NAME of the youngest employee who was hired first. 


#************************SELECT * FROM employees WHERE hire_date LIKE '199%' AND birth_date