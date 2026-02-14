CREATE TABLE employee_department (
    emp_id   NUMBER PRIMARY KEY,
    emp_name VARCHAR2(100),
    dept_id  NUMBER
);

INSERT INTO employee_department (
    emp_id,
    emp_name,
    dept_id
) VALUES ( 1,
           'Alice',
           10 );

INSERT INTO employee_department (
    emp_id,
    emp_name,
    dept_id
) VALUES ( 2,
           'Bob',
           20 );

INSERT INTO employee_department (
    emp_id,
    emp_name,
    dept_id
) VALUES ( 3,
           'Charlie',
           10 );

INSERT INTO employee_department (
    emp_id,
    emp_name,
    dept_id
) VALUES ( 4,
           'David',
           30 );

INSERT INTO employee_department (
    emp_id,
    emp_name,
    dept_id
) VALUES ( 5,
           'Eve',
           NULL ); -- Eve is not assigned to a department

SELECT
    *
FROM
    employee_department;

CREATE TABLE departments (
    dept_id   NUMBER PRIMARY KEY,
    dept_name VARCHAR2(100)
);

INSERT INTO departments (
    dept_id,
    dept_name
) VALUES ( 10,
           'Sales' );

INSERT INTO departments (
    dept_id,
    dept_name
) VALUES ( 20,
           'Marketing' );

INSERT INTO departments (
    dept_id,
    dept_name
) VALUES ( 30,
           'IT' );

INSERT INTO departments (
    dept_id,
    dept_name
) VALUES ( 40,
           'HR' ); -- HR department has no employees yet

SELECT
    *
FROM
    departments;

SELECT
    e.emp_name,
    d.dept_name
FROM
         employee_department e
    INNER JOIN departments d ON e.dept_id = d.dept_id;