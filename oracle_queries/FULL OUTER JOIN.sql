SELECT
    *
FROM
    employee_department e
    FULL OUTER JOIN departments d ON ( e.dept_id = d.dept_id );