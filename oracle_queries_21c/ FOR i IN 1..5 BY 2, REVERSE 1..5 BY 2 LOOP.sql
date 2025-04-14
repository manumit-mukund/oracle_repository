BEGIN
    FOR i IN 1..5 BY 2, REVERSE 1..5 BY 2 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;
/