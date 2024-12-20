SET SERVEROUTPUT ON

DECLARE
    a NUMBER;
    b NUMBER;
    c NUMBER;

FUNCTION findMaxOfTwo (
        x IN NUMBER,
        y IN NUMBER
    ) RETURN NUMBER IS
        z NUMBER;
    BEGIN
        IF x > y THEN
            z := x;
        ELSE
            z := y;
        END IF;

        RETURN z;
    END;

BEGIN

c := findMaxOfTwo(13, 25);

dbms_output.put_line(' Maximum of (13,25): ' || c);

end;
/