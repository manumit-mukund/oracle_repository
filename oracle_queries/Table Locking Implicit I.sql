SET AUTOCOMMIT OFF

DROP TABLE lock_test;

CREATE TABLE lock_test (
    id#   NUMBER PRIMARY KEY,
    value VARCHAR2(20)
);

INSERT INTO lock_test VALUES (
    1,
    'Insert lock test'
);

COMMIT;

SELECT
    *
FROM
    lock_test;

UPDATE lock_test
SET
    value = 'Insert lock test123'
WHERE
    id# = 1;

COMMIT;
