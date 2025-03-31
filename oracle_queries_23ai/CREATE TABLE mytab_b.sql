DROP TABLE IF EXISTS mytab_b;

CREATE TABLE mytab_b (
    b boolean
);

describe mytab_b;

var b boolean =
true;

INSERT INTO mytab_b ( b ) VALUES ( :b );

SELECT
    *
FROM
    mytab_b;