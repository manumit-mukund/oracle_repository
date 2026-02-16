DROP TABLE list_hash_tab;

CREATE TABLE list_hash_tab (
    id           NUMBER,
    code         VARCHAR2(10),
    description  VARCHAR2(50),
    created_date DATE
)
    PARTITION BY LIST ( code )
        SUBPARTITION BY HASH ( id )
    ( PARTITION part_aa VALUES ( 'AA' ) ( SUBPARTITION part_aa_01, SUBPARTITION part_aa_02 ), PARTITION part_bb VALUES ( 'BB' ) ( SUBPARTITION
    part_bb_01, SUBPARTITION part_bb_02 ) );

DECLARE
    l_code VARCHAR2(10);
BEGIN
    FOR i IN 1..40 LOOP
        IF MOD(i, 2) = 0 THEN
            l_code := 'BB';
        ELSE
            l_code := 'AA';
        END IF;

        INSERT INTO list_hash_tab (
            id,
            code,
            description,
            created_date
        ) VALUES ( i,
                   l_code,
                   'Description for '
                   || i
                   || ' '
                   || l_code,
                   sysdate );

    END LOOP;

    COMMIT;
END;
/

EXEC DBMS_STATS.gather_table_stats(USER, 'LIST_HASH_TAB', granularity=>'ALL');

COLUMN table_name FORMAT A20
COLUMN partition_name FORMAT A20
COLUMN subpartition_name FORMAT A20

SELECT
    table_name,
    partition_name,
    subpartition_name,
    num_rows
FROM
    user_tab_subpartitions
WHERE
    table_name = 'LIST_HASH_TAB'
ORDER BY
    table_name,
    partition_name,
    subpartition_name;

SELECT
    *
FROM
    list_hash_tab PARTITION ( part_aa );

SELECT
    *
FROM
    list_hash_tab SUBPARTITION ( part_aa_01 );

SELECT
    *
FROM
    list_hash_tab SUBPARTITION ( part_aa_02 );