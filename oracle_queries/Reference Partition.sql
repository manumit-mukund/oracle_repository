DROP TABLE parent_tab;

DROP TABLE child_tab;

CREATE TABLE parent_tab (
    id           NUMBER NOT NULL,
    code         VARCHAR2(10) NOT NULL,
    description  VARCHAR2(50),
    created_date DATE,
    CONSTRAINT parent_tab_pk PRIMARY KEY ( id )
)
    PARTITION BY RANGE (
        created_date
    )
    ( PARTITION part_2007
        VALUES LESS THAN ( TO_DATE('01-JAN-2008', 'DD-MON-YYYY') ),
    PARTITION part_2008
        VALUES LESS THAN ( TO_DATE('01-JAN-2009', 'DD-MON-YYYY') )
    );

CREATE TABLE child_tab (
    id            NUMBER NOT NULL,
    parent_tab_id NUMBER NOT NULL,
    code          VARCHAR2(10),
    description   VARCHAR2(50),
    created_date  DATE,
    CONSTRAINT child_tab_pk PRIMARY KEY ( id ),
    CONSTRAINT child_parent_tab_fk FOREIGN KEY ( parent_tab_id )
        REFERENCES parent_tab ( id )
)
    PARTITION BY REFERENCE ( child_parent_tab_fk );

INSERT INTO parent_tab VALUES ( 1,
                                'ONE',
                                '1 ONE',
                                sysdate );

INSERT INTO parent_tab VALUES ( 2,
                                'TWO',
                                '2 TWO',
                                sysdate );

INSERT INTO parent_tab VALUES ( 3,
                                'THREE',
                                '3 THREE',
                                add_months(sysdate, 12) );

INSERT INTO child_tab VALUES ( 1,
                               1,
                               'ONE',
                               '1 1 ONE',
                               sysdate );

INSERT INTO child_tab VALUES ( 2,
                               3,
                               'TWO',
                               '2 3 TWO',
                               sysdate );

INSERT INTO child_tab VALUES ( 3,
                               3,
                               'THREE',
                               '3 3 THREE',
                               sysdate );

COMMIT;

EXEC DBMS_STATS.gather_table_stats(USER, 'PARENT_TAB');
EXEC DBMS_STATS.gather_table_stats(USER, 'CHILD_TAB');

COLUMN table_name FORMAT A25
COLUMN partition_name FORMAT A20
COLUMN high_value FORMAT A40

SELECT
    table_name,
    partition_name,
    high_value,
    num_rows
FROM
    user_tab_partitions
WHERE
    table_name = 'PARENT_TAB'
ORDER BY
    table_name,
    partition_name;

SELECT
    table_name,
    partition_name,
    high_value,
    num_rows
FROM
    user_tab_partitions
WHERE
    table_name = 'CHILD_TAB'
ORDER BY
    table_name,
    partition_name;