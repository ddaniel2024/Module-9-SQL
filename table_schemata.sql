DROP TABLE dept_manager;
DROP TABLE dept_emp;
DROP TABLE departments;
DROP TABLE employees;
DROP TABLE titles;
DROP TABLE salaries;

CREATE TABLE salaries(
emp_no INT NOT NULL,
salary INT,
PRIMARY KEY (emp_no)
);

CREATE TABLE titles(
title_id VARCHAR(5) NOT NULL,
title VARCHAR(20) NOT NULL,
PRIMARY KEY (title_id)
);

CREATE TABLE employees(
emp_no INT NOT NULL,
emp_title_id VARCHAR(5) NOT NULL,
birth_date VARCHAR(10),
first_name VARCHAR(20),
last_name VARCHAR(20),
sex VARCHAR(1),
hire_date VARCHAR(10),
PRIMARY KEY (emp_no),
FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE departments(
dept_no VARCHAR(4) NOT NULL,
dept_name VARCHAR(20) NOT NULL,
PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp(
emp_no INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
dept_no VARCHAR(4) NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager(
dept_no VARCHAR(4) NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
emp_no INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
PRIMARY KEY (dept_no, emp_no)
);