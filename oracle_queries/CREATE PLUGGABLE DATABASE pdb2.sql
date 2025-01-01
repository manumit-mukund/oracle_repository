CREATE PLUGGABLE DATABASE pdb2 ADMIN USER pdb_adm IDENTIFIED BY password1 
CREATE_FILE_DEST = 'C:\Users\admin\Downloads\WINDOWS.X64_213000_db_home\oradata';

ALTER PLUGGABLE DATABASE pdb2 OPEN READ WRITE;

COLUMN pdb_name FORMAT A20

SELECT
    pdb_name,
    status
FROM
    dba_pdbs
ORDER BY
    pdb_name;
    

COLUMN name FORMAT A20

SELECT
    name,
    open_mode
FROM
    v$pdbs
ORDER BY
    name;

SHOW PDBS;

