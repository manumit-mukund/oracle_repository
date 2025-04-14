BEGIN
    FOR i IN 1, REPEAT i * 5 WHILE i < 1000 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;
/