-- con_manu_21c

DROP TABLE employee_for_index_btree PURGE; -- if exists

-- Create a simple table
CREATE TABLE employee_for_index_btree (
    emp_id        NUMBER PRIMARY KEY,
    name          VARCHAR2(20),
    department_id NUMBER
);

-- Insert data
INSERT INTO employee_for_index_btree VALUES ( 1,
                                              'E1',
                                              10 );

INSERT INTO employee_for_index_btree VALUES ( 3,
                                              'E3',
                                              30 );

INSERT INTO employee_for_index_btree VALUES ( 2,
                                              'E2',
                                              20 );

INSERT INTO employee_for_index_btree VALUES ( 4,
                                              'E4',
                                              40 );

COMMIT;

SELECT
    *
FROM
    employee_for_index_btree
WHERE
    department_id = 40;

-- EXPLAIN PLAN before index creation--
EXPLAIN PLAN
    FOR
SELECT
    *
FROM
    employee_for_index_btree
WHERE
    department_id = 40;

SELECT
    *
FROM
    TABLE ( dbms_xplan.display );    
-- EXPLAIN PLAN  before index creation --

---------------Create index---------------------------------
CREATE INDEX emp_index_btree ON
    employee_for_index_btree (
        department_id
    );    
 ---------------Create index---------------------------------

SELECT
    *
FROM
    employee_for_index_btree
WHERE
    department_id = 40;    
    
-- EXPLAIN PLAN  after index creation --
EXPLAIN PLAN
    FOR
SELECT
    *
FROM
    employee_for_index_btree
WHERE
    department_id = 40;

SELECT
    *
FROM
    TABLE ( dbms_xplan.display );    
-- EXPLAIN PLAN  after index creation --