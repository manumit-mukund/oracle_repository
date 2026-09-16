DROP TABLE my_vect_int8 PURGE;

CREATE TABLE my_vect_int8 (
    v01 VECTOR(3, INT8)
);

INSERT INTO my_vect_int8 VALUES ( '[10, 20, 30]' );

SELECT
    *
FROM
    my_vect_int8;