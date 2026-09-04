WITH cte AS (
    SELECT
        deptid,
        MAX(salary) AS max_salary
    FROM
        employee_income
    GROUP BY
        deptid
)
SELECT
    e1.*
FROM
         employee_income e1
    JOIN cte e2 ON e1.deptid = e2.deptid
                   AND e1.salary = e2.max_salary;