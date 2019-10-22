--Creates all of the tables (Code imported from QuickDBD.com)

CREATE TABLE Departments (
    dept_no VARCHAR(5)   NOT NULL,
    dept_name VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Department_Employees (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(5)   NOT NULL,
    from_date VARCHAR(30)   NOT NULL,
    to_date VARCHAR(30)   NOT NULL
);

CREATE TABLE Department_Manager (
    dept_no VARCHAR(5)   NOT NULL,
    emp_no INT   NOT NULL,
    from_date VARCHAR(30)   NOT NULL,
    to_date VARCHAR(30)   NOT NULL
);

CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    birth_date VARCHAR(30)   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    gender VARCHAR(1)   NOT NULL,
    hire_date VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    from_date VARCHAR(30)   NOT NULL,
    to_date VARCHAR(30)   NOT NULL
);

CREATE TABLE Titles (
    emp_no INT   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    from_date VARCHAR(30)   NOT NULL,
    to_date VARCHAR(30)   NOT NULL
);

--Creates all of the relationships between all of the tables.

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

