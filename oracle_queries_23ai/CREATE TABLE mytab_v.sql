DROP TABLE IF EXISTS mytab_v;

CREATE TABLE mytab_v (
    v64 VECTOR(2, FLOAT64)
);

describe mytab_v;

DECLARE
    plsql_flt64 vector := to_vector('[0.64, 0.96]');
BEGIN
    INSERT INTO mytab_v VALUES ( :plsql_flt64 );

END;
/

COMMIT;

SELECT
    COUNT(*)
FROM
    mytab_v;

SELECT
    *
FROM
    mytab_v;