-- By default, fractional boundaries get rounded to keep the loop variable as an integer. 
-- This is true of prior releases also.

BEGIN
    FOR i IN 1.2..2.2 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;
/


-- Oracle database 21c allows us to define fractional loop variables by explicitly typing the iterand, 
-- but the step is still an increment or decrement or 1 by default.

BEGIN
    FOR i NUMBER(5, 1) IN 1.2..2.2 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;
/