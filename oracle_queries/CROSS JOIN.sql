SELECT
    e.emp_name,
    d.dept_name
FROM
         employee_department e
    CROSS JOIN departments d
ORDER BY
    e.emp_name;