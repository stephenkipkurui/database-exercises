# SQL TEMPORARY TABLE EXERCISES 01/13/22
USE innis_1672;
SHOW TABLES;

-- Create a file named temporary_tables.sql to do your work for this exercise.
# Completed


/* 1). USING the example FROM the lesson, CREATE a TEMPORARY TABLE called employees_with_departments that CONTAINS first_name, last_name, AND dept_name FOR employees currently WITH that department. Be absolutely sure TO CREATE this TABLE ON your own database. IF you see "Access denied for user ...", it means that the QUERY was attempting TO WRITE a NEW TABLE TO a DATABASE that you can only read. */

CREATE TEMPORARY TABLE employees_with_departments(col1 INT UNSIGNED NOT NULL, first_name VARCHAR(50) NOT NULL, last_name VARCHAR(50) NOT NULL , dept_name VARCHAR(50) NOT NULL );


-- a).  ADD a COLUMN named full_name TO this table. It should be a VARCHAR whose length IS the sum of the lengths of the FIRST NAME AND LAST NAME COLUMNS
ALTER TABLE employees_with_departments ADD full_name VARCHAR(100);

-- b).  UPDATE the TABLE so that FULL NAME COLUMN CONTAINS the correct DATA



-- c).  Remove the first_name AND last_name COLUMNS FROM the table.
-- d).  What IS another way you could have ended up WITH this same TABLE?


/* 
 2). CREATE a TEMPORARY TABLE based ON the payment TABLE FROM the sakila database. 

 WRITE the SQL necessary TO transform the amount COLUMN such that it IS stored AS an INTEGER representing the number of cents of the payment. FOR example, 1.99 should become 199.*/



/* 3).  Find OUT how the current average pay IN EACH department compares TO the overall, historical average pay. IN order TO make the comparison easier, you should USE the Z-score FOR salaries. IN terms of salary, what IS the best department RIGHT now TO WORK FOR? The worst? */