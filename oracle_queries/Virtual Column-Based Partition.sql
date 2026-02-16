DROP TABLE users;

CREATE TABLE users (
    id           NUMBER,
    username     VARCHAR2(20),
        first_letter VARCHAR2(4) GENERATED ALWAYS AS ( upper(substr(
            trim(username),
            1,
            1
        )) ) VIRTUAL
)
    PARTITION BY LIST ( first_letter ) ( PARTITION part_a_g VALUES ( 'A',
                                                                     'B',
                                                                     'C',
                                                                     'D',
                                                                     'E',
                                                                     'F',
                                                                     'G' ),
        PARTITION part_h_n VALUES ( 'H',
                                    'I',
                                    'J',
                                    'K',
                                    'L',
                                    'M',
                                    'N' ),
        PARTITION part_o_u VALUES ( 'O',
                                    'P',
                                    'Q',
                                    'R',
                                    'S',
                                    'T',
                                    'U' ),
        PARTITION part_v_z VALUES ( 'V',
                                    'W',
                                    'X',
                                    'Y',
                                    'Z' )
    );

INSERT INTO users (
    id,
    username
) VALUES ( 1,
           'Andy Pandy' );

INSERT INTO users (
    id,
    username
) VALUES ( 1,
           'Burty Basset' );

INSERT INTO users (
    id,
    username
) VALUES ( 1,
           'Harry Hill' );

INSERT INTO users (
    id,
    username
) VALUES ( 1,
           'Iggy Pop' );

INSERT INTO users (
    id,
    username
) VALUES ( 1,
           'Oliver Hardy' );

INSERT INTO users (
    id,
    username
) VALUES ( 1,
           'Peter Pervis' );

INSERT INTO users (
    id,
    username
) VALUES ( 1,
           'Veruca Salt' );

INSERT INTO users (
    id,
    username
) VALUES ( 1,
           'Wiley Cyote' );

COMMIT;

EXEC DBMS_STATS.gather_table_stats(USER, 'USERS');

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
    table_name = 'USERS'
ORDER BY
    table_name,
    partition_name;

SELECT
    *
FROM
    users PARTITION ( part_a_g );

SELECT
    *
FROM
    users PARTITION ( part_h_n );