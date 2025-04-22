----------------------------------------Use con_SYS_PDB start---------------------------------------
show con_name;

ALTER SESSION SET CONTAINER = pdb2;

show con_name;

ALTER PLUGGABLE DATABASE pdb2 OPEN READ WRITE;

----------------------------------------Use con_SYS_PDB end-------------------------------------------
DROP TABLE IF EXISTS test_immutable PURGE;

CREATE immutable table test_immutable (
eno number(10),
name varchar2(20),
    address      VARCHAR2(20),
    created_date DATE,
    CONSTRAINT test_immutable_pk PRIMARY KEY ( eno )
) NO DROP UNTIL 1 DAYS IDLE NO DELETE UNTIL 1 DAYS AFTER INSERT;
desc dba_immutable_tables; 

desc test_immutable;

SELECT
    *
FROM
    test_immutable;

INSERT INTO test_immutable VALUES ( 1,
                                    'mir',
                                    'india',
                                    sysdate );

INSERT INTO test_immutable VALUES ( 2,
                                    'Rakesh',
                                    'England',
                                    sysdate );

UPDATE test_immutable
SET
    eno = 2
WHERE
    name = 'Rakesh1';

DELETE FROM test_immutable
WHERE
    eno = 2;

ALTER TABLE test_immutable NO DELETE UNTIL 3 DAYS AFTER INSERT;

ALTER TABLE test_immutable NO DELETE UNTIL 4 DAYS AFTER INSERT;

ALTER TABLE test_immutable NO DROP;

ALTER TABLE test_immutable ADD (
    salary NUMBER(20)
);

ALTER TABLE test_immutable DROP COLUMN name;

TRUNCATE TABLE test_immutable;

SELECT
    *
FROM
    test_immutable;

DROP TABLE test_immutable;

