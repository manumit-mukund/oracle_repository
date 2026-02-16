DROP TABLE sales;

CREATE TABLE sales (
    sale_id   NUMBER,
    sale_date DATE,
    region    VARCHAR2(20),
    amount    NUMBER
)
    PARTITION BY RANGE ( sale_date ) SUBPARTITION BY LIST ( region ) ( PARTITION p_2023
        VALUES LESS THAN ( DATE '2024-01-01' )
    (
        SUBPARTITION p_2023_north VALUES ( 'NORTH' ),
        SUBPARTITION p_2023_south VALUES ( 'SOUTH' ),
        SUBPARTITION p_2023_other VALUES ( DEFAULT )
    ), PARTITION p_2024
        VALUES LESS THAN ( DATE '2025-01-01' )
    (
        SUBPARTITION p_2024_north VALUES ( 'NORTH' ),
        SUBPARTITION p_2024_south VALUES ( 'SOUTH' ),
        SUBPARTITION p_2024_other VALUES ( DEFAULT )
    ), PARTITION p_max
        VALUES LESS THAN (
            MAXVALUE
        )
    (
        SUBPARTITION p_max_north VALUES ( 'NORTH' ),
        SUBPARTITION p_max_south VALUES ( 'SOUTH' ),
        SUBPARTITION p_max_other VALUES ( DEFAULT )
    ) );

INSERT INTO sales VALUES ( 1,
                           DATE '2023-05-10',
                           'NORTH',
                           1000 );

INSERT INTO sales VALUES ( 2,
                           DATE '2024-02-15',
                           'SOUTH',
                           2000 );

INSERT INTO sales VALUES ( 3,
                           DATE '2025-01-01',
                           'EAST',
                           1500 );

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
    sales PARTITION ( p_2023 );

SELECT
    *
FROM
    sales PARTITION ( p_2024 );

SELECT
    *
FROM
    sales SUBPARTITION ( p_2023_north );

SELECT
    *
FROM
    sales SUBPARTITION ( p_2024_south );