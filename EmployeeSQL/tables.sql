-- tables.sql file used to create tables for sql-challenge
-- Jonathah Surgeon 5/18/2021

CREATE TABLE dept_manager (
	dept_no varchar(100) NOT NULL,
	emp_no int NOT NULL
);

CREATE TABLE departments (
	dept_no varchar(100) NOT NULL,
	dept_name varchar(100) NOT NULL
);

CREATE TABLE dept_emp (
	emp_no int NOT NULL,
	dept_no varchar(100) NOT NULL
);

CREATE TABLE employees (
	emp_no int PRIMARY KEY,
	emp_title_id varchar(100),
	birth_date date,
	first_name varchar(100),
	last_name varchar(100),
	sex char,
	hire_date date
);

CREATE TABLE titles (
	title_id varchar(100),
	title varchar(50)
);

CREATE TABLE salaries (
	emp_no int NOT NULL,
	salary int NOT NULL
);
