----------------------start for 2nd highest salary metthod1-----------------------------
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
    
----------------------end for 2nd highest salary metthod1-----------------------------


----------------------start for 2nd highest salary metthod2-----------------------------
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
----------------------end for 2nd highest salary metthod2-----------------------------
