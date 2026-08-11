SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM
    employee_departments e
    FULL OUTER JOIN departments          d ON ( e.dept_id = d.dept_id );