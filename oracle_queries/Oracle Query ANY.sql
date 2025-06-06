SELECT
    empid,
    salary
FROM
    employee_income
WHERE
    salary > ANY ( 20000,
                   30000,
                   40000 );