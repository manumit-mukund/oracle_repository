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
           'Bill',
           10000,
           10,
           sysdate );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 2,
           'Mike',
           20000,
           20,
           sysdate );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 3,
           'Samson',
           30000,
           30,
           sysdate );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 4,
           'Kevin',
           50000,
           40,
           sysdate );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 5,
           'Bill1',
           20000,
           10,
           sysdate );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 6,
           'Mike1',
           30000,
           20,
           sysdate );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 7,
           'Samson1',
           40000,
           30,
           sysdate - 1 );

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid,
    created_date
) VALUES ( 8,
           'Kevin1',
           60000,
           40,
           sysdate - 2 );

SELECT
    *
FROM
    employee_income;