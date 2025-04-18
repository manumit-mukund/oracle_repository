ALTER SESSION SET "_oracle_script" = true;

DROP USER manu_java_script_21c CASCADE;

CREATE USER manu_java_script_21c IDENTIFIED BY manu_java_script_21c
    QUOTA UNLIMITED ON users;

GRANT
    CREATE SESSION
TO manu_java_script_21c;

GRANT EXECUTE ON javascript TO manu_java_script_21c;

GRANT
    EXECUTE DYNAMIC MLE
TO manu_java_script_21c;

GRANT
    CREATE MLE
TO manu_java_script_21c;

GRANT
    CREATE PROCEDURE
TO manu_java_script_21c;

GRANT db_developer_role TO manu_java_script_21c;

show parameter multilingual_engine;