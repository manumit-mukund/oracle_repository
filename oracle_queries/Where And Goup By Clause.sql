DROP TABLE temp_employee; -- if already exists

CREATE TABLE temp_employee (
    eid        NUMBER(5),
    empname    VARCHAR2(100),
    age        NUMBER(5),
    empaddress VARCHAR2(100),
    CONSTRAINT pk_eid PRIMARY KEY ( eid )
);

INSERT INTO temp_employee VALUES ( 1,
                                   'A1',
                                   25,
                                   'New Delhi' );

INSERT INTO temp_employee VALUES ( 2,
                                   'E2',
                                   30,
                                   'New Delhi' );

INSERT INTO temp_employee VALUES ( 3,
                                   'E3',
                                   30,
                                   'Patna' );

INSERT INTO temp_employee VALUES ( 4,
                                   'B4',
                                   50,
                                   'Patna' );

INSERT INTO temp_employee VALUES ( 5,
                                   'B5',
                                   50,
                                   'Patna' );

INSERT INTO temp_employee VALUES ( 6,
                                   'B6',
                                   60,
                                   'Patna' );

SELECT
    *
FROM
    temp_employee;

SELECT
    *
FROM
    temp_employee
WHERE
    eid > 2;

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