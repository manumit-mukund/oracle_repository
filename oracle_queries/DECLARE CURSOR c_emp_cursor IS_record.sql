SET SERVEROUTPUT ON

DECLARE
    CURSOR c_emp_cursor IS
    SELECT
        empid,
        name
    FROM
        employee_income
    WHERE
        deptid = 30;

    v_emp_record c_emp_cursor%rowtype;
BEGIN
    OPEN c_emp_cursor;
    LOOP
        FETCH c_emp_cursor INTO v_emp_record;
        EXIT WHEN c_emp_cursor%notfound;
        dbms_output.put_line(v_emp_record.empid
                             || ' '
                             || v_emp_record.name);
    END LOOP;

    CLOSE c_emp_cursor;
END;
/