DROP TABLE t1;

CREATE TABLE t1 (
    id           NUMBER,
    country_code VARCHAR2(3),
    record_type  VARCHAR2(5),
    descriptions VARCHAR2(50),
    CONSTRAINT t1_pk PRIMARY KEY ( id )
)
    PARTITION BY LIST ( country_code,
                        record_type ) ( PARTITION part_gbr_abc VALUES ( ( 'GBR',
                                                                          'A' ), ( 'GBR',
                                                                                   'B' ), ( 'GBR',
                                                                                            'C' ) ),
        PARTITION part_ire_ab VALUES ( ( 'IRE',
                                         'A' ), ( 'IRE',
                                                  'B' ) ),
        PARTITION part_usa_a VALUES ( ( 'USA',
                                        'A' ) ),
        PARTITION part_others VALUES ( DEFAULT )
    );

-- Defined partitions.
INSERT INTO t1 VALUES ( 1,
                        'GBR',
                        'A',
                        'Description for GBR_A' );

INSERT INTO t1 VALUES ( 2,
                        'GBR',
                        'B',
                        'Description for GBR_B' );

INSERT INTO t1 VALUES ( 3,
                        'GBR',
                        'C',
                        'Description for GBR_C' );

INSERT INTO t1 VALUES ( 4,
                        'IRE',
                        'A',
                        'Description for IRE_A' );

INSERT INTO t1 VALUES ( 5,
                        'IRE',
                        'B',
                        'Description for IRE_B' );

INSERT INTO t1 VALUES ( 6,
                        'USA',
                        'A',
                        'Description for USA_A' );

-- Default default.
INSERT INTO t1 VALUES ( 7,
                        'BGR',
                        'Z',
                        'Description for BGR_Z' );

INSERT INTO t1 VALUES ( 8,
                        'GBR',
                        'Z',
                        'Description for GBR_Z' );

INSERT INTO t1 VALUES ( 9,
                        'IRE',
                        'Z',
                        'Description for IRE_Z' );

INSERT INTO t1 VALUES ( 10,
                        'USA',
                        'Z',
                        'Description for USA_Z' );

COMMIT;

EXEC DBMS_STATS.gather_table_stats(USER, 'T1');

SET LINESIZE 120
COLUMN table_name FORMAT A20
COLUMN partition_name FORMAT A20
COLUMN high_value FORMAT A50

SELECT
    table_name,
    partition_name,
    high_value,
    num_rows
FROM
    user_tab_partitions
WHERE
    table_name = 'T1'
ORDER BY
    1,
    2;

SELECT
    *
FROM
    t1 PARTITION ( part_gbr_abc );

SELECT
    *
FROM
    t1 PARTITION ( part_ire_ab );