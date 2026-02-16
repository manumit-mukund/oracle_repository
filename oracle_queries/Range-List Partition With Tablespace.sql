DROP TABLESPACE tbs_us INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE tbs_emea INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE tbs_asia INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE tbs_others INCLUDING CONTENTS CASCADE CONSTRAINTS;

CREATE TABLESPACE tbs_us
    DATAFILE 'E:\Oracle Tablespace Files\tbs_us.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLESPACE tbs_emea
    DATAFILE 'E:\Oracle Tablespace Files\tbs_emea.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLESPACE tbs_asia
    DATAFILE 'E:\Oracle Tablespace Files\tbs_asia.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLESPACE tbs_others
    DATAFILE 'E:\Oracle Tablespace Files\tbs_others.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

DROP TABLE my_sales_table PURGE;

CREATE TABLE my_sales_table (
    invoice_id     NUMBER(16) PRIMARY KEY,
    invoice_date   DATE,
    region_code    VARCHAR2(5),
    invoice_amount NUMBER
)
    PARTITION BY RANGE ( invoice_date ) SUBPARTITION BY LIST ( region_code )
        SUBPARTITION TEMPLATE (
            SUBPARTITION us VALUES ( 'US' ) TABLESPACE tbs_us,
                        SUBPARTITION emea VALUES ( 'EMEA' ) TABLESPACE tbs_emea,
                    SUBPARTITION asia VALUES ( 'ASIA' ) TABLESPACE tbs_asia,
                SUBPARTITION others VALUES ( DEFAULT ) TABLESPACE tbs_others
        )
    ( PARTITION p_2018
        VALUES LESS THAN ( TO_DATE('01-JAN-2019', 'DD-MON-YYYY') ), PARTITION p_2019
        VALUES LESS THAN ( TO_DATE('01-JAN-2020', 'DD-MON-YYYY') )
    );

ALTER DATABASE DATAFILE 'E:\Oracle Tablespace Files\tbs_us.DBF' RESIZE 3000M;

ALTER DATABASE DATAFILE 'E:\Oracle Tablespace Files\tbs_emea.DBF' RESIZE 3000M;

ALTER DATABASE DATAFILE 'E:\Oracle Tablespace Files\tbs_asia.DBF' RESIZE 3000M;

ALTER DATABASE DATAFILE 'E:\Oracle Tablespace Files\tbs_others.DBF' RESIZE 3000M;

SELECT
    table_name,
    partition_name,
    subpartition_name
FROM
    user_tab_subpartitions
WHERE
    table_name = 'MY_SALES_TABLE';

SELECT
    segment_name,
    segment_type,
    partition_name,
    tablespace_name
FROM
    user_segments
WHERE
    segment_name = 'MY_SALES_TABLE'
ORDER BY
    1,
    2,
    3;