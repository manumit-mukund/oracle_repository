SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION hello_world RETURN VARCHAR IS
    mytext VARCHAR2(20) := 'Hello world!';
BEGIN
    RETURN mytext;
END;

COMMIT;

SELECT
    hello_world();