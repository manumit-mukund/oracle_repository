DROP TABLE IF EXISTS tab1;

CREATE TABLE tab1 (
    pkey  INTEGER NOT NULL PRIMARY KEY,
    name  VARCHAR(50) NOT NULL,
    vect1 VECTOR(3, FLOAT64)
);

INSERT INTO tab1 VALUES ( 101,
                          'Mike STORN',
                          '[-3.45, -4.45, 9.234 ]' );

SELECT
    *
FROM
    tab1;