SELECT
    empid,
    salary
FROM
    employee_income
WHERE
    salary > ALL ( 20000,
                   30000,
                   40000 );