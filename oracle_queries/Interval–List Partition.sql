DROP TABLE orders;

CREATE TABLE orders (
    order_id   NUMBER,
    order_date DATE,
    region     VARCHAR2(20),
    amount     NUMBER
)
    PARTITION BY RANGE ( order_date ) INTERVAL ( numtoyminterval(1, 'MONTH') ) SUBPARTITION BY LIST ( region )
        SUBPARTITION TEMPLATE (
            SUBPARTITION sp_north VALUES ( 'NORTH' ),
                    SUBPARTITION sp_south VALUES ( 'SOUTH' ),
                SUBPARTITION sp_other VALUES ( DEFAULT )
        )
    ( PARTITION p_before_2025
        VALUES LESS THAN ( DATE '2025-01-01' )
    );

INSERT INTO orders VALUES ( 1,
                            DATE '2024-12-15',
                            'NORTH',
                            500 );

INSERT INTO orders VALUES ( 2,
                            DATE '2025-01-10',
                            'SOUTH',
                            600 );

INSERT INTO orders VALUES ( 3,
                            DATE '2025-01-25',
                            'EAST',
                            700 );

INSERT INTO orders VALUES ( 4,
                            DATE '2025-02-05',
                            'NORTH',
                            800 );

INSERT INTO orders VALUES ( 5,
                            DATE '2025-03-12',
                            'WEST',
                            900 );

COMMIT;

SELECT
    partition_name,
    high_value
FROM
    user_tab_partitions
WHERE
    table_name = 'ORDERS';

SELECT
    partition_name,
    subpartition_name
FROM
    user_tab_subpartitions
WHERE
    table_name = 'ORDERS';

SELECT
    *
FROM
    orders
WHERE
    order_date BETWEEN DATE '2025-01-01' AND DATE '2025-01-31'
    AND region = 'SOUTH';

SELECT
    *
FROM
    orders PARTITION ( p_before_2025 );

SELECT
    *
FROM
    orders SUBPARTITION ( P_BEFORE_2025_SP_NORTH );