drop table departments;
drop table dept_emp;
drop table dept_manager;
drop table employees;
drop table salaries;
drop table titles;

create table departments(
dept_no varchar(10) primary key,
dept_name varchar(20)
);

create table dept_emp(
emp_no int,
dept_no varchar(10)
);

create table dept_manager(
dept_no varchar(10),
emp_no int
);

create table employees(
emp_no int primary key,
emp_title varchar(20),
birth_date varchar(10),
first_name varchar(20),
last_name varchar(20),
sex varchar(1),
hire_date varchar(10)
);

create table salaries(
emp_no int primary key,
salary int
);

create table titles(
title_id varchar(10),
title varchar(20)
);

select e.emp_no, e.first_name, e.last_name, e.sex, s.salary
from employees as e
join salaries as s
on (e.emp_no = s.emp_no);

select first_name, last_name, hire_date 
from employees
where  hire_date like '%1986';

select dm.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
from dept_manager as dm
join employees as e
on dm.emp_no = e.emp_no
join departments as d
on dm.dept_no = d.dept_no;

select e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no;

select first_name, last_name, sex
from employees
where first_name = 'Hercules'
	and last_name like 'B%';
	
select e.emp_no, e.first_name, e.last_name, de.dept_no, d.dept_name
from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no
	where d.dept_name = 'Sales';

select e.emp_no, e.first_name, e.last_name, de.dept_no, d.dept_name
from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no
	where d.dept_name = 'Sales'
		or d.dept_name = 'Development';
		
select last_name, count(last_name) as count
from employees
group by last_name
order by count desc;
