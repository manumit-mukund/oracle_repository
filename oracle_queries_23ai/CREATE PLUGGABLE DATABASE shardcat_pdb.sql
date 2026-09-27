-- con_SYS_21c

ALTER PLUGGABLE DATABASE shardcat_pdb CLOSE;

ALTER PLUGGABLE DATABASE shardcat_pdb UNPLUG INTO 'C:\Users\admin\Downloads\WINDOWS.X64_213000_db_home\pdb2.xml';

DROP PLUGGABLE DATABASE shardcat_pdb;

CREATE PLUGGABLE DATABASE shardcat_pdb
    ADMIN USER sysdba IDENTIFIED BY pdb2 CREATE_FILE_DEST = 'C:\APP\ADMIN\PRODUCT\23AI\ORADATA\FREE';

ALTER PLUGGABLE DATABASE shardcat_pdb OPEN;

ALTER SESSION SET CONTAINER = shardcat_pdb;
-- Verify SPFILE is in use
SHOW PARAMETER spfile;

CREATE TABLESPACE sharding_catalog_data
    DATAFILE 'C:\APP\ADMIN\PRODUCT\23AI\ORADATA\FREE\catalog_data01.dbf' SIZE 500M
    AUTOEXTEND ON NEXT 100M;

CREATE USER shard_admin IDENTIFIED BY your_admin_password
    DEFAULT TABLESPACE sharding_catalog_data
    QUOTA UNLIMITED ON sharding_catalog_data;

GRANT dba TO shard_admin;

GRANT EXECUTE ON sys.dbms_aqadm TO shard_admin;

EXEC DBMS_GSM_ROUTING.ADD_CATALOG('shardcat_pdb', 'shard_admin', 'primary', 'localhost:1522/shardcat_service');