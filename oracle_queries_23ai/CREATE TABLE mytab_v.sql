DROP TABLE IF EXISTS mytab_v;

CREATE TABLE mytab_v (
    v64 VECTOR(3, FLOAT64)
);

describe mytab_v;

begin

variable myvar vector = '[1.1, 2.2, 3.0]';
INSERT INTO mytab_v VALUES ( :myvar );

end;
/

SELECT
    COUNT(*)
FROM
    mytab_v;

set linesize 150;

SELECT
    *
FROM
    mytab_v;