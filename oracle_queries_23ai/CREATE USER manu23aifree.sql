SELECT
    tablespace_name,
    status,
    contents
FROM
    user_tablespaces;

DROP USER c##manu23aifree;

CREATE USER c##manu23aifree IDENTIFIED BY c##manu23aifree
    DEFAULT TABLESPACE manu_tbs_free_01
    QUOTA UNLIMITED ON manu_tbs_free_01;

GRANT connect TO c##manu23aifree;

GRANT connect, resource, dba TO c##manu23aifree;