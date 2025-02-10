SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION countrecords (
    tablename IN VARCHAR2
) RETURN NUMBER IS
    total NUMBER(2) := 0;
BEGIN
    EXECUTE IMMEDIATE 'select count(*)
          from ' || tablename
    INTO total;
    RETURN total;
END;
/

DECLARE
    c NUMBER(2);
BEGIN
    c := countrecords('customers');
    dbms_output.put_line('Total no. of Customers: ' || c);
END;
/