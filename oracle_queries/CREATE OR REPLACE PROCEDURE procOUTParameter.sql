SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE procoutparameter (
    outparam OUT VARCHAR2
) IS
BEGIN
    outparam := 'Hello World OUT parameter';
END;
/

DECLARE
    outparam1 VARCHAR2(100);
BEGIN
    procoutparameter(outparam1);
    dbms_output.put_line(outparam1);
END;
/