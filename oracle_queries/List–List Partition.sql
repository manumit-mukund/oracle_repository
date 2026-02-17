DROP TABLE orders;

CREATE TABLE orders (
    order_id      NUMBER,
    customer_name VARCHAR2(50),
    region        VARCHAR2(20),
    order_status  VARCHAR2(20),
    amount        NUMBER
)
    PARTITION BY LIST ( region ) SUBPARTITION BY LIST ( order_status ) ( PARTITION p_north VALUES ( 'NORTH' ) (
        SUBPARTITION p_north_new VALUES ( 'NEW' ),
        SUBPARTITION p_north_ship VALUES ( 'SHIPPED' ),
        SUBPARTITION p_north_default VALUES ( DEFAULT )
    ), PARTITION p_south VALUES ( 'SOUTH' ) (
        SUBPARTITION p_south_new VALUES ( 'NEW' ),
        SUBPARTITION p_south_ship VALUES ( 'SHIPPED' ),
        SUBPARTITION p_south_default VALUES ( DEFAULT )
    ), PARTITION p_other VALUES ( DEFAULT ) (
        SUBPARTITION p_other_default VALUES ( DEFAULT )
    ) );

INSERT INTO orders VALUES ( 1,
                            'John',
                            'NORTH',
                            'NEW',
                            1000 );

INSERT INTO orders VALUES ( 2,
                            'Alice',
                            'NORTH',
                            'SHIPPED',
                            1500 );

INSERT INTO orders VALUES ( 3,
                            'Bob',
                            'SOUTH',
                            'NEW',
                            2000 );

INSERT INTO orders VALUES ( 4,
                            'David',
                            'SOUTH',
                            'CANCELLED',
                            500 );

INSERT INTO orders VALUES ( 5,
                            'Eva',
                            'WEST',
                            'NEW',
                            1200 );

COMMIT;

SELECT
    partition_name
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
        region = 'SOUTH'
    AND order_status = 'NEW';

SELECT
    *
FROM
    orders PARTITION ( p_north );

SELECT
    *
FROM
    orders SUBPARTITION ( p_north_new );