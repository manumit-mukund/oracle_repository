DROP TABLE sales_data;

CREATE TABLE sales_data (
    sale_id   NUMBER,
    sale_date DATE,
    amount    NUMBER
)
    PARTITION BY RANGE ( sale_date ) INTERVAL ( numtoyminterval(1, 'MONTH') ) SUBPARTITION BY RANGE ( amount )
        SUBPARTITION TEMPLATE ( SUBPARTITION sp_low
            VALUES LESS THAN ( 1000 ), SUBPARTITION sp_high
            VALUES LESS THAN (
                MAXVALUE
            )
        )
    ( PARTITION p_before_2025
        VALUES LESS THAN ( DATE '2025-01-01' )
    );

INSERT INTO sales_data VALUES ( 1,
                                DATE '2024-12-15',
                                500 );

INSERT INTO sales_data VALUES ( 2,
                                DATE '2025-01-10',
                                1500 );

INSERT INTO sales_data VALUES ( 3,
                                DATE '2025-02-05',
                                700 );

INSERT INTO sales_data VALUES ( 4,
                                DATE '2025-02-20',
                                2000 );

INSERT INTO sales_data VALUES ( 5,
                                DATE '2025-03-12',
                                300 );

COMMIT;

SELECT
    partition_name,
    high_value
FROM
    user_tab_partitions
WHERE
    table_name = 'SALES_DATA';

SELECT
    partition_name,
    subpartition_name,
    high_value
FROM
    user_tab_subpartitions
WHERE
    table_name = 'SALES_DATA';

SELECT
    *
FROM
    sales_data
WHERE
    sale_date BETWEEN DATE '2025-02-01' AND DATE '2025-02-28'
    AND amount < 1000;

SELECT
    *
FROM
    sales_data PARTITION ( p_before_2025 );

SELECT
    *
FROM
    sales_data SUBPARTITION ( p_before_2025_sp_low );

SELECT
    *
FROM
    sales_data SUBPARTITION ( p_before_2025_sp_high );