ALTER SESSION SET "_oracle_script" = true;

DROP USER manu_java_script_23ai_freepd1 CASCADE;

CREATE USER manu_java_script_23ai_freepd1 IDENTIFIED BY manu_java_script_23ai_freepd1
    QUOTA UNLIMITED ON users;

GRANT
    CREATE SESSION
TO manu_java_script_23ai_freepd1;

GRANT EXECUTE ON javascript TO manu_java_script_23ai_freepd1;

GRANT
    EXECUTE DYNAMIC MLE
TO manu_java_script_23ai_freepd1;

GRANT
    CREATE MLE
TO manu_java_script_23ai_freepd1;

GRANT
    CREATE PROCEDURE
TO manu_java_script_23ai_freepd1;

GRANT db_developer_role TO manu_java_script_23ai_freepd1;

show parameter multilingual_engine;