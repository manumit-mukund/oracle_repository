-- con_manu_21c

DROP TABLE customer_for_index_bitmap PURGE; -- if exists

CREATE TABLE customer_for_index_bitmap (
    id     NUMBER PRIMARY KEY,
    name   VARCHAR2(20),
    gender VARCHAR2(1)
);

INSERT INTO customer_for_index_bitmap VALUES ( 1,
                                               'C1',
                                               'F' );

INSERT INTO customer_for_index_bitmap VALUES ( 2,
                                               'C2',
                                               'M' );

INSERT INTO customer_for_index_bitmap VALUES ( 3,
                                               'C3',
                                               'M' );

INSERT INTO customer_for_index_bitmap VALUES ( 4,
                                               'C4',
                                               'F' );

INSERT INTO customer_for_index_bitmap VALUES ( 5,
                                               'C5',
                                               'F' );

COMMIT;

SELECT
    *
FROM
    customer_for_index_bitmap
WHERE
    gender = 'M';

-- EXPLAIN PLAN before index creation--
EXPLAIN PLAN
    FOR
SELECT
    *
FROM
    customer_for_index_bitmap
WHERE
    gender = 'M';

SELECT
    *
FROM
    TABLE ( dbms_xplan.display );    
-- EXPLAIN PLAN  before index creation --

CREATE BITMAP INDEX cust_index_bitmap ON
    customer_for_index_bitmap (
        gender
    );
    
    -- EXPLAIN PLAN  after index creation --
EXPLAIN PLAN
    FOR
SELECT
    *
FROM
    customer_for_index_bitmap
WHERE
    gender = 'M';

SELECT
    *
FROM
    TABLE ( dbms_xplan.display );    
-- EXPLAIN PLAN  after index creation -