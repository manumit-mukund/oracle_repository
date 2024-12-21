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

    v_empno employee_income.empid%TYPE;
    v_lname employee_income.name%TYPE;
BEGIN
    OPEN c_emp_cursor;
    LOOP
        FETCH c_emp_cursor INTO
            v_empno,
            v_lname;
        EXIT WHEN c_emp_cursor%notfound;
        dbms_output.put_line(v_empno
                             || ' '
                             || v_lname);
    END LOOP;

    CLOSE c_emp_cursor;
END;
/