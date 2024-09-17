SET AUTOCOMMIT OFF

LOCK TABLE lock_test IN EXCLUSIVE MODE; -- it cannot get the lock if already taken by some other session

SELECT
    *
FROM
    lock_test; -- it can read even if the shared or the esclusive lock already taken by some other session

UPDATE lock_test
SET
    value = 'Insert lock test123'
WHERE
    id# = 1; -- it cannot update if the shared or the esclusive lock already taken by some other session

COMMIT;