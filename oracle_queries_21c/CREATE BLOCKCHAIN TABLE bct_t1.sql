----------------------------------------Use con_SYS_PDB start---------------------------------------
show con_name;

ALTER SESSION SET CONTAINER = pdb2;

show con_name;

ALTER PLUGGABLE DATABASE pdb2 OPEN READ WRITE;

----------------------------------------Use con_SYS_PDB end-------------------------------------------

----------------------------------------Use con_manu_pdb start-------------------------------------
show user;

DROP TABLE blockchain_test;

CREATE BLOCKCHAIN TABLE blockchain_test (
    id           NUMBER,
    fruit        VARCHAR2(20),
    quantity     NUMBER,
    created_date DATE,
    CONSTRAINT pk_id PRIMARY KEY ( id )
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
    table_name = 'BLOCKCHAIN_TEST'
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
    table_name = 'BLOCKCHAIN_TEST';

INSERT INTO blockchain_test (
    id,
    fruit,
    quantity,
    created_date
) VALUES ( 1,
           'mango',
           10,
           sysdate );

INSERT INTO blockchain_test (
    id,
    fruit,
    quantity,
    created_date
) VALUES ( 2,
           'banana',
           20,
           sysdate );

SELECT
    *
FROM
    blockchain_test;

UPDATE blockchain_test
SET
    quantity = 11
WHERE
    id = 1;

UPDATE blockchain_test
SET
    quantity = 21
WHERE
    id = 2;

DELETE FROM blockchain_test
WHERE
    id = 1;

TRUNCATE TABLE blockchain_test;

ALTER TABLE blockchain_test MODIFY (
    fruit VARCHAR2(25)
);

ALTER TABLE blockchain_test MODIFY (
    fruit VARCHAR2(15)
);

ALTER TABLE blockchain_test MODIFY (
    fruit VARCHAR2(9)
);

ALTER TABLE blockchain_test ADD (
    additional_info VARCHAR2(50)
);

ALTER TABLE blockchain_test DROP COLUMN quantity;

----------------------------------------Use con_manu_pdb end-------------------------------------