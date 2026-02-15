DROP TABLESPACE transport_test_ts_1 INCLUDING CONTENTS CASCADE CONSTRAINTS;

DROP TABLESPACE transport_test_ts_2 INCLUDING CONTENTS CASCADE CONSTRAINTS;

CREATE TABLESPACE transport_test_ts_1
    DATAFILE 'E:\Oracle Tablespace Files\tt_ts_1.DBF' SIZE 128K
    AUTOEXTEND ON NEXT 128K;

CREATE TABLESPACE transport_test_ts_2
    DATAFILE 'E:\Oracle Tablespace Files\tt_ts_2.DBF' SIZE 128K
    AUTOEXTEND ON NEXT 128K;

ALTER USER c##manu
    QUOTA UNLIMITED ON transport_test_ts_1
    QUOTA UNLIMITED ON transport_test_ts_2;

CREATE TABLE transport_test_tab (
    id           NUMBER NOT NULL,
    code         VARCHAR2(10) NOT NULL,
    description  VARCHAR2(50),
    created_date DATE,
    CONSTRAINT transport_test_pk PRIMARY KEY ( id )
)
    PARTITION BY RANGE (
        created_date
    )
    ( PARTITION part_2007
        VALUES LESS THAN ( TO_DATE('01-JAN-2008', 'DD-MON-YYYY') )
    TABLESPACE transport_test_ts_1,
    PARTITION part_2008
        VALUES LESS THAN ( TO_DATE('01-JAN-2009', 'DD-MON-YYYY') )
    TABLESPACE transport_test_ts_2 );

INSERT INTO transport_test_tab VALUES ( 1,
                                        'ONE',
                                        '1 ONE',
                                        sysdate );

INSERT INTO transport_test_tab VALUES ( 2,
                                        'TWO',
                                        '2 TWO',
                                        sysdate );

INSERT INTO transport_test_tab VALUES ( 3,
                                        'THREE',
                                        '3 THREE',
                                        add_months(sysdate, 12) );

INSERT INTO transport_test_tab VALUES ( 4,
                                        'FOUR',
                                        '4 FOUR',
                                        add_months(sysdate, 12) );

COMMIT;

EXEC DBMS_STATS.gather_table_stats(USER, 'TRANSPORT_TEST_TAB');

COLUMN transport_test_tab FORMAT A20
COLUMN part_2007 FORMAT A20
COLUMN transport_test_ts_1 FORMAT A20

SELECT
    table_name,
    partition_name,
    tablespace_name,
    num_rows
FROM
    user_tab_partitions
WHERE
    table_name = 'TRANSPORT_TEST_TAB';