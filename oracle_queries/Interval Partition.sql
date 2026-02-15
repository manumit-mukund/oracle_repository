CREATE TABLE interval_tab (
    id           NUMBER,
    code         VARCHAR2(10),
    description  VARCHAR2(50),
    created_date DATE
)
    PARTITION BY RANGE (
        created_date
    ) INTERVAL ( numtoyminterval(1, 'MONTH') ) ( PARTITION part_01
        VALUES LESS THAN ( TO_DATE('01-NOV-2007', 'DD-MON-YYYY') )
    );

EXEC DBMS_STATS . GATHER_TABLE_STATS ( USER , 'INTERVAL_TAB'
) ;

COLUMN TABLE_NAME FORMAT A20 COLUMN PARTITION_NAME FORMAT A20 COLUMN HIGH_VALUE FORMAT A40

SELECT
    table_name,
    partition_name,
    high_value,
    num_rows
FROM
    user_tab_partitions
    WHERE
    table_name = 'INTERVAL_TAB'
ORDER BY
    table_name,
    partition_name;