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
        object_schema       => 'manu_pdb',
        object_name         => 'payment_details',
        policy_name         => 'redact_card_info',
        action              => dbms_redact.modify_column,
        column_name         => 'card_no',
        function_type       => dbms_redact.partial,
        function_parameters => '1,1,12'
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