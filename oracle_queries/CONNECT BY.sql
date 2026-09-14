DROP TABLE employee_hierarchy PURGE; -- if exists

CREATE TABLE employee_hierarchy (
    employee_id   NUMBER PRIMARY KEY,
    employee_name VARCHAR2(50),
    manager_id    NUMBER
);

INSERT INTO employee_hierarchy VALUES ( 1,
                                        'E1-CEO',
                                        NULL );

INSERT INTO employee_hierarchy VALUES ( 2,
                                        'E2',
                                        1 );

INSERT INTO employee_hierarchy VALUES ( 3,
                                        'E3',
                                        1 );

INSERT INTO employee_hierarchy VALUES ( 4,
                                        'E4',
                                        2 );

INSERT INTO employee_hierarchy VALUES ( 5,
                                        'E5',
                                        4 );

INSERT INTO employee_hierarchy VALUES ( 6,
                                        'E6',
                                        4 );

COMMIT;

SELECT
    *
FROM
    employee_hierarchy;

SELECT
    level,
    employee_id,
    manager_id,
    sys_connect_by_path(employee_name, ' -> ') AS reporting_tree
FROM
    employee_hierarchy
START WITH
    manager_id IS NULL
CONNECT BY
    PRIOR employee_id = manager_id
ORDER SIBLINGS BY
    employee_name;