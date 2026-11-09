SELECT
    *
FROM
    employee_income
WHERE
    doj BETWEEN ( sysdate - 30 ) AND sysdate;