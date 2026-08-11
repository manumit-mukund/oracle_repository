DROP TABLE employees; -- srop table if exists

CREATE TABLE employees (
    employee_id   NUMBER(10) PRIMARY KEY NOT NULL,
    employee_name VARCHAR2(50) NOT NULL,
    manager_id    NUMBER(10)
);

INSERT INTO employees VALUES ( 1,
                               'E1',
                               4 );

INSERT INTO employees VALUES ( 2,
                               'E2',
                               4 );

INSERT INTO employees VALUES ( 3,
                               'E3',
                               5 );

INSERT INTO employees VALUES ( 4,
                               'M1',
                               6 );

INSERT INTO employees VALUES ( 5,
                               'M2',
                               7 );

INSERT INTO employees VALUES ( 6,
                               'SM1',
                               NULL );

INSERT INTO employees VALUES ( 7,
                               'SM2',
                               NULL );

COMMIT;

SELECT
    *
FROM
    employees;

SELECT
    e.employee_name AS manager_name,
    m.employee_name AS employee_name
FROM
         employees e
    JOIN employees m ON e.employee_id = m.manager_id
ORDER BY
    employee_name;

SELECT
    e.employee_name AS employee_name,
    m.employee_name AS manager_name
FROM
         employees e
    JOIN employees m ON e.manager_id = m.employee_id
ORDER BY
    employee_name;