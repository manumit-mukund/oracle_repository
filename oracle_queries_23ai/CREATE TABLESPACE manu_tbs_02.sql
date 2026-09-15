SELECT
    name
FROM
    v$datafile;

SELECT
    tablespace_name,
    status,
    contents
FROM
    user_tablespaces;

DROP TABLESPACE manu_tbs_freepdb1_02 INCLUDING CONTENTS CASCADE CONSTRAINTS;

CREATE TABLESPACE manu_tbs_freepdb1_02
    DATAFILE 'C:\APP\ADMIN\PRODUCT\23AI\ORADATA\FREE\manu_tbs_freepdb1_02.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 10M MAXSIZE 1000M;

SELECT
    name
FROM
    v$datafile;

SELECT
    tablespace_name,
    status,
    contents
FROM
    user_tablespaces;