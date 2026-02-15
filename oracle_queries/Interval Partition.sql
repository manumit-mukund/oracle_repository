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

COLUMN TABLE_NAME FORMAT A20 
COLUMN PARTITION_NAME FORMAT A20 
COLUMN HIGH_VALUE FORMAT A40

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

INSERT INTO interval_tab VALUES ( 1,
                                  'ONE',
                                  'One',
                                  TO_DATE('16-OCT-2007', 'DD-MON-YYYY') );

INSERT INTO interval_tab VALUES ( 2,
                                  'TWO',
                                  'Two',
                                  TO_DATE('31-OCT-2007', 'DD-MON-YYYY') );

COMMIT;

EXEC DBMS_STATS.gather_table_stats(USER, 'INTERVAL_TAB');

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

INSERT INTO interval_tab VALUES ( 3,
                                  'THREE',
                                  'Three',
                                  TO_DATE('01-NOV-2007', 'DD-MON-YYYY') );

INSERT INTO interval_tab VALUES ( 4,
                                  'FOUR',
                                  'Four',
                                  TO_DATE('30-NOV-2007', 'DD-MON-YYYY') );

COMMIT;

EXEC DBMS_STATS.gather_table_stats(USER, 'INTERVAL_TAB');

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

INSERT INTO interval_tab VALUES ( 5,
                                  'FIVE',
                                  'Five',
                                  TO_DATE('01-JAN-2008', 'DD-MON-YYYY') );

INSERT INTO interval_tab VALUES ( 4,
                                  'FOUR',
                                  'Four',
                                  TO_DATE('31-JAN-2008', 'DD-MON-YYYY') );

COMMIT;

EXEC DBMS_STATS.gather_table_stats(USER, 'INTERVAL_TAB');

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

INSERT INTO interval_tab VALUES ( 7,
                                  'SEVEN',
                                  'Seven',
                                  TO_DATE('01-DEC-2007', 'DD-MON-YYYY') );

INSERT INTO interval_tab VALUES ( 8,
                                  'EIGHT',
                                  'Eight',
                                  TO_DATE('31-DEC-2007', 'DD-MON-YYYY') );

COMMIT;

EXEC DBMS_STATS.gather_table_stats(USER, 'INTERVAL_TAB');

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