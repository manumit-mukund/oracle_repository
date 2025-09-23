CREATE TABLE employees (
    employee_id   NUMBER(10) NOT NULL,
    employee_name VARCHAR2(50) NOT NULL,
    manager_id    NUMBER(10)
);

INSERT INTO employees (
    employee_id,
    employee_name,
    manager_id
)
    SELECT
        1,
        'Jack',
        2
    FROM
        dual
    UNION ALL
    SELECT
        2,
        'Jill',
        NULL
    FROM
        dual
    UNION ALL
    SELECT
        3,
        'Jim',
        NULL
    FROM
        dual
    UNION ALL
    SELECT
        4,
        'Bill',
        3
    FROM
        dual
    UNION ALL
    SELECT
        5,
        'Ben',
        NULL
    FROM
        dual
    UNION ALL
    SELECT
        6,
        'Alex',
        2
    FROM
        dual
    UNION ALL
    SELECT
        7,
        'Andrew',
        5
    FROM
        dual
    UNION ALL
    SELECT
        8,
        'Chris',
        5
    FROM
        dual;

COMMIT;

SELECT
    *
FROM
    employees;

SELECT
    *
FROM
    employees
WHERE
    employee_id IN (
        SELECT
            employee_id
        FROM
            employees
        WHERE
            MOD(employee_id, 2) = 1
    );

SELECT
    *
FROM
    employees
WHERE
    employee_id IN (
        SELECT
            employee_id
        FROM
            employees
        WHERE
            employee_name LIKE 'A%'
    );

SELECT
    *
FROM
    employees
WHERE
    employee_id IN (
        SELECT
            employee_id
        FROM
            employees
        WHERE
            manager_id IS NOT NULL
    );

SELECT
    *
FROM
    employees e
WHERE
    EXISTS (
        SELECT
            1
        FROM
            employees m
        WHERE
            m.manager_id = e.employee_id
    );

SELECT
    *
FROM
    employees e1
WHERE
    EXISTS (
        SELECT
            1
        FROM
            employees e2
        WHERE
                e1.employee_id = e2.employee_id
            AND e2.employee_name LIKE 'A%'
    );

SELECT
    *
FROM
    employees e1
WHERE
    EXISTS (
        SELECT
            1
        FROM
            employees e2
        WHERE
                e1.employee_id = e2.employee_id
            AND e2.manager_id IS NOT NULL
    );

SELECT
    *
FROM
    employees
WHERE
    employee_id IN (
        SELECT
            manager_id
        FROM
            employees
    );

SELECT
    *
FROM
    employees
WHERE
    employee_id IN (
        SELECT
            manager_id
        FROM
            employees
        WHERE
            manager_id IS NOT NULL
    );

SELECT
    *
FROM
    employees e
WHERE
    EXISTS (
        SELECT
            1
        FROM
            employees m
        WHERE
            m.manager_id = e.employee_id
    );