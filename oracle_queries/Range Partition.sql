------------------------------------------Start Range partition--------------------------------------------------------
DROP TABLE sales_range_partition PURGE; -- drop table if exists

DROP TABLESPACE range_ptn_1 INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE range_ptn_2 INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE range_ptn_3 INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE range_ptn_4 INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE range_ptn_5 INCLUDING CONTENTS CASCADE CONSTRAINTS;

CREATE TABLESPACE range_ptn_1
    DATAFILE 'E:\Oracle Tablespace Files\range_ptn_1.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLESPACE range_ptn_2
    DATAFILE 'E:\Oracle Tablespace Files\range_ptn_2.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLESPACE range_ptn_3
    DATAFILE 'E:\Oracle Tablespace Files\range_ptn_3.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLESPACE range_ptn_4
    DATAFILE 'E:\Oracle Tablespace Files\range_ptn_4.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLESPACE range_ptn_5
    DATAFILE 'E:\Oracle Tablespace Files\range_ptn_5.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLE sales_range_partition (
    product_id    NUMBER(6) NOT NULL,
    customer_id   NUMBER NOT NULL,
    channel_id    CHAR(2),
    promo_id      NUMBER(6),
    sale_date     DATE NOT NULL,
    quantity_sold INTEGER NOT NULL,
    amount_sold   NUMBER(10, 2) NOT NULL
)
    PARTITION BY RANGE (
        sale_date
    )
    ( PARTITION sales_q1_2025
        VALUES LESS THAN ( TO_DATE('01-APR-2025', 'dd-MON-yyyy') )
    TABLESPACE range_ptn_1,
    PARTITION sales_q2_2025
        VALUES LESS THAN ( TO_DATE('01-JUL-2025', 'dd-MON-yyyy') )
    TABLESPACE range_ptn_2,
    PARTITION sales_q3_2025
        VALUES LESS THAN ( TO_DATE('01-OCT-2025', 'dd-MON-yyyy') )
    TABLESPACE range_ptn_3,
    PARTITION sales_q4_2025
        VALUES LESS THAN ( TO_DATE('01-JAN-2026', 'dd-MON-yyyy') )
    TABLESPACE range_ptn_4 );

SELECT
    table_name,
    partition_name,
    partition_position,
    high_value
FROM
    user_tab_partitions
WHERE
    table_name = 'SALES_RANGE_PARTITION';

INSERT INTO sales_range_partition VALUES ( 1,
                                           10,
                                           'C1',
                                           100,
                                           '10-FEB-2025',
                                           100,
                                           1000 );

INSERT INTO sales_range_partition VALUES ( 2,
                                           20,
                                           'C2',
                                           110,
                                           '06-JUN-2025',
                                           200,
                                           2000 );

INSERT INTO sales_range_partition VALUES ( 3,
                                           30,
                                           'C3',
                                           120,
                                           '15-AUG-2025',
                                           300,
                                           3000 );

INSERT INTO sales_range_partition VALUES ( 4,
                                           40,
                                           'C4',
                                           130,
                                           '02-OCT-2025',
                                           300,
                                           3000 );

SELECT
    *
FROM
    sales_range_partition;

SELECT
    *
FROM
    sales_range_partition PARTITION ( sales_q1_2025 );

SELECT
    *
FROM
    sales_range_partition PARTITION ( sales_q2_2025 );

SELECT
    *
FROM
    sales_range_partition PARTITION ( sales_q3_2025 );

SELECT
    *
FROM
    sales_range_partition PARTITION ( sales_q4_2025 );

ALTER TABLE sales_range_partition ADD PARTITION sales_q1_2026
    VALUES LESS THAN ( TO_DATE('01-APR-2026', 'dd-MON-yyyy') )
TABLESPACE range_ptn_5;

INSERT INTO sales_range_partition VALUES ( 1,
                                           100,
                                           'C5',
                                           140,
                                           '19-JAN-2026',
                                           500,
                                           5000 );

SELECT
    *
FROM
    sales_range_partition PARTITION ( sales_q1_2026 );

------------------------------------------End Range partition--------------------------------------------------------