----------------------------------------Use SYS start---------------------------------------
show con_name;

ALTER SESSION SET CONTAINER = pdb2;

show con_name;

ALTER PLUGGABLE DATABASE pdb2 OPEN READ WRITE;

----------------------------------------Use SYS end-------------------------------------------


----------------------------------------Use c##manu start-------------------------------------
show user;

CREATE BLOCKCHAIN TABLE bct_t1 (
    id           NUMBER,
    fruit        VARCHAR2(20),
    quantity     NUMBER,
    created_date DATE,
    CONSTRAINT bct_t1_pk PRIMARY KEY ( id )
)
    NO DROP UNTIL 0 DAYS IDLE
    NO DELETE UNTIL 16 DAYS AFTER INSERT
    HASHING USING "SHA2_512"
    VERSION "v1";

set linesize 120 pagesize 50
column column_name format a30
column data_type format a27
column hidden_column format a13

SELECT
    internal_column_id,
    column_name,
    data_type,
    data_length,
    hidden_column
FROM
    user_tab_cols
WHERE
    table_name = 'BCT_T1'
ORDER BY
    internal_column_id;

column row_retention format a13
column row_retention_locked format a20
column table_inactivity_retention format a26
column hash_algorithm format a14

SELECT
    row_retention,
    row_retention_locked,
    table_inactivity_retention,
    hash_algorithm
FROM
    user_blockchain_tables
WHERE
    table_name = 'BCT_T1';

INSERT INTO bct_t1 (
    id,
    fruit,
    quantity,
    created_date
) VALUES ( 1,
           'apple',
           20,
           sysdate );

INSERT INTO bct_t1 (
    id,
    fruit,
    quantity,
    created_date
) VALUES ( 2,
           'pomegranate',
           30,
           sysdate );

SELECT
    *
FROM
    bct_t1;

UPDATE bct_t1
SET
    quantity = 10
WHERE
    id = 1;

UPDATE bct_t1
SET
    quantity = 40
WHERE
    id = 2;

DELETE FROM bct_t1
WHERE
    id = 1;

TRUNCATE TABLE bct_t1;

ALTER TABLE bct_t1 MODIFY (
    fruit VARCHAR2(25)
);

ALTER TABLE bct_t1 MODIFY (
    fruit VARCHAR2(15)
);

ALTER TABLE bct_t1 MODIFY (
    fruit VARCHAR2(9)
);

ALTER TABLE bct_t1 ADD (
    additional_info VARCHAR2(50)
);

ALTER TABLE bct_t1 DROP COLUMN quantity;

----------------------------------------Use c##manu end-------------------------------------