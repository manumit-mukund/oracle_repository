SELECT
    *
FROM
    employee_income
WHERE
    salary > (
        SELECT
            AVG(salary)
        FROM
            employee_income
    );