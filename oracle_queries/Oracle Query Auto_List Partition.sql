--------------------------------------------Start AutoList partition-----------------------------------------

CREATE TABLE sales_auto_list (
    salesman_id   NUMBER(5) NOT NULL,
    salesman_name VARCHAR2(30),
    sales_state   VARCHAR2(20) NOT NULL,
    sales_amount  NUMBER(10),
    sales_date    DATE NOT NULL
)
    PARTITION BY LIST ( sales_state ) AUTOMATIC ( PARTITION p_cal VALUES ( 'CALIFORNIA' ) );

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

INSERT INTO sales_auto_list VALUES (
    021,
    'Mary Smith',
    'FLORIDA',
    41000,
    TO_DATE('21-DEC-2018', 'DD-MON-YYYY')
);

INSERT INTO SALES_AUTO_LIST VALUES(032, 'Luis Vargas', 'MICHIGAN', 42000, TO_DATE ('31-DEC-2018','DD-MON-YYYY'))
INSERT INTO sales_auto_list VALUES (
    015,
    'Simone Blair',
    'CALIFORNIA',
    45000,
    TO_DATE('11-JAN-2019', 'DD-MON-YYYY')
);

INSERT INTO sales_auto_list VALUES (
    015,
    'Simone Blair',
    'OREGON',
    38000,
    TO_DATE('18-JAN-2019', 'DD-MON-YYYY')
);

SELECT
    table_name,
    partition_name,
    high_value
FROM
    user_tab_partitions
WHERE
    table_name = 'SALES_AUTO_LIST';

--------------------------------------------End AutoList partition-----------------------------------------
