SELECT
    *
FROM
    employee_income e1
WHERE
    2 - 1 = (
        SELECT
            COUNT(DISTINCT salary)
        FROM
            employee_income e2
        WHERE
            e2.salary > e1.salary
    );
    
    
----------------------for 2nd highest start-----------------------------

SELECT
    *
FROM
    employee_income
WHERE
    salary = (
        SELECT
            MAX(salary)
        FROM
            employee_income
        WHERE
            salary NOT IN (
                SELECT
                    MAX(salary)
                FROM
                    employee_income
            )
    );
    ----------------------for 2nd highest end-----------------------------