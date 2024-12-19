SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE proconeinoutparameter (
    genericparam IN OUT VARCHAR2
) IS
BEGIN
    genericparam := 'Hello ' || genericparam;
END;
/

DECLARE
    genericparam VARCHAR2(100) := 'Manu';
BEGIN
    dbms_output.put_line(genericparam);
    proconeinoutparameter(genericparam);
    dbms_output.put_line(genericparam);
END;
/