CREATE BIGFILE TABLESPACE tbs_vector
    DATAFILE 'C:\APP\ADMIN\PRODUCT\23AI\ORADATA\FREE\FREEPDB1\tbs_vector.DBF' SIZE 256M
    AUTOEXTEND ON MAXSIZE 2G;

CREATE USER vector_user IDENTIFIED BY "Oracle_4U"
    DEFAULT TABLESPACE tbs_vector
    TEMPORARY TABLESPACE temp
    QUOTA UNLIMITED ON tbs_vector;

GRANT
    CREATE MINING MODEL
TO vector_user;

-- Grant the 23ai new DB_DEVELOPER_ROLE to the user
GRANT db_developer_role TO vector_user;

CREATE OR REPLACE DIRECTORY dm_dump AS '/home/oracle';

GRANT READ, WRITE ON DIRECTORY dm_dump TO vector_user;

GRANT ALL PRIVILEGES TO vector_user;