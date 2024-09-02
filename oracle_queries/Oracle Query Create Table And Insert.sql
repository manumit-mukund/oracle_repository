CREATE TABLE employee_income (
    empid      NUMBER(10),
    name       VARCHAR2(20),
    salary     NUMBER(10),
    department VARCHAR2(20)
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    department
) VALUES (
    1,
    'Bill',
    10000,
    'HR'
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    department
) VALUES (
    2,
    'Mike',
    20000,
    'MARKETING'
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    department
) VALUES (
    3,
    'Samson',
    30000,
    'FINANCE'
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    department
) VALUES (
    4,
    'Kevin',
    50000,
    'IT'
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    department
) VALUES (
    5,
    'Bill1',
    20000,
    'HR'
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    department
) VALUES (
    6,
    'Mike1',
    30000,
    'MARKETING'
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    department
) VALUES (
    7,
    'Samson1',
    40000,
    'FINANCE'
);

INSERT INTO employee_income (
    empid,
    name,
    salary,
    department
) VALUES (
    8,
    'Kevin1',
    60000,
    'IT'
);

SELECT
    *
FROM
    employee_income;

SELECT
    *
FROM
    employee_income
WHERE
    ( department, salary ) IN (
        SELECT
            department, MAX(salary)
        FROM
            employee_income
        GROUP BY
            department
    );