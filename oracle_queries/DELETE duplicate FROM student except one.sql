CREATE TABLE student_distinct
    AS
        (
            SELECT DISTINCT
                *
            FROM
                student
        );

SELECT
    *
FROM
    student_distinct;

DELETE FROM student;

SELECT
    *
FROM
    student;

INSERT INTO student
    (
        SELECT
            *
        FROM
            student_distinct
    );

SELECT
    *
FROM
    student;

DROP TABLE student_distinct;