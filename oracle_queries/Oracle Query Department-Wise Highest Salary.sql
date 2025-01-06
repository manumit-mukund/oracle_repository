SELECT
    *
FROM
    employee_income
WHERE
    ( deptid, salary ) IN (
        SELECT
            deptid, MAX(salary)
        FROM
            employee_income
        GROUP BY
            deptid
    );