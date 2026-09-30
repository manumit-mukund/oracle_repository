-- con_manu_21c

DROP TABLE employee_for_index_composite  PURGE; -- if exists


-- Create the table
CREATE TABLE employee_for_index_composite (
    employee_id   NUMBER PRIMARY KEY,
    first_name    VARCHAR2(20),
    last_name     VARCHAR2(20),
    department_id NUMBER
   
);

-- Insert sample data
INSERT INTO employee_for_index_composite VALUES (1, 'E1', 'Smith', 10, 'ACTIVE');
INSERT INTO employee_for_index_composite VALUES (2, 'E2', 'Jones', 10, 'ACTIVE');
INSERT INTO employee_for_index_composite VALUES (3, 'e3', 'Smith', 20, 'ON_LEAVE');
INSERT INTO employee_for_index_composite VALUES (4, 'E4', 'Miller', 10, 'TERMINATED');
INSERT INTO employee_for_index_composite VALUES (5, 'E5', 'Smith', 30, 'ACTIVE');

COMMIT;
