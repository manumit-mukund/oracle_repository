SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE procOneINOUTParameter (
    genericparam IN OUT VARCHAR2
) IS
BEGIN
    genericparam := 'Hello ' || genericparam;
END;
/

DECLARE
    genericparam VARCHAR2(100) := 'Manu';
BEGIN
    procOneINOUTParameter(genericparam);
    dbms_output.put_line(genericparam);
END;
/