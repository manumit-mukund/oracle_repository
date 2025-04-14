BEGIN
    FOR i IN 1.2..2.2 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;
/

BEGIN
    FOR i NUMBER(5, 1) IN 1.2..2.2 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;
/