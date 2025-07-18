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

LOCK TABLE lock_test IN EXCLUSIVE MODE;

COMMIT;
