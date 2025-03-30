SELECT
    tablespace_name,
    status,
    contents
FROM
    user_tablespaces;

DROP USER manu23ai;

CREATE USER manu23ai IDENTIFIED BY manu_23ai
    DEFAULT TABLESPACE manu_tbs_02
    QUOTA UNLIMITED ON manu_tbs_02;

GRANT connect TO manu23ai;

GRANT connect, resource, dba TO manu23ai;