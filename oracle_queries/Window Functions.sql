SELECT 
    name, deptid, salary,
    ROW_NUMBER() OVER (PARTITION BY deptid ORDER BY salary DESC) as row_num,
    RANK()       OVER (PARTITION BY deptid ORDER BY salary DESC) as rank,
    DENSE_RANK() OVER (PARTITION BY deptid ORDER BY salary DESC) as dense_rnk
FROM employee_income;