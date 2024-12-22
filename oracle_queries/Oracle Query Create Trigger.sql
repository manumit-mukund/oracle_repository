CREATE TABLE employee (
    employee_id    NUMBER PRIMARY KEY,
    employee_name  VARCHAR2(100),
    salary         NUMBER(10, 2),
    promotion_date DATE
);

INSERT INTO employee (
    employee_id,
    employee_name,
    salary,
    promotion_date
) VALUES (
    1,
    'E1',
    50000,
    NULL
);

INSERT INTO employee (
    employee_id,
    employee_name,
    salary,
    promotion_date
) VALUES (
    2,
    'E2',
    60000,
    NULL
);

SELECT
    *
FROM
    employee;

CREATE OR REPLACE TRIGGER update_salary_on_promotion BEFORE
    UPDATE OF promotion_date ON employee
    FOR EACH ROW
BEGIN
    IF :new.promotion_date IS NOT NULL THEN            
        -- Update the salary after promotion
        :new.salary := :old.salary * 1.1; -- 10% increase after promotion
    END IF;
END;

UPDATE employee
SET
    promotion_date = sysdate
WHERE
    employee_id = 1;