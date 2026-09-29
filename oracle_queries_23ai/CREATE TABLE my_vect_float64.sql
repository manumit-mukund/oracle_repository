DROP TABLE IF EXISTS my_vect_float64; -- drop if exits

CREATE TABLE my_vect_float64 (
    vect_column VECTOR(2, FLOAT64)
);

describe my_vect_float64;

INSERT INTO my_vect_float64 VALUES ( '[0.24, 0.35]' );

COMMIT;

SELECT
    *
FROM
    my_vect_float64;