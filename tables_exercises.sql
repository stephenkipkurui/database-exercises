# SQL EXERCISES: TABLES

SHOW DATABASES; # displays all databases in the server

-- 1). OPEN Sequel Ace AND login TO the DATABASE SERVER
# Completed

-- 2). Save your WORK IN a FILE named tables_exercises.sql
# Completed

-- 3). USE the employees DATABASE
USE `employees`;

-- 4). LIST ALL the TABLES IN the DATABASE
SHOW TABLES; # Show all tables

-- 5). Explore the employees table. What different DATA types are present ON this TABLE?
DESCRIBE employees;
-- Columns DATA types: emp_no (int), birth_date (date), first_name (varchar(14)), last_name(varchar(16)), gender(enum('M','F')), hire_date(date)


-- 6). Which TABLE(s) DO you think contain a NUMERIC TYPE COLUMN?
DESCRIBE salaries;# salaries contains mostly numeric data types. Other tables have atleast a column with numeric data types:  
DESCRIBE dept_emp; # emp_no int(PRI)
DESCRIBE dept_manager; # emp_no int(PRO)
DESCRIBE titles; # emp_no int(PRi)
DESCRIBE departments; #no numeric data type


-- 7). Which TABLE(s) DO you think contain a STRING TYPE COLUMN?
# departments table contains char and varchar data type as its columns which are string type. titles has title as varchar- a string type data. dept_manager has dept_no as char- a string type.


-- 8). Which TABLE(s) DO you think contain a DATE TYPE COLUMN?
# dept_emp has DATE type colum- from_date and to_date
# salaries has from_date, and to_date columns that are DATE data types

-- 9). What IS the relationship BETWEEN the employees AND the departments TABLES?
# There is no direct relationship but as departments has only dept_no and dept_name data while employees has emp_no, birth_date, first_name, last_name, gender, and hire_date. Table dept_emp connect the two tables relationship.

-- 10). SHOW the SQL that created the dept_manager table.
SHOW CREATE TABLE `dept_manager`;

