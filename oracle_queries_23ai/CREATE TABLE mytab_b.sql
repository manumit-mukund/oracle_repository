DROP TABLE IF EXISTS boolean_test PURGE;

CREATE TABLE boolean_test (
    id       NUMBER
        GENERATED ALWAYS AS IDENTITY,
    active   boolean,
    archived bool
);

INSERT INTO boolean_test (
    active,
    archived
) VALUES ( TRUE,
           FALSE );

INSERT INTO boolean_test (
    active,
    archived
) VALUES ( TRUE,
           FALSE );

INSERT INTO boolean_test (
    active,
    archived
) VALUES ( 'true',
           'false' );

INSERT INTO boolean_test (
    active,
    archived
) VALUES ( 'TRUE',
           'FALSE' );

INSERT INTO boolean_test (
    active,
    archived
) VALUES ( 'yes',
           'no' );

INSERT INTO boolean_test (
    active,
    archived
) VALUES ( 'YES',
           'NO' );

INSERT INTO boolean_test (
    active,
    archived
) VALUES ( 'on',
           'off' );

INSERT INTO boolean_test (
    active,
    archived
) VALUES ( 'ON',
           'OFF' );

INSERT INTO boolean_test (
    active,
    archived
) VALUES ( 1,
           0 );

INSERT INTO boolean_test (
    active,
    archived
) VALUES ( '1',
           '0' );

INSERT INTO boolean_test (
    active,
    archived
) VALUES ( 't',
           'f' );

INSERT INTO boolean_test (
    active,
    archived
) VALUES ( 'T',
           'F' );

INSERT INTO boolean_test (
    active,
    archived
) VALUES ( 'y',
           'n' );

INSERT INTO boolean_test (
    active,
    archived
) VALUES ( 'Y',
           'N' );

COMMIT;

SELECT
    *
FROM
    boolean_test;