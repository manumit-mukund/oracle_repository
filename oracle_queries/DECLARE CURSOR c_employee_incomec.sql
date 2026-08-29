set serveroutput on;

DECLARE
    CURSOR c_employee_income IS
    SELECT
        empid,
        name,
        salary
    FROM
        employee_income
    WHERE
        deptid = 10;

    v_emp_id employee_income.empid%TYPE;
    v_name   employee_income.name%TYPE;
    v_salary employee_income.salary%TYPE;
BEGIN
    OPEN c_employee_income;
    LOOP
        FETCH c_employee_income INTO
            v_emp_id,
            v_name,
            v_salary;
        EXIT WHEN c_employee_income%notfound;
        dbms_output.put_line('Empid: '
                             || v_emp_id
                             || ' | Name: '
                             || v_name
                             || ' | Salary: '
                             || v_salary);

    END LOOP;

    CLOSE c_employee_income;
END;
/