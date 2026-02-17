DROP TABLE sales;

CREATE TABLE sales (
    sale_id   NUMBER,
    region    VARCHAR2(20),
    sale_date DATE,
    amount    NUMBER
)
    PARTITION BY LIST ( region ) SUBPARTITION BY RANGE ( sale_date ) ( PARTITION p_north VALUES ( 'NORTH' ) ( SUBPARTITION p_north_h1
        VALUES LESS THAN ( DATE '2025-07-01' ), SUBPARTITION p_north_h2
        VALUES LESS THAN ( DATE '2026-01-01' )
    ), PARTITION p_south VALUES ( 'SOUTH' ) ( SUBPARTITION p_south_h1
        VALUES LESS THAN ( DATE '2025-07-01' ), SUBPARTITION p_south_h2
        VALUES LESS THAN ( DATE '2026-01-01' )
    ), PARTITION p_other VALUES ( DEFAULT ) ( SUBPARTITION p_other_h1
        VALUES LESS THAN ( DATE '2025-07-01' ), SUBPARTITION p_other_h2
        VALUES LESS THAN ( DATE '2026-01-01' )
    ) );

INSERT INTO sales VALUES ( 1,
                           'NORTH',
                           DATE '2025-03-15',
                           500 );

INSERT INTO sales VALUES ( 2,
                           'SOUTH',
                           DATE '2025-08-20',
                           700 );

INSERT INTO sales VALUES ( 3,
                           'EAST',
                           DATE '2025-04-10',
                           900 );

INSERT INTO sales VALUES ( 4,
                           'NORTH',
                           DATE '2025-10-05',
                           1200 );

COMMIT;

SELECT
    table_name,
    partition_name,
    high_value
FROM
    user_tab_partitions
WHERE
    table_name = 'SALES';

SELECT
    table_name,
    partition_name,
    subpartition_name,
    high_value
FROM
    user_tab_subpartitions
WHERE
    table_name = 'SALES';

SELECT
    *
FROM
    sales
WHERE
        region = 'NORTH'
    AND sale_date < DATE '2025-07-01';

SELECT
    *
FROM
    sales PARTITION ( p_north );

SELECT
    *
FROM
    sales SUBPARTITION ( p_north_h1 );