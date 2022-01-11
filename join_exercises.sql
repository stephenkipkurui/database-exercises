-- 1). Use the employees database.
SHOW DATABASES;
USE employees; 
SHOW TABLES;

select * from dept_manager limit 5;
select * from departmernts limit 5;
select * from employees limit 5;

-- 2). Using the example in the Associative Table Joins section as a guide, write a query that shows each department along 
-- with the name of the current manager for that department.
SELECT departments.dept_name as department_name, dept_manager.emp_no as department_employee_number, 
employees.first_name as employee_first_name, employees.last_name as employee_last_name
FROM departments 
JOIN dept_manager.emp_no ON employees.emp_no
JOIN dept_manager.dept_no ON departments.dept_no;


-- 3). Find the name of all departments currently managed by women.

