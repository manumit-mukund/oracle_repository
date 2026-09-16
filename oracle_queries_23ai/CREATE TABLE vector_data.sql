DROP TABLE IF EXISTS vector_data PURGE; -- drop if exists

CREATE TABLE vector_data (
    col_vector VECTOR(3)
);

INSERT INTO vector_data VALUES ( '[0.267261237, 0.534522474, 0.801783681]' );

INSERT INTO vector_data VALUES ( '[0.371390671, 0.557085991, 0.742781341]' );

INSERT INTO vector_data VALUES ( '[0.424264073, 0.565685451, 0.707106829]' );

INSERT INTO vector_data VALUES ( '[1, 2, 3]' );

COMMIT;

SELECT
    col_vector
FROM
    vector_data;