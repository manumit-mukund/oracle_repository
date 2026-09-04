DROP TABLE department;

CREATE TABLE department (
    deptid NUMBER(2, 0),
    name   VARCHAR2(14),
    loc    VARCHAR2(13),
    CONSTRAINT pk_dept PRIMARY KEY ( deptid )
);

INSERT INTO department (
    deptid,
    name,
    loc
) VALUES ( 1,
           'ACCOUNTING',
           'MUMBAI' );

INSERT INTO department VALUES ( 2,
                                'RESEARCH',
                                'DELHI' );

INSERT INTO department VALUES ( 3,
                                'SALES',
                                'BIHAR' );

INSERT INTO department VALUES ( 4,
                                'OPERATIONS',
                                'WB' );

INSERT INTO department VALUES ( 5,
                                'IT',
                                'BANGALORE' );

COMMIT;

SELECT
    *
FROM
    department;