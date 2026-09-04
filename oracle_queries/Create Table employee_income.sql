DROP TABLE employee_income;

CREATE TABLE employee_income (
    empid        NUMBER(10) PRIMARY KEY,
    name         VARCHAR2(20),
    salary       NUMBER(10),
    deptid       NUMBER(2, 0),
    created_date DATE,
    CONSTRAINT fk_deptno FOREIGN KEY ( deptid )
        REFERENCES department ( deptid )
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 1,
           'E1',
           10000,
           1,
           sysdate );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 2,
           'E2',
           20000,
           2,
           sysdate );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 3,
           'E3',
           30000,
           3,
           sysdate );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 4,
           'E4',
           50000,
           4,
           sysdate );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 5,
           'E5',
           20000,
           1,
           sysdate );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 6,
           'E6',
           30000,
           2,
           sysdate );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 7,
           'E7',
           40000,
           3,
           sysdate - 1 );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 8,
           'E8',
           60000,
           5,
           sysdate - 2 );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 9,
           'E9',
           60000,
           5,
           sysdate - 2 );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 10,
           'E10',
           59000,
           5,
           sysdate - 2 );

COMMIT;

SELECT
    *
FROM
    employee_income;