SELECT
    *
FROM
    student
GROUP BY
    subject,
    year,
    name
HAVING
    COUNT(*) > 1;

DELETE FROM student
WHERE
    ( subject, year, name ) IN (
        SELECT
            subject, year, name
        FROM
            student
        GROUP BY
            subject,
            year, name
        HAVING
            COUNT(*) > 1
    );