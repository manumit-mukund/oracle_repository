set serveroutput on

--Prior to Oracle database 21c
BEGIN
    FOR i IN 1..5 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;
/


--From Oracle database 21c
BEGIN
    FOR i IN REVERSE 1..5 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;
/