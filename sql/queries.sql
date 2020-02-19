--Question 1
SELECT employees.emp_no, employees.last_name, employees.first_name, salaries.salary
FROM employees
    JOIN salaries ON employees.emp_no = salaries.emp_no

--Question 2
SELECT *
FROM employees
WHERE EXTRACT(YEAR FROM hire_date)=1986;

--Question 3
SELECT department.dept_no, department.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM department
    JOIN dept_manager ON department.dept_no=dept_manager.dept_no
    JOIN employees ON dept_manager.emp_no = employees.emp_no
-------ALL current managers are listed below
SELECT department.dept_no, department.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM department
    JOIN dept_manager ON department.dept_no=dept_manager.dept_no
    JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE EXTRACT(YEAR FROM dept_manager.to_date)=9999;

--Question 4
SELECT department.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM department
    JOIN dept_emp ON department.dept_no=dept_emp.dept_no
    JOIN employees ON employees.emp_no=dept_emp.emp_no

--Question 5
SELECT *
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%'

--Question 6
SELECT employees.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM department
    JOIN dept_emp ON department.dept_no= dept_emp.dept_no
    JOIN employees ON dept_emp.emp_no=employees.emp_no
WHERE department.dept_name='Sales'

--Question 7
SELECT employees.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM department
    JOIN dept_emp ON department.dept_no= dept_emp.dept_no
    JOIN employees ON dept_emp.emp_no=employees.emp_no
WHERE department.dept_name='Sales' OR department.dept_name='Development'

--Question 8
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY(last_name)
ORDER BY COUNT(last_name) DESC