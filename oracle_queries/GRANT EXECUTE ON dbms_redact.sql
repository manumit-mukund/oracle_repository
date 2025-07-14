ALTER SESSION SET CONTAINER = pdb2;

GRANT SELECT ON sys.redaction_policies TO manu_pdb;

GRANT SELECT ON sys.redaction_columns TO manu_pdb;

GRANT EXECUTE ON sys.dbms_redact TO manu_pdb;

COMMIT;