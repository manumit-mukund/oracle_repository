SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION totalCustomers RETURN NUMBER IS
    total NUMBER(2) := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO total
    FROM
        customers;

    RETURN total;
END;
/

DECLARE
    c NUMBER(2);
BEGIN
    c := totalcustomers();
    dbms_output.put_line('Total no. of Customers: ' || c);
END;
/