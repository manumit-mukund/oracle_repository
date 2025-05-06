-- Single Expression Iteration
-- In its most basic form a single expression iteration is pretty useless, as it gives a single iteration.

BEGIN
    FOR i IN 2 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;
/