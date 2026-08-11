DROP TABLE employee_departments; -- drop table if exists

CREATE TABLE employee_departments (
    emp_id   NUMBER PRIMARY KEY,
    emp_name VARCHAR2(100),
    dept_id  NUMBER,
    CONSTRAINT fk_dept_id FOREIGN KEY ( dept_id )
        REFERENCES departments ( dept_id )
);

INSERT INTO employee_departments (
    emp_id,
    emp_name,
    dept_id
) VALUES ( 1,
           'E1',
           10 );

INSERT INTO employee_departments (
    emp_id,
    emp_name,
    dept_id
) VALUES ( 2,
           'E2',
           20 );

INSERT INTO employee_departments (
    emp_id,
    emp_name,
    dept_id
) VALUES ( 3,
           'E3',
           10 );

INSERT INTO employee_departments (
    emp_id,
    emp_name,
    dept_id
) VALUES ( 4,
           'E4',
           30 );

INSERT INTO employee_departments (
    emp_id,
    emp_name,
    dept_id
) VALUES ( 5,
           'E5',
           NULL );

SELECT
    *
FROM
    employee_departments;

DROP TABLE departments; -- drop table if exists

CREATE TABLE departments (
    dept_id   NUMBER PRIMARY KEY,
    dept_name VARCHAR2(100)
);

INSERT INTO departments (
    dept_id,
    dept_name
) VALUES ( 10,
           'IT' );

INSERT INTO departments (
    dept_id,
    dept_name
) VALUES ( 20,
           'Marketing' );

INSERT INTO departments (
    dept_id,
    dept_name
) VALUES ( 30,
           'HR' );

INSERT INTO departments (
    dept_id,
    dept_name
) VALUES ( 40,
           'FINANCE' );

SELECT
    *
FROM
    departments;

SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM
    employee_departments e
    LEFT OUTER JOIN departments          d ON ( e.dept_id = d.dept_id );