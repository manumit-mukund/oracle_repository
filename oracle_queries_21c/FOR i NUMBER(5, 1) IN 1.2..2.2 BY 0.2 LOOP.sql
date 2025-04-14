BEGIN
    FOR i NUMBER(5, 1) IN 1.2..2.2 BY 0.2 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;
/