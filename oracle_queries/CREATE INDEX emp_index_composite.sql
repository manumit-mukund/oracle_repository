-- con_manu_21c

DROP INDEX emp_index_composite; --if exists

DROP TABLE employee_for_index_composite PURGE; --if exists

CREATE TABLE employee_for_index_composite (
    employee_id   NUMBER PRIMARY KEY,
    first_name    VARCHAR2(20),
    last_name     VARCHAR2(20),
    department_id NUMBER
);

INSERT INTO employee_for_index_composite VALUES ( 1,
                                                  'F1',
                                                  'L1',
                                                  10 );

INSERT INTO employee_for_index_composite VALUES ( 2,
                                                  'F2',
                                                  'L2',
                                                  20 );

INSERT INTO employee_for_index_composite VALUES ( 3,
                                                  'F3',
                                                  'L3',
                                                  20 );

INSERT INTO employee_for_index_composite VALUES ( 4,
                                                  'F4',
                                                  'L4',
                                                  30 );

INSERT INTO employee_for_index_composite VALUES ( 5,
                                                  'F5',
                                                  'L5',
                                                  40 );

COMMIT;

SELECT
    *
FROM
    employee_for_index_composite
WHERE
        department_id = 20
    AND last_name = 'L2';

SELECT
    *
FROM
    employee_for_index_composite
WHERE
    department_id = 20;

SELECT
    *
FROM
    employee_for_index_composite
WHERE
    last_name = 'L2';

-- EXPLAIN PLAN before index creation--
EXPLAIN PLAN
    FOR
SELECT
    *
FROM
    employee_for_index_composite
WHERE
        department_id = 20
    AND last_name = 'L2';

SELECT
    *
FROM
    TABLE ( dbms_xplan.display );    
-- EXPLAIN PLAN  before index creation --

CREATE INDEX emp_index_composite ON
    employee_for_index_composite (
        department_id,
        last_name
    );

    
-- EXPLAIN PLAN  after index creation --
EXPLAIN PLAN
    FOR
SELECT
    *
FROM
    employee_for_index_composite
WHERE
        department_id = 20
    AND last_name = 'L2';

SELECT
    *
FROM
    TABLE ( dbms_xplan.display );    
-- EXPLAIN PLAN  after index creation --