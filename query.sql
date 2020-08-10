-- finds the employee number, last name, first name, sex, and salary for each employe
select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary from public."Employees" as emp
inner join public."Salary" as sal
on emp.emp_no = sal.emp_no;

-- finds the first name, last name, and hire date for employees who were hired in 1986
select first_name, last_name, hire_date from public."Employees"
where hire_date < '1986-12-31'
and hire_date > '1986-01-1';
-- finds the department number, department name, the manager's employee number, last name, first name of all department managers 

select dept.dept_no, dept.dept_name, mang.emp_no, emp.first_name, emp.last_name from public."Dept_Manager" as mang
inner join public."Departments" as dept 
on dept.dept_no = mang.dept_no
inner join public."Employees" as emp
on emp.emp_no = mang.emp_no; 

-- finds the department of each employee with the following information: employee number, last name, first name, and department name
select  de.emp_no, emp.first_name, emp.last_name, dept.dept_name from public."Dept_Emp" as de
inner join public."Departments" as dept 
on dept.dept_no = de.dept_no
inner join public."Employees" as emp
on emp.emp_no = de.emp_no; 

--  finds the first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex from public."Employees"
where first_name = 'Hercules'
and last_name like 'B%';

-- finds all employees in the Sales department, including their employee number, last name, first name, and department name
select  de.emp_no, emp.first_name, emp.last_name, dept.dept_name from public."Dept_Emp" as de
inner join public."Departments" as dept 
on dept.dept_no = de.dept_no
inner join public."Employees" as emp
on emp.emp_no = de.emp_no
where dept.dept_name = 'Sales'; 

-- finds all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
select  de.emp_no, emp.first_name, emp.last_name, dept.dept_name from public."Dept_Emp" as de
inner join public."Departments" as dept 
on dept.dept_no = de.dept_no
inner join public."Employees" as emp
on emp.emp_no = de.emp_no
where dept.dept_name = 'Sales'
or dept.dept_name = 'Development'; 

-- finds in descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) from public."Employees"
group by last_name
order by count(last_name) desc; 