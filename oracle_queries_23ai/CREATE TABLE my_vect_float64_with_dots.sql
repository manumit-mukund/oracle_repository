DROP TABLE IF EXISTS my_vect_float64_with_dots;

CREATE TABLE my_vect_float64_with_dots (
    pkey  INTEGER NOT NULL PRIMARY KEY,
    name  VARCHAR(50) NOT NULL,
    vect1 VECTOR(4, FLOAT64)
);

INSERT INTO my_vect_float64_with_dots VALUES ( 1,
                                               'N1',
                                               '[-3.45, -4.45, 9.234, ... ]' );

SELECT
    *
FROM
    my_vect_float64_with_dots;