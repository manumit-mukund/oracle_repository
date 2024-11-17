CREATE TABLE demo (
    personid  INT,
    lastname  VARCHAR(255),
    firstname VARCHAR(255)
);

INSERT INTO demo (
    personid,
    lastname,
    firstname
) VALUES (
    1,
    'L1',
    'F1'
);

INSERT INTO demo (
    personid,
    lastname,
    firstname
) VALUES (
    2,
    'L2',
    'F2'
);

INSERT INTO demo (
    personid,
    lastname,
    firstname
) VALUES (
    3,
    'L3',
    'F3'
);

INSERT INTO demo (
    personid,
    lastname,
    firstname
) VALUES (
    1,
    'L1',
    'F1'
);

INSERT INTO demo (
    personid,
    lastname,
    firstname
) VALUES (
    2,
    'L2',
    'F2'
);

INSERT INTO demo (
    personid,
    lastname,
    firstname
) VALUES (
    2,
    'L2',
    'F2'
);

SELECT
    *
FROM
    demo;

SELECT
    *
FROM
    demo
GROUP BY (
    personid,
    lastname,
    firstname
)
HAVING
    COUNT(*) > 1;