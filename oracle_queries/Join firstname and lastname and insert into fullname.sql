DROP TABLE users; -- if table already exists

CREATE TABLE users (
    user_id    NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name  VARCHAR2(50),
    full_name  VARCHAR2(50)
);

INSERT INTO users (
    user_id,
    first_name,
    last_name
) VALUES ( 1,
           'F1',
           'L1' );

INSERT INTO users (
    user_id,
    first_name,
    last_name
) VALUES ( 2,
           'f2',
           'L2' );

INSERT INTO users (
    user_id,
    first_name,
    last_name
) VALUES ( 3,
           'F3',
           'L3' );

COMMIT;

SELECT
    *
FROM
    users;

UPDATE users
SET
    full_name = first_name
                || ' '
                || last_name;

SELECT
    *
FROM
    users;