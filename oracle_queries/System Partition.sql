DROP TABLE system_partitioned_tab;

CREATE TABLE system_partitioned_tab (
    id           NUMBER,
    code         VARCHAR2(10),
    description  VARCHAR2(50),
    created_date DATE
)
    PARTITION BY SYSTEM ( PARTITION part_1, PARTITION part_2 );

INSERT INTO system_partitioned_tab partition ( part_1 ) VALUES ( 1,
                                                                 'ONE',
                                                                 'One',
                                                                 sysdate );

INSERT INTO system_partitioned_tab partition ( part_2 ) VALUES ( 2,
                                                                 'TWO',
                                                                 'Two',
                                                                 sysdate );

COMMIT;

EXEC DBMS_STATS.gather_table_stats(USER, 'SYSTEM_PARTITIONED_TAB');

COLUMN table_name FORMAT A25
COLUMN partition_name FORMAT A20
COLUMN high_value FORMAT A10

SELECT
    table_name,
    partition_name,
    high_value,
    num_rows
FROM
    user_tab_partitions
WHERE
    table_name = 'SYSTEM_PARTITIONED_TAB'
ORDER BY
    table_name,
    partition_name;

SELECT
    *
FROM
    system_partitioned_tab PARTITION ( part_1 );

SELECT
    *
FROM
    system_partitioned_tab PARTITION ( part_2 );