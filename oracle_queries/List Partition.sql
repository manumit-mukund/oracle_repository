DROP TABLE sales_by_region PURGE;

DROP TABLESPACE list_ptn_1 INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE list_ptn_2 INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE list_ptn_3 INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE list_ptn_4 INCLUDING CONTENTS CASCADE CONSTRAINTS;

CREATE TABLESPACE list_ptn_1
    DATAFILE 'E:\Oracle Tablespace Files\list_ptn_1.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLESPACE list_ptn_2
    DATAFILE 'E:\Oracle Tablespace Files\list_ptn_2.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLESPACE list_ptn_3
    DATAFILE 'E:\Oracle Tablespace Files\list_ptn_3.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE TABLESPACE list_ptn_4
    DATAFILE 'E:\Oracle Tablespace Files\list_ptn_4.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;
    
    --------------------------------------------Start List partition-----------------------------------------

CREATE TABLE sales_by_region (
    product_id    NUMBER(6),
    quantity_sold INTEGER,
    sale_date     DATE,
    store_name    VARCHAR(30),
    state_code    VARCHAR(2)
)
    PARTITION BY LIST ( state_code ) ( PARTITION region_east VALUES ( 'BH',
                                                                      'JH' )
    TABLESPACE list_ptn_1,
        PARTITION region_west VALUES ( 'GO',
                                       'GU',
                                       'MH' )
        TABLESPACE list_ptn_2,
        PARTITION region_south VALUES ( 'AP',
                                        'KA' )
        TABLESPACE list_ptn_3,
        PARTITION region_central VALUES ( 'MP',
                                          'CH' )
        TABLESPACE list_ptn_4
    );

SELECT
    table_name,
    partition_name,
    partition_position,
    high_value
FROM
    user_tab_partitions
WHERE
    table_name = 'SALES_BY_REGION';

ALTER TABLE sales_by_region ADD PARTITION region_north VALUES ( 'HP',
                                                                'UT' );

ALTER TABLE sales_by_region MODIFY PARTITION region_east ADD VALUES ( 'OD', 'WB' );

INSERT INTO sales_by_region VALUES ( 1,
                                     100,
                                     '05-AUG-2026',
                                     'Store-MH',
                                     'MH' );

INSERT INTO sales_by_region VALUES ( 2,
                                     200,
                                     '06-AUG-2014',
                                     'Stored-OD',
                                     'OD' );

INSERT INTO sales_by_region VALUES ( 3,
                                     300,
                                     '06-AUG-2014',
                                     'Stored-OD',
                                     'MP' );

INSERT INTO sales_by_region VALUES ( 4,
                                     400,
                                     '06-AUG-2014',
                                     'Stored-OD',
                                     'HP' );

SELECT
    *
FROM
    dba_data_files;

SELECT
    partition_name,
    num_rows
FROM
    user_tab_partitions
WHERE
    table_name = 'SALES_BY_REGION'
ORDER BY
    partition_position;

SELECT
    *
FROM
    dba_tab_partitions
WHERE
    table_name = 'SALES_BY_REGION';

SELECT
    *
FROM
    sales_by_region;

SELECT
    *
FROM
    sales_by_region PARTITION ( region_east );

SELECT
    *
FROM
    sales_by_region PARTITION ( region_west );

SELECT
    *
FROM
    sales_by_region PARTITION ( region_central );

SELECT
    *
FROM
    sales_by_region PARTITION ( region_north );

--------------------------------------------End List partition-----------------------------------------