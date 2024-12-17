SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE procPrintHelloWorld IS
BEGIN
    dbms_output.put_line('Hello World!');
END;
/

exec procPrintHelloWorld;