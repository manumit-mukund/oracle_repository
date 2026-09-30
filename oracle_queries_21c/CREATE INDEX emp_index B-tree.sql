-- con_manu_21c

DROP TABLE employee_for_index PURGE; -- if exists

-- Create a simple table
CREATE TABLE employee_for_index (
    emp_id        NUMBER PRIMARY KEY,
    name          VARCHAR2(20),
    department_id NUMBER
);

-- Insert data
INSERT INTO employee_for_index VALUES ( 1,
                                        'E1',
                                        10 );

INSERT INTO employee_for_index VALUES ( 2,
                                        'E2',
                                        20 );

INSERT INTO employee_for_index VALUES ( 3,
                                        'E3',
                                        30 );

COMMIT;

SELECT
    *
FROM
    employee_for_index;

SELECT
    *
FROM
    employee_for_index
WHERE
    department_id = 30;

CREATE INDEX emp_index ON
    employee_for_index (
        department_id
    );

SELECT
    *
FROM
    employee_for_index
WHERE
    department_id = 30;