CREATE TABLE my_brick_collection (
    colour VARCHAR2(10),
    shape  VARCHAR2(10),
    weight INTEGER
);

CREATE TABLE your_brick_collection (
    height INTEGER,
    width  INTEGER,
    depth  INTEGER,
    colour VARCHAR2(10),
    shape  VARCHAR2(10)
);

INSERT INTO my_brick_collection VALUES (
    'red',
    'cube',
    10
);

INSERT INTO my_brick_collection VALUES (
    'blue',
    'cuboid',
    8
);

INSERT INTO my_brick_collection VALUES (
    'green',
    'pyramid',
    20
);

INSERT INTO my_brick_collection VALUES (
    'green',
    'pyramid',
    20
);

INSERT INTO my_brick_collection VALUES (
    NULL,
    'cuboid',
    20
);

INSERT INTO your_brick_collection VALUES (
    2,
    2,
    2,
    'red',
    'cube'
);

INSERT INTO your_brick_collection VALUES (
    2,
    2,
    2,
    'blue',
    'cube'
);

INSERT INTO your_brick_collection VALUES (
    2,
    2,
    8,
    NULL,
    'cuboid'
);

COMMIT;

SELECT
    *
FROM
    my_brick_collection;

SELECT
    *
FROM
    your_brick_collection;

SELECT
    *
FROM
    my_brick_collection
UNION
SELECT
    *
FROM
    your_brick_collection;

SELECT
    colour,
    shape
FROM
    my_brick_collection
UNION
SELECT
    colour,
    shape
FROM
    your_brick_collection;

SELECT
    colour,
    shape
FROM
    my_brick_collection
UNION ALL
SELECT
    colour,
    shape
FROM
    your_brick_collection;

SELECT
    colour,
    shape
FROM
    your_brick_collection ybc
WHERE
    NOT EXISTS (
        SELECT
            NULL
        FROM
            my_brick_collection mbc
        WHERE
                ybc.colour = mbc.colour
            AND ybc.shape = mbc.shape
    );

SELECT
    colour,
    shape
FROM
    your_brick_collection ybc
WHERE
    NOT EXISTS (
        SELECT
            NULL
        FROM
            my_brick_collection mbc
        WHERE
            ( ybc.colour = mbc.colour
              OR ( ybc.colour IS NULL
                   AND mbc.colour IS NULL ) )
            AND ( ybc.shape = mbc.shape
                  OR ( ybc.shape IS NULL
                       AND mbc.shape IS NULL ) )
    );

SELECT
    colour,
    shape
FROM
    your_brick_collection
MINUS
SELECT
    colour,
    shape
FROM
    my_brick_collection;

SELECT
    colour,
    shape
FROM
    my_brick_collection
MINUS
SELECT
    colour,
    shape
FROM
    your_brick_collection;

SELECT
    colour,
    shape
FROM
    my_brick_collection mbc
WHERE
    NOT EXISTS (
        SELECT
            NULL
        FROM
            your_brick_collection ybc
        WHERE
            ( ybc.colour = mbc.colour
              OR ( ybc.colour IS NULL
                   AND mbc.colour IS NULL ) )
            AND ybc.shape = mbc.shape
    );