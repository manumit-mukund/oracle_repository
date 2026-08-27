DROP TABLE employee_income_history; -- drop table if exists

CREATE TABLE employee_income_history
    AS
        SELECT
            *
        FROM
            employee_income
        WHERE
            1 = 0;

DECLARE
    TYPE t_main_rows IS
        TABLE OF employee_income%rowtype;
    v_rows t_main_rows;
    CURSOR c_move_data IS
    SELECT
        *
    FROM
        employee_income
    WHERE
        created_date < trunc(sysdate) - 1;

BEGIN
    OPEN c_move_data;
    LOOP
        FETCH c_move_data
        BULK COLLECT INTO v_rows LIMIT 5000;
        EXIT WHEN v_rows.count = 0;
        FORALL i IN 1..v_rows.count
            INSERT INTO employee_income_history VALUES v_rows ( i );

        FORALL i IN 1..v_rows.count
            DELETE FROM employee_income
            WHERE
                empid = v_rows(i).empid;

        COMMIT;
    END LOOP;

    CLOSE c_move_data;
END;
/