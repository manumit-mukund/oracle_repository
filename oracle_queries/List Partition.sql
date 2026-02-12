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

DROP TABLE sales_by_region PURGE;

CREATE TABLE sales_by_region (
    product_id    NUMBER(6),
    quantity_sold INTEGER,
    sale_date     DATE,
    store_name    VARCHAR(30),
    state_code    VARCHAR(2)
)
    PARTITION BY LIST ( state_code ) ( PARTITION region_east VALUES ( 'CT',
                                                                      'MA',
                                                                      'MD',
                                                                      'ME',
                                                                      'NH',
                                                                      'NJ',
                                                                      'NY',
                                                                      'PA',
                                                                      'VA' )
    TABLESPACE list_ptn_1,
        PARTITION region_west VALUES ( 'AZ',
                                       'CA',
                                       'CO',
                                       'NM',
                                       'NV',
                                       'OR',
                                       'UT',
                                       'WA' )
        TABLESPACE list_ptn_2,
        PARTITION region_south VALUES ( 'AL',
                                        'AR',
                                        'GA',
                                        'KY',
                                        'LA',
                                        'MS',
                                        'TN',
                                        'TX' )
        TABLESPACE list_ptn_3,
        PARTITION region_central VALUES ( 'IA',
                                          'IL',
                                          'MO',
                                          'MI',
                                          'ND',
                                          'OH',
                                          'SD' )
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

ALTER TABLE sales_by_region ADD PARTITION region_nonmainland VALUES ( 'HI',
                                                                      'PR' );

ALTER TABLE sales_by_region MODIFY PARTITION region_central ADD VALUES ( 'OK', 'KS' );

INSERT INTO sales_by_region VALUES ( 1001,
                                     100,
                                     '25-AUG-2014',
                                     'My Store MA',
                                     'MA' );

INSERT INTO sales_by_region VALUES ( 1002,
                                     200,
                                     '26-AUG-2014',
                                     'My Store OK',
                                     'OK' );

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
    sales_by_region PARTITION ( region_central );

--------------------------------------------End List partition-----------------------------------------