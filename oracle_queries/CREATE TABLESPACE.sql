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

SELECT
    table_name,
    partition_name,
    partition_position,
    high_value
FROM
    user_tab_partitions
WHERE
    table_name = 'SALES_RANGE_PARTITION';

SELECT
    owner,
    table_name,
    tablespace_name
FROM
    dba_tables
WHERE
    table_name = 'SALES_RANGE_PARTITION';

SELECT
    table_owner,
    table_name,
    partition_name,
    tablespace_name
FROM
    dba_tab_partitions
WHERE
    table_name = 'SALES_RANGE_PARTITION';