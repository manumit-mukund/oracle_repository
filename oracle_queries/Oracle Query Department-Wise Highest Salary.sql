SELECT
    *
FROM
    employee_income
WHERE
    ( department, salary ) IN (
        SELECT
            department, MAX(salary)
        FROM
            employee_income
        GROUP BY
            department
    );