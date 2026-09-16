DROP TABLE IF EXISTS my_vect_float64;

CREATE TABLE my_vect_float64 (
    v64 VECTOR(2, FLOAT64)
);

describe my_vect_FLOAT64;

DECLARE
    plsql_flt64 vector := to_vector('[0.24, 0.35]');
BEGIN
    INSERT INTO my_vect_float64 VALUES ( plsql_flt64 );

END;
/

COMMIT;

SELECT
    *
FROM
    my_vect_float64;