SHOW DATABASES; # displays all databases in the server
USE `employees`; #selects the employees database
DESCRIBE employees; # describe employees database
SHOW TABLES; # Show all tables
DESCRIBE `employees`; # employees table int, date, varchar, enum, date
DESCRIBE `salaries`; # contains both numeric and date
SELECT employees.`first_name`, employees.`last_name` FROM employees; # contains string name
SELECT employees.`birth_date`, employees.`hire_date` FROM employees; # contains date types
DESCRIBE `departments`;
SELECT * FROM departments;
SELECT * FROM employees;

SHOW CREATE TABLE `dept_manager`; #Query to create the dept_table