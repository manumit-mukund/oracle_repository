CREATE TABLE employee_income (
    empid  NUMBER(10) PRIMARY KEY,
    name   VARCHAR2(20),
    salary NUMBER(10),
    deptid NUMBER(2, 0),
    CONSTRAINT fk_deptno FOREIGN KEY ( deptid )
        REFERENCES department ( deptid )
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid
) VALUES (
    1,
    'Bill',
    10000,
    10
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid
) VALUES (
    2,
    'Mike',
    20000,
    20
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid
) VALUES (
    3,
    'Samson',
    30000,
    30
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid
) VALUES (
    4,
    'Kevin',
    50000,
    40
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid
) VALUES (
    5,
    'Bill1',
    20000,
    10
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid
) VALUES (
    6,
    'Mike1',
    30000,
    20
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid
) VALUES (
    7,
    'Samson1',
    40000,
    30
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    deptid
) VALUES (
    8,
    'Kevin1',
    60000,
    40
);
