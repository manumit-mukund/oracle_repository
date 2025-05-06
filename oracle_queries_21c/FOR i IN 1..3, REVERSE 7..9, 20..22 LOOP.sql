-- Multiple Iterations

BEGIN
    FOR i IN 1..3, REVERSE 7..9, 20..22 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;
/