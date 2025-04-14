DROP TABLE my_vect_tab PURGE;

CREATE TABLE my_vect_tab (
    v01 VECTOR(3, INT8)
);

INSERT INTO my_vect_tab VALUES ( '[10, 20, 30]' );

SELECT
    *
FROM
    my_vect_tab;