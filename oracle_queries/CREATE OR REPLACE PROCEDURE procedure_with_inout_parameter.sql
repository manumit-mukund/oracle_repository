SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE procedure_with_inout_parameter (
    var_in_out IN OUT VARCHAR2
) IS
BEGIN
    var_in_out := 'Hello ' || var_in_out;
END;
/

DECLARE
    var_in_out VARCHAR2(100) := 'Manu';
BEGIN
    dbms_output.put_line(var_in_out);
    procedure_with_inout_parameter(var_in_out);
    dbms_output.put_line(var_in_out);
END;
/