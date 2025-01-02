ALTER SESSION SET container = pdb2;

create immutable table test_immutable (
eno number(10),
name varchar2(20), 
address varchar2(20), 
created_date date, 
constraint test_immutable_pk primary key (eno ) ) NO DROP UNTIL 10 DAYS IDLE NO DELETE UNTIL 30 DAYS AFTER INSERT;
desc dba_immutable_tables; 

desc test_immutable;

SELECT
    *
FROM
    test_immutable;

INSERT INTO test_immutable VALUES (
    1,
    'mir',
    'india',
    sysdate
);

INSERT INTO test_immutable VALUES (
    2,
    'Rakesh',
    'England',
    sysdate
);

UPDATE test_immutable
SET
    eno = 3
WHERE
    name = 'Rakesh';

DELETE FROM test_immutable
WHERE
    eno = 3;

ALTER TABLE test_immutable NO DELETE UNTIL 31 DAYS AFTER INSERT;

ALTER TABLE test_immutable NO DELETE UNTIL 30 DAYS AFTER INSERT;

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

