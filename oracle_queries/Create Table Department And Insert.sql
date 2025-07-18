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
) VALUES (
    10,
    'ACCOUNTING',
    'NEW YORK'
);

INSERT INTO department VALUES (
    20,
    'RESEARCH',
    'DALLAS'
);

INSERT INTO department VALUES (
    30,
    'SALES',
    'CHICAGO'
);

INSERT INTO department VALUES (
    40,
    'OPERATIONS',
    'BOSTON'
);
