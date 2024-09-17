SET AUTOCOMMIT OFF

LOCK TABLE lock_test IN SHARE MODE;

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