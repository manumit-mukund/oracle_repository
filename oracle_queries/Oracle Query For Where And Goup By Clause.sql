DROP TABLE temp_employee;

CREATE TABLE temp_employee (
    id         NUMBER(5),
    empname    VARCHAR2(100),
    age        NUMBER(5),
    empaddress VARCHAR2(100)
);

INSERT INTO temp_employee VALUES (
    1,
    'XYZ',
    25,
    'new road '
);

INSERT INTO temp_employee VALUES (
    2,
    'ABC',
    28,
    'old road'
);

INSERT INTO temp_employee VALUES (
    3,
    'AAB',
    35,
    'sector 23'
);

INSERT INTO temp_employee VALUES (
    4,
    'CBC',
    25,
    'sector 24'
);

SELECT
    *
FROM
    temp_employee;

SELECT
    *
FROM
    temp_employee
WHERE
    id > 2;

SELECT
    *
FROM
    temp_employee
WHERE
    empname LIKE '%A%';

SELECT
    age,
    COUNT(*) AS no_of_employees
FROM
    temp_employee
GROUP BY
    age;

SELECT
    age,
    COUNT(*) AS no_of_employees
FROM
    temp_employee
WHERE
    empname LIKE '%B%'
GROUP BY
    age;

SELECT
    age,
    COUNT(*) AS no_of_employees
FROM
    temp_employee
GROUP BY
    age
HAVING
    COUNT(*) > 1;