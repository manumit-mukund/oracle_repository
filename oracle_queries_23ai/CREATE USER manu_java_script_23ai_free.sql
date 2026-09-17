ALTER SESSION SET "_oracle_script" = true;

DROP USER manu_java_script_23ai_free CASCADE;

CREATE USER manu_java_script_23ai_free IDENTIFIED BY manu_java_script_23ai_free
    QUOTA UNLIMITED ON users;

GRANT
    CREATE SESSION
TO manu_java_script_23ai_free;

GRANT EXECUTE ON javascript TO manu_java_script_23ai_free;

GRANT
    EXECUTE DYNAMIC MLE
TO manu_java_script_23ai_free;

GRANT
    CREATE MLE
TO manu_java_script_23ai_free;

GRANT
    CREATE PROCEDURE
TO manu_java_script_23ai_free;

GRANT db_developer_role TO manu_java_script_23ai_free;

show parameter multilingual_engine;