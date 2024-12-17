SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE procOUTParameter (
    outparam1 OUT VARCHAR2
) IS
BEGIN
    outparam1 := 'Hello World OUT parameter';
END;
/

DECLARE
    outparam1 VARCHAR2(100);
BEGIN
    procOUTParameter(outparam1);
    dbms_output.put_line(outparam1);
END;
/