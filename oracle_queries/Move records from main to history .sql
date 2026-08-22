DROP TABLE employee_income_history;

CREATE TABLE employee_income_history
    AS
        SELECT
            *
        FROM
            employee_income;

INSERT INTO employee_income_history
    SELECT
        *
    FROM
        employee_income
    WHERE
        created_date < trunc(sysdate) - 1;

SELECT
    *
FROM
    employee_income_history;