--------------------------------------------Start AutoList partition-----------------------------------------
DROP TABLE sales_auto_list PURGE;

DROP TABLESPACE list_ptn_auto_1 INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE list_ptn_auto_2 INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE list_ptn_auto_3 INCLUDING CONTENTS CASCADE CONSTRAINTS;

CREATE TABLESPACE list_ptn_auto_1
    DATAFILE 'E:\Oracle Tablespace Files\list_ptn_auto_1.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLESPACE list_ptn_auto_2
    DATAFILE 'E:\Oracle Tablespace Files\list_ptn_auto_2.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLESPACE list_ptn_auto_3
    DATAFILE 'E:\Oracle Tablespace Files\list_ptn_auto_3.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLE sales_auto_list (
    salesman_id   NUMBER(5) NOT NULL,
    salesman_name VARCHAR2(30),
    sales_state   VARCHAR2(20) NOT NULL,
    sales_amount  NUMBER(10),
    sales_date    DATE NOT NULL
)
    PARTITION BY LIST ( sales_state ) AUTOMATIC STORE IN ( list_ptn_auto_1, list_ptn_auto_2, list_ptn_auto_3 ) ( PARTITION p_bh VALUES
    ( 'BIHAR' )
    TABLESPACE list_ptn_auto_1 );

SELECT
    table_name,
    partitioning_type,
    autolist,
    partition_count
FROM
    user_part_tables
WHERE
    table_name = 'SALES_AUTO_LIST';

SELECT
    table_name,
    partition_name,
    high_value
FROM
    user_tab_partitions
WHERE
    table_name = 'SALES_AUTO_LIST';

INSERT INTO sales_auto_list VALUES ( 1,
                                     'SM1',
                                     'BIHAR',
                                     1000,
                                     TO_DATE('21-DEC-2025', 'DD-MON-YYYY') );

INSERT INTO sales_auto_list VALUES ( 2,
                                     'SM2',
                                     'JHARKHAND',
                                     2000,
                                     TO_DATE('31-DEC-2025', 'DD-MON-YYYY') );

INSERT INTO sales_auto_list VALUES ( 3,
                                     'SM2',
                                     'WEST BENGAL',
                                     3000,
                                     TO_DATE('11-JAN-2026', 'DD-MON-YYYY') );

INSERT INTO sales_auto_list VALUES ( 4,
                                     'SM3',
                                     'BIHAR',
                                     4000,
                                     TO_DATE('18-JAN-2026', 'DD-MON-YYYY') );

SELECT
    table_name,
    partition_name,
    high_value
FROM
    user_tab_partitions
WHERE
    table_name = 'SALES_AUTO_LIST';

SELECT
    *
FROM
    sales_auto_list PARTITION ( p_bh );

SELECT
    *
FROM
    sales_auto_list PARTITION ( sys_p10150 ); -- 'SYS_P10150' may vary based on the name prvided by the Oracle

--------------------------------------------End AutoList partition-----------------------------------------