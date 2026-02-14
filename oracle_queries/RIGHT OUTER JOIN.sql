SELECT
    *
FROM
    employee_department e
    RIGHT OUTER JOIN departments d ON ( e.dept_id = d.dept_id );