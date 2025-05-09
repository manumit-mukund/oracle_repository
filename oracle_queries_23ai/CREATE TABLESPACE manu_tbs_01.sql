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

DROP TABLESPACE manu_tbs_01 INCLUDING CONTENTS CASCADE CONSTRAINTS;

CREATE TABLESPACE manu_tbs_01
    DATAFILE 'C:\APP\ADMIN\PRODUCT\23AI\ORADATA\FREE\MANU_TBS_01.DBF' SIZE 50M REUSE
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