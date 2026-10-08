-- con_manu_21c

DROP INDEX emp_index_function_based; --if exists

DROP TABLE employee_for_index_function_based PURGE; --if exists

CREATE TABLE employee_for_index_function_based (
    id    NUMBER PRIMARY KEY,
    name  VARCHAR2(20),
    email VARCHAR2(50)
);

INSERT INTO employee_for_index_function_based VALUES ( 1,
                                                       'E1',
                                                       'E1@abc.com' );

INSERT INTO employee_for_index_function_based VALUES ( 2,
                                                       'E2',
                                                       'E2@abc.com' );

INSERT INTO employee_for_index_function_based VALUES ( 3,
                                                       'E3',
                                                       'E3@abc.com' );

INSERT INTO employee_for_index_function_based VALUES ( 4,
                                                       'E4',
                                                       'E4@abc.com' );

COMMIT;

SELECT
    *
FROM
    employee_for_index_function_based
WHERE
    lower(email) = 'e3@abc.com';
    
    -- EXPLAIN PLAN before index creation--
EXPLAIN PLAN
    FOR
SELECT
    *
FROM
    employee_for_index_function_based
WHERE
    lower(email) = 'e3@abc.com';

SELECT
    *
FROM
    TABLE ( dbms_xplan.display );    
-- EXPLAIN PLAN  before index creation --

---------------Create index---------------------------------

CREATE INDEX emp_index_function_based ON
    employee_for_index_function_based ( lower(email) );
    
    -- EXPLAIN PLAN  after index creation --
EXPLAIN PLAN
    FOR
SELECT
    *
FROM
    employee_for_index_function_based
WHERE
    lower(email) = 'e3@abc.com';

SELECT
    *
FROM
    TABLE ( dbms_xplan.display );   
-- EXPLAIN PLAN  after index creation --