DROP TABLE IF EXISTS vector_data PURGE; -- drop if exists

CREATE TABLE vector_data (
    col_vector VECTOR(3)
);

INSERT INTO vector_data VALUES ( '[0.123, 0.456, 0.789]' );

INSERT INTO vector_data VALUES ( '[1, 2, 3]' );

COMMIT;

SELECT
    col_vector
FROM
    vector_data;