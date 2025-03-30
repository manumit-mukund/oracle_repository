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

DROP TABLESPACE manu_tbs_02 INCLUDING CONTENTS CASCADE CONSTRAINTS;

CREATE TABLESPACE manu_tbs_02
    DATAFILE 'C:\APP\ADMIN\PRODUCT\23AI\ORADATA\FREE\FREEPDB1\MANU_TBS_02.DBF' SIZE 50M REUSE
    AUTOEXTEND ON NEXT 10M MAXSIZE 100M;

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