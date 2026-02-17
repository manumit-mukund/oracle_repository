DROP TABLE sales;

CREATE TABLE sales (
    sale_id     NUMBER,
    customer_id NUMBER,
    sale_date   DATE,
    amount      NUMBER
)
    PARTITION BY RANGE ( sale_date )
        SUBPARTITION BY HASH ( customer_id ) SUBPARTITIONS 2
    ( PARTITION sales_q1_2025
        VALUES LESS THAN ( DATE '2025-04-01' ), PARTITION sales_q2_2025
        VALUES LESS THAN ( DATE '2025-07-01' ), PARTITION sales_q3_2025
        VALUES LESS THAN ( DATE '2025-10-01' ), PARTITION sales_q4_2025
        VALUES LESS THAN ( DATE '2026-01-01' )
    );

INSERT INTO sales VALUES ( 1,
                           101,
                           DATE '2025-01-15',
                           500 );

INSERT INTO sales VALUES ( 2,
                           102,
                           DATE '2025-02-10',
                           600 );

INSERT INTO sales VALUES ( 3,
                           103,
                           DATE '2025-05-05',
                           700 );

INSERT INTO sales VALUES ( 4,
                           104,
                           DATE '2025-08-20',
                           800 );

INSERT INTO sales VALUES ( 5,
                           105,
                           DATE '2025-11-11',
                           900 );

INSERT INTO sales VALUES ( 6,
                           101,
                           DATE '2025-03-01',
                           1000 );

COMMIT;

SELECT
    table_name,
    partition_name,
    subpartition_name
FROM
    user_tab_subpartitions
WHERE
    table_name = 'SALES';

SELECT
    *
FROM
    sales PARTITION ( sales_q1_2025 );

SELECT
    *
FROM
    sales PARTITION ( sales_q2_2025 );