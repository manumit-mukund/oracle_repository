DROP TABLE my_vector_int8 PURGE;

CREATE TABLE my_vector_int8 (
    vect_column VECTOR(3, INT8)
);

INSERT INTO my_vector_int8 VALUES ( '[10, 20, 30]' );

SELECT
    *
FROM
    my_vector_int8;