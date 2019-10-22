-- Checking to see that the data imported into the tables correctly.
--Also useful to have for looking at each table.
select * from department_employees
select * from department_manager
select * from departments
select * from employees
select * from salaries
select * from titles

--Below, I am listing all of the questions that we wanted answered along with
--the code used to query the information.

--1. List the following details of each employee: employee number, 
--last name, first name, gender, and salary.

SELECT employees.emp_no,
  employees.last_name,
  employees.first_name,
  employees.gender,
  salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;


--2. List employees who were hired in 1986.

select emp_no, first_name, last_name, hire_date
from employees
where hire_date like '1986%'

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name, and start and end employment dates.

select d.dept_no, d.dept_name, 
e.emp_no, e.last_name, e.first_name
from employees as e
inner join department_manager as dm on
e.emp_no = dm.emp_no
inner join departments as d on
d.dept_no = dm.dept_no

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

select d.dept_no, d.dept_name, 
e.emp_no, e.last_name, e.first_name
from employees as e
inner join department_manager as dm on
e.emp_no = dm.emp_no
inner join departments as d on
d.dept_no = dm.dept_no

--5. List all employees whose first name is "Hercules" and last names begin with "B."

select emp_no, first_name, last_name, hire_date
from employees
where first_name='Hercules' and last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join department_employees as de on
de.emp_no = e.emp_no
inner join departments as d on
d.dept_no = de.dept_no
where d.dept_name ='Sales'

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join department_employees as de on
de.emp_no = e.emp_no
inner join departments as d on
d.dept_no = de.dept_no
where d.dept_name ='Sales' or d.dept_name='Development'

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc

--Locates one final query
select emp_no, first_name, last_name
from employees
where emp_no = 499942