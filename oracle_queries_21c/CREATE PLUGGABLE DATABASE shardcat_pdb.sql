-- con_SYS_21c

CREATE PLUGGABLE DATABASE shardcat_pdb
    ADMIN USER sysdba IDENTIFIED BY pdb2 CREATE_FILE_DEST = 'C:\Users\admin\Downloads\WINDOWS.X64_213000_db_home\oradata';

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
    DATAFILE 'C:\Users\admin\Downloads\WINDOWS.X64_213000_db_home\oradata\sharding_catalog_data.DBF' SIZE 500M REUSE
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
    
    ALTER SESSION SET CONTAINER=CDB$ROOT;

    
    ALTER USER GSMCATUSER IDENTIFIED BY "GSMCATUSER";
      
-- Coomand prompt

  sqlplus shard_admin / shard_admin@localhost : 1521 / shardcat_pdb
  
  
  add gsm -gsm gsm1 -catalog 127.0.0.1:1521:shardcat_pdb
        
-- Coomand prompt

