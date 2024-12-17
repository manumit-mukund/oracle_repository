SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE sayHello (
    param1 IN VARCHAR2
) IS
BEGIN
    dbms_output.put_line('Hello ' || param1);
END;
/

exec sayHello('Manu');