------------------------------------------Start Range partition--------------------------------------------------------
DROP TABLE sales_range_partition PURGE;

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
    ( PARTITION sales_q1_2014
        VALUES LESS THAN ( TO_DATE('01-APR-2014', 'dd-MON-yyyy') ),
    PARTITION sales_q2_2014
        VALUES LESS THAN ( TO_DATE('01-JUL-2014', 'dd-MON-yyyy') ),
    PARTITION sales_q3_2014
        VALUES LESS THAN ( TO_DATE('01-OCT-2014', 'dd-MON-yyyy') ),
    PARTITION sales_q4_2014
        VALUES LESS THAN ( TO_DATE('01-JAN-2015', 'dd-MON-yyyy') )
    );

SELECT
    table_name,
    partition_name,
    partition_position,
    high_value
FROM
    user_tab_partitions
WHERE
    table_name = 'SALES_RANGE_PARTITION';

INSERT INTO sales_range_partition VALUES ( 1001,
                                           100,
                                           'A',
                                           150,
                                           '10-FEB-2014',
                                           500,
                                           2000 );

INSERT INTO sales_range_partition VALUES ( 1002,
                                           110,
                                           'B',
                                           180,
                                           '15-JUN-2014',
                                           100,
                                           1000 );

INSERT INTO sales_range_partition VALUES ( 1001,
                                           100,
                                           'A',
                                           150,
                                           '20-AUG-2014',
                                           500,
                                           2000 );

SELECT
    *
FROM
    sales_range_partition;

SELECT
    *
FROM
    sales_range_partition PARTITION ( sales_q1_2014 );

SELECT
    *
FROM
    sales_range_partition PARTITION ( sales_q2_2014 );

SELECT
    *
FROM
    sales_range_partition PARTITION ( sales_q3_2014 );

ALTER TABLE sales_range_partition ADD PARTITION sales_q1_2015
    VALUES LESS THAN ( TO_DATE('01-APR-2015', 'dd-MON-yyyy') );

INSERT INTO sales_range_partition VALUES ( 1001,
                                           100,
                                           'A',
                                           150,
                                           '20-JAN-2015',
                                           500,
                                           2000 );

SELECT
    *
FROM
    sales_range_partition PARTITION ( sales_q1_2015 );

------------------------------------------End Range partition--------------------------------------------------------