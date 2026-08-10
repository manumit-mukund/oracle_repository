------------------------------------------Start Range partition--------------------------------------------------------
DROP TABLE sales_range_partition PURGE;

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

DROP TABLE sales_range_partition; -- drop table if exists

CREATE TABLE sales_range_partition (
    product_id    NUMBER(6),
    customer_id   NUMBER,
    channel_id    CHAR(1),
    promo_id      NUMBER(6),
    sale_date     DATE,
    quantity_sold INTEGER,
    amount_sold   NUMBER(10, 2)
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
                                           100,
                                           'A',
                                           150,
                                           '10-FEB-2025',
                                           500,
                                           2000 );

INSERT INTO sales_range_partition VALUES ( 2,
                                           110,
                                           'B',
                                           180,
                                           '15-JUN-2025',
                                           100,
                                           1000 );

INSERT INTO sales_range_partition VALUES ( 3,
                                           100,
                                           'A',
                                           150,
                                           '20-AUG-2025',
                                           500,
                                           2000 );

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

ALTER TABLE sales_range_partition ADD PARTITION sales_q1_2026
    VALUES LESS THAN ( TO_DATE('01-APR-2026', 'dd-MON-yyyy') );

INSERT INTO sales_range_partition VALUES ( 1,
                                           100,
                                           'A',
                                           150,
                                           '20-JAN-2026',
                                           500,
                                           2000 );

SELECT
    *
FROM
    sales_range_partition PARTITION ( sales_q1_2026 );

------------------------------------------End Range partition--------------------------------------------------------