DROP TABLE employee_income_history; -- drop table if exists

CREATE TABLE employee_income_history
    AS
        SELECT
            *
        FROM
            employee_income
        WHERE
            1 = 0;

INSERT INTO employee_income_history
    SELECT
        *
    FROM
        employee_income
    WHERE
        created_date < trunc(sysdate) - 1;

DELETE FROM employee_income
WHERE
    created_date < trunc(sysdate) - 1;

SELECT
    *
FROM
    employee_income_history;