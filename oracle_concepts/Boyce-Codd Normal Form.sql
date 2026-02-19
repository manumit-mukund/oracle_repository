DROP TABLE student_enroll;

DROP TABLE professor_subject;

DROP TABLE student_professor;

-- Initial Table (3NF but not BCNF)
CREATE TABLE student_enroll (
    student_id NUMBER,
    subject    VARCHAR2(50),
    professor  VARCHAR2(50),
    CONSTRAINT pk_enroll PRIMARY KEY ( student_id,
                                       subject )
);

-- Insertion of redundant data (Professor Jones teaches Java)
INSERT INTO student_enroll VALUES ( 101,
                                    'Java',
                                    'Jones' );

INSERT INTO student_enroll VALUES ( 102,
                                    'Java',
                                    'Jones' );
-- Update anomaly: If Jones changes subject, both rows must be updated.

-- Table 1: Professor_Subject
CREATE TABLE professor_subject (
    professor VARCHAR2(50) PRIMARY KEY,
    subject   VARCHAR2(50) NOT NULL
);

-- Table 2: Student_Professor
CREATE TABLE student_professor (
    student_id NUMBER,
    professor  VARCHAR2(50),
    PRIMARY KEY ( student_id,
                  professor ),
    FOREIGN KEY ( professor )
        REFERENCES professor_subject ( professor )
);

-- Inserting data into decomposed tables
INSERT INTO professor_subject VALUES ( 'Jones',
                                       'Java' );

INSERT INTO student_professor VALUES ( 101,
                                       'Jones' );

INSERT INTO student_professor VALUES ( 102,
                                       'Jones' );

SELECT
    *
FROM
    student_enroll;

SELECT
    *
FROM
    professor_subject;

SELECT
    *
FROM
    student_professor;