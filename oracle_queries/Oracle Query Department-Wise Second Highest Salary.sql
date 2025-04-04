SELECT
    deptid,
    MAX(salary) AS second_highest_salary
FROM
    employee_income e1
WHERE
    salary < (
        SELECT
            MAX(salary)
        FROM
            employee_income e2
        WHERE
            e2.deptid = e1.deptid
    )
GROUP BY
    deptid;