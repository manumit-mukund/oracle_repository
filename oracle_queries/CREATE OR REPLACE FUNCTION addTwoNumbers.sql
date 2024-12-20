SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION addTwoNumbers (
    n1 IN NUMBER,
    n2 IN NUMBER
) RETURN NUMBER IS
    n3 NUMBER(8);
BEGIN
    n3 := n1 + n2;
    RETURN n3;
END;
/

DECLARE
    n3 NUMBER(2);
BEGIN
    n3 := addTwoNumbers(11, 22);
    dbms_output.put_line('Addition is: ' || n3);
END;
/