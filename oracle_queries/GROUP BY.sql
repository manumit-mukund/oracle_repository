DROP TABLE student;

CREATE TABLE student (
    name       VARCHAR(50),
    course_fee DECIMAL(10, 2),
    course     VARCHAR(50)
);

INSERT INTO student (
    name,
    course_fee,
    course
) VALUES ( 'Aleena',
           5000.00,
           'Mathematics' );

INSERT INTO student (
    name,
    course_fee,
    course
) VALUES ( 'Ben',
           6000.50,
           'English' );

INSERT INTO student (
    name,
    course_fee,
    course
) VALUES ( 'Chris',
           7500.75,
           'Science' );

INSERT INTO student (
    name,
    course_fee,
    course
) VALUES ( 'Darla',
           4500.25,
           'Mathematics' );

INSERT INTO student (
    name,
    course_fee,
    course
) VALUES ( 'Erie',
           8000.00,
           'English' );

INSERT INTO student (
    name,
    course_fee,
    course
) VALUES ( 'Monty',
           6500.00,
           'Science' );

INSERT INTO student (
    name,
    course_fee,
    course
) VALUES ( 'Aleena',
           5500.50,
           'Mathematics' );

INSERT INTO student (
    name,
    course_fee,
    course
) VALUES ( 'Chris',
           7200.75,
           'Science' );

INSERT INTO student (
    name,
    course_fee,
    course
) VALUES ( 'Darla',
           4800.60,
           'Mathematics' );

INSERT INTO student (
    name,
    course_fee,
    course
) VALUES ( 'Ben',
           8300.00,
           'English' );

COMMIT;

SELECT
    *
FROM
    student;

SELECT
    name,
    SUM(course_fee)
FROM
    student
GROUP BY
    name;

SELECT
    name,
    course,
    COUNT(*)
FROM
    student
GROUP BY
    course,
    name;

SELECT
    name,
    MIN(course_fee) AS "Lowest course_fee"
FROM
    student
GROUP BY
    name;

SELECT
    course,
    MAX(course_fee) AS "Highest course_fee"
FROM
    student
GROUP BY
    course;