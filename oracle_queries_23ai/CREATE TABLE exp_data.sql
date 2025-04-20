CREATE TABLE exp_data (
    col_a VECTOR(3)
);

INSERT INTO exp_data VALUES ( '[0.267261237,0.534522474,0.801783681]' );

INSERT INTO exp_data VALUES ( '[0.371390671,0.557085991,0.742781341]' );

INSERT INTO exp_data VALUES ( '[0.424264073,0.565685451,0.707106829]' );

SET vector_type_project_format = JSON;  /* to make vector output readable */

SELECT
    col_a
FROM
    exp_data;