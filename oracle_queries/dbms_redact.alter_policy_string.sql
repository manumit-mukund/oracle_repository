-- run using con_SYS_21c: 

--GRANT
--    CREATE SESSION,
--    CREATE TABLE
--TO manu_pdb;
--
--GRANT EXECUTE ON sys.dbms_redact TO manu_pdb;

-- run using con_SYS_21c: 

BEGIN
    dbms_redact.alter_policy(
        object_schema       => user,
        object_name         => 'payment_details',
        policy_name         => 'redact_card_info',
        action              => dbms_redact.add_column,
        column_name         => 'card_string',
        function_type       => dbms_redact.partial,
        function_parameters => 'vvvvfvvvvfvvvvfvvvv,vvvv-vvvv-vvvv-vvvv,#,1,12'
    );
END;
/

ALTER SESSION SET nls_date_format = 'dd-mon-yyyy';

column card_no format 9999999999999999

SELECT
    *
FROM
    payment_details
ORDER BY
    id;