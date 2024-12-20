-- PLSQL_OPTIMIZE_LEVEL = 2;
PLSQL_OPTIMIZE_LEVEL = 0;

declare
    v_result varchar2(4000);

    procedure test_procedure(p_result in out varchar2) is
    begin
        p_result := '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789';
    end;

    function test_function return varchar2 is
    begin
        return '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789';
    end;
begin
FOR i IN 1..10000000 LOOP
        --Comment out one of these lines to change the test.
    test_procedure(v_result);
         -- v_result := test_function;
END LOOP;

end;
/