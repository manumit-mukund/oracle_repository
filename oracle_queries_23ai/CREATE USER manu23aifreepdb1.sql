SELECT
    tablespace_name,
    status,
    contents
FROM
    user_tablespaces;

DROP USER manu23aifreepdb1;

CREATE USER manu23aifreepdb1 IDENTIFIED BY manu23aifreepdb1
    DEFAULT TABLESPACE manu_tbs_freepdb1_01
    QUOTA UNLIMITED ON manu_tbs_freepdb1_01;

GRANT connect TO manu23aifreepdb1;

GRANT connect, resource, dba TO manu23aifreepdb1;