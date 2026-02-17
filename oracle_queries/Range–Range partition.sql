DROP TABLE orders;

CREATE TABLE orders (
    order_id    NUMBER,
    customer_id NUMBER,
    order_date  DATE,
    amount      NUMBER
)
    PARTITION BY RANGE ( order_date ) SUBPARTITION BY RANGE ( amount ) ( PARTITION orders_2024
        VALUES LESS THAN ( DATE '2025-01-01' )
    ( SUBPARTITION orders_2024_low
        VALUES LESS THAN ( 1000 ), SUBPARTITION orders_2024_high
        VALUES LESS THAN (
            MAXVALUE
        )
    ), PARTITION orders_2025
        VALUES LESS THAN ( DATE '2026-01-01' )
    ( SUBPARTITION orders_2025_low
        VALUES LESS THAN ( 1000 ), SUBPARTITION orders_2025_high
        VALUES LESS THAN (
            MAXVALUE
        )
    ) );

INSERT INTO orders VALUES ( 1,
                            101,
                            DATE '2024-03-15',
                            500 );

INSERT INTO orders VALUES ( 2,
                            102,
                            DATE '2024-08-20',
                            1500 );

INSERT INTO orders VALUES ( 3,
                            103,
                            DATE '2025-02-10',
                            700 );

INSERT INTO orders VALUES ( 4,
                            104,
                            DATE '2025-11-05',
                            2000 );

COMMIT;

SELECT
    table_name,
    partition_name,
    high_value
FROM
    user_tab_partitions
WHERE
    table_name = 'ORDERS';

SELECT
    table_name,
    partition_name,
    subpartition_name,
    high_value
FROM
    user_tab_subpartitions
WHERE
    table_name = 'ORDERS';

SELECT
    *
FROM
    orders
WHERE
    order_date BETWEEN DATE '2024-01-01' AND DATE '2024-12-31'
    AND amount < 1000;

SELECT
    *
FROM
    orders PARTITION ( orders_2024 );

SELECT
    *
FROM
    orders SUBPARTITION ( orders_2024_low );