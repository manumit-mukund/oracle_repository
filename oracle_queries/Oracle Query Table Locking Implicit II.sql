SET AUTOCOMMIT OFF

UPDATE lock_test
SET
    value = 'Insert lock test1234'
WHERE
    id# = 1;

COMMIT;

SELECT
    *
FROM
    lock_test;