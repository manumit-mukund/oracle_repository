CREATE TABLE student (
    subject VARCHAR2(50),
    year    NUMBER,
    name    VARCHAR2(50)
);

INSERT INTO student (
    subject,
    year,
    name
) VALUES ( 'Maths',
           2024,
           'S1' );

INSERT INTO student (
    subject,
    year,
    name
) VALUES ( 'Physics',
           2025,
           'S2' );

INSERT INTO student (
    subject,
    year,
    name
) VALUES ( 'Chemistry',
           2026,
           'S3' );

INSERT INTO student (
    subject,
    year,
    name
) VALUES ( 'Maths',
           2024,
           'S1' );

SELECT
    *
FROM
    student;

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