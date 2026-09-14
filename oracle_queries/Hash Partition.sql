DROP TABLE hash_partition_data PURGE;

DROP TABLESPACE hash_ptn_1 INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE hash_ptn_2 INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE hash_ptn_3 INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE hash_ptn_4 INCLUDING CONTENTS CASCADE CONSTRAINTS;

CREATE TABLESPACE hash_ptn_1
    DATAFILE 'E:\Oracle Tablespace Files\hash_ptn_1.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLESPACE hash_ptn_2
    DATAFILE 'E:\Oracle Tablespace Files\hash_ptn_2.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLESPACE hash_ptn_3
    DATAFILE 'E:\Oracle Tablespace Files\hash_ptn_3.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLESPACE hash_ptn_4
    DATAFILE 'E:\Oracle Tablespace Files\hash_ptn_4.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLE hash_partition_data (
    data_item_number    NUMBER,
    data_item_key       VARCHAR2(32),
    data_item_value     VARCHAR2(64),
    data_item_timestamp TIMESTAMP
)
    PARTITION BY HASH ( data_item_number ) ( PARTITION p1 TABLESPACE hash_ptn_1,
    PARTITION p2 TABLESPACE hash_ptn_2,
    PARTITION p3 TABLESPACE hash_ptn_3,
    PARTITION p4 TABLESPACE hash_ptn_4 );

SELECT
    *
FROM
    dba_data_files;

ALTER DATABASE DATAFILE 'E:\Oracle Tablespace Files\hash_ptn_1.DBF' RESIZE 3000M;

ALTER DATABASE DATAFILE 'E:\Oracle Tablespace Files\hash_ptn_2.DBF' RESIZE 3000M;

ALTER DATABASE DATAFILE 'E:\Oracle Tablespace Files\hash_ptn_3.DBF' RESIZE 3000M;

ALTER DATABASE DATAFILE 'E:\Oracle Tablespace Files\hash_ptn_4.DBF' RESIZE 3000M;

SELECT
    *
FROM
    dba_data_files;

INSERT INTO hash_partition_data
    SELECT
        ROWNUM,
        dbms_random.string('X', 2),
        dbms_random.string('X', 2),
        systimestamp
    FROM
        dual
    CONNECT BY
        level <= 16;

COMMIT;

SELECT
    *
FROM
    hash_partition_data
ORDER BY
    data_item_number;

SELECT
    partition_name,
    num_rows
FROM
    user_tab_partitions
WHERE
    table_name = 'HASH_PARTITION_DATA'
ORDER BY
    partition_position;

SELECT
    *
FROM
    hash_partition_data PARTITION ( p1 );

SELECT
    *
FROM
    hash_partition_data PARTITION ( p2 );

SELECT
    *
FROM
    hash_partition_data PARTITION ( p3 );

SELECT
    *
FROM
    hash_partition_data PARTITION ( p4 );