-- run using con_SYS_21c: 

-- ALTER SESSION SET CONTAINER = pdb2;

-- GRANT SELECT ON sys.redaction_policies TO manu_pdb;

-- GRANT SELECT ON sys.redaction_columns TO manu_pdb;

-- GRANT EXECUTE ON dbms_redact TO manu_pdb;

-- run using con_SYS_21c: 

DROP TABLE payment_details PURGE;

CREATE TABLE payment_details (
    id          NUMBER NOT NULL,
    customer_id NUMBER NOT NULL,
    card_no     NUMBER NOT NULL,
    card_string VARCHAR2(19) NOT NULL,
    expiry_date DATE NOT NULL,
    sec_code    NUMBER NOT NULL,
    valid_date  DATE,
    CONSTRAINT payment_details_pk PRIMARY KEY ( id )
);

INSERT INTO payment_details VALUES ( 1,
                                     4000,
                                     1234123412341234,
                                     '1234-1234-1234-1234',
                                     trunc(add_months(sysdate, 12)),
                                     123,
                                     NULL );

INSERT INTO payment_details VALUES ( 2,
                                     4001,
                                     2345234523452345,
                                     '2345-2345-2345-2345',
                                     trunc(add_months(sysdate, 12)),
                                     234,
                                     NULL );

INSERT INTO payment_details VALUES ( 3,
                                     4002,
                                     3456345634563456,
                                     '3456-3456-3456-3456',
                                     trunc(add_months(sysdate, 12)),
                                     345,
                                     NULL );

INSERT INTO payment_details VALUES ( 4,
                                     4003,
                                     4567456745674567,
                                     '4567-4567-4567-4567',
                                     trunc(add_months(sysdate, 12)),
                                     456,
                                     NULL );

INSERT INTO payment_details VALUES ( 5,
                                     4004,
                                     5678567856785678,
                                     '5678-5678-5678-5678',
                                     trunc(add_months(sysdate, 12)),
                                     567,
                                     NULL );

COMMIT;

ALTER SESSION SET nls_date_format = 'dd-mon-yyyy';

column card_no format 9999999999999999

SELECT
    *
FROM
    payment_details
ORDER BY
    id;

BEGIN
    dbms_redact.add_policy(
        object_schema => 'manu_pdb',
        object_name   => 'payment_details',
        column_name   => 'card_no',
        policy_name   => 'redact_card_info',
        function_type => dbms_redact.full,
        expression    => '1= 1 '
    );
END;
/

ALTER SESSION SET nls_date_format = ' dd - mon - yyyy ';

column card_no format 9999999999999999

SELECT
    *
FROM
    payment_details
ORDER BY
    id;