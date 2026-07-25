DELETE FROM student
WHERE
    ROWID NOT IN (
        SELECT
            MIN(ROWID)
        FROM
            student
        GROUP BY
            subject, year, name
    );