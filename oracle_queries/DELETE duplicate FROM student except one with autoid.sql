ALTER TABLE student ADD autoid INTEGER
    GENERATED ALWAYS AS IDENTITY ( START WITH 1 INCREMENT BY 1 );

SELECT
    *
FROM
    student;

DELETE FROM student
WHERE
    autoid NOT IN (
        SELECT
            MIN(autoid)
        FROM
            student
        GROUP BY
            subject, year, name
    );

SELECT
    *
FROM
    student;