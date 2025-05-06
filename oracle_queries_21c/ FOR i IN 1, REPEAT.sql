-- Where it becomes interesting is when we add the REPEAT clause. 
-- The upper limit on the iteration is defined by the WHILE clause. 
-- In the following example each iteration increases the loop variable by multiplying the previous value by 5.

BEGIN
    FOR i IN 1, REPEAT i * 5 WHILE i < 1000 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;
/