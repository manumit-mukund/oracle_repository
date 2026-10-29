-- con_manu_21c
WITH salary_ranked_data AS (
    SELECT
        name,
        deptid,
        salary,
        RANK()
        OVER(PARTITION BY deptid
             ORDER BY
                 salary DESC
        ) AS rank
    FROM
        employee_income
)
SELECT
    *
FROM
    salary_ranked_data
WHERE
    rank = 3;