DROP TABLE IF EXISTS my_vect_float64; -- drop if exits

CREATE TABLE my_vect_float64 (
    vect_column VECTOR(2, FLOAT64)
);

describe my_vect_float64;

DECLARE
    var_flatt64 vector := to_vector('[0.24, 0.35]');
BEGIN
    INSERT INTO my_vect_float64 VALUES ( var_flatt64 );

END;
/

COMMIT;

SELECT
    *
FROM
    my_vect_float64;