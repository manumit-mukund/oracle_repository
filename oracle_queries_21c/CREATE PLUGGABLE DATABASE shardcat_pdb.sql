-- con_SYS_21c

CREATE PLUGGABLE DATABASE shardcat_pdb
    ADMIN USER sysdba IDENTIFIED BY pdb2 CREATE_FILE_DEST = 'E:\Oracle Tablespace Files';

ALTER PLUGGABLE DATABASE shardcat_pdb OPEN READ WRITE;

ALTER SYSTEM REGISTER;

SELECT
    pdb_name,
    status
FROM
    dba_pdbs
ORDER BY
    pdb_name;

ALTER SESSION SET CONTAINER = shardcat_pdb;

-- Verify SPFILE is in use
SHOW PARAMETER spfile;

SHOW PARAMETER DB_CREATE_FILE_DEST;

CREATE TABLESPACE sharding_catalog_data
    DATAFILE 'E:\Oracle Tablespace Files\sharding_catalog_data.DBF' SIZE 500M REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;

CREATE USER shard_admin IDENTIFIED BY shard_admin
    DEFAULT TABLESPACE sharding_catalog_data
    QUOTA UNLIMITED ON sharding_catalog_data;

GRANT dba TO shard_admin;

SELECT
    instance_name,
    status
FROM
    v$instance;

show parameter db_unique_name;

SELECT
    name
FROM
    v$services;

SELECT
    name
FROM
    v$services
WHERE
    lower(name) LIKE '%shardcat_pdb%';

ALTER SESSION SET CONTAINER = cdb$root;

ALTER USER gsmadmin_internal ACCOUNT UNLOCK IDENTIFIED BY gsmadmin_internal;

ALTER USER gsmcatuser IDENTIFIED BY gsmcatuser;
      
-- Coomand prompt

SET ORACLE_SID=SCAT

  sqlplus shard_admin / shard_admin@ localhost :1521 / shardcat_pdb add gsm - gsm gsm1 - catalog 127.0.0.1 :1521 :shardcat_pdb
        
-- Coomand prompt

EXEC DBMS_GSM_ROUTING.ADD_SHARD('shard1', 'shard_group1', 'host1:1521/shard1_svc');

