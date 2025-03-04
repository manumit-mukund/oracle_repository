CREATE TABLE student (
    subject VARCHAR(10),
    year    INT,
    name    VARCHAR(10)
);

INSERT INTO student (
    subject,
    year,
    name
) VALUES ( 'English',
           1,
           'A' );

INSERT INTO student (
    subject,
    year,
    name
) VALUES ( 'English',
           2,
           'B' );

INSERT INTO student (
    subject,
    year,
    name
) VALUES ( 'English',
           1,
           'C' );

INSERT INTO student (
    subject,
    year,
    name
) VALUES ( 'Math',
           1,
           'F' );

INSERT INTO student (
    subject,
    year,
    name
) VALUES ( 'English',
           1,
           'D' );

INSERT INTO student (
    subject,
    year,
    name
) VALUES ( 'English',
           2,
           'E' );

INSERT INTO student (
    subject,
    year,
    name
) VALUES ( 'English',
           2,
           'E' );

INSERT INTO student (
    subject,
    year,
    name
) VALUES ( 'English',
           2,
           'E' );

SELECT
    *
FROM
    student;