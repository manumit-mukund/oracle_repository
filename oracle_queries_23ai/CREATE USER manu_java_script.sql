ALTER SESSION SET "_oracle_script" = true;

DROP USER manu_java_script CASCADE;

CREATE USER manu_java_script IDENTIFIED BY manu_java_script
    QUOTA UNLIMITED ON users;

GRANT
    CREATE SESSION
TO manu_java_script;

GRANT EXECUTE ON javascript TO manu_java_script;

GRANT
    EXECUTE DYNAMIC MLE
TO manu_java_script;

GRANT
    CREATE MLE
TO manu_java_script;

GRANT
    CREATE PROCEDURE
TO manu_java_script;

GRANT db_developer_role TO manu_java_script;

show parameter multilingual_engine;