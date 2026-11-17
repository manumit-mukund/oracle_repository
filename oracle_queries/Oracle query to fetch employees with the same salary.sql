SELECT
    *
FROM
    employee_income e1
WHERE
    e1.salary IN (
        SELECT
            e2.salary
        FROM
            employee_income e2
        WHERE
            e1.empid != e2.empid
    );