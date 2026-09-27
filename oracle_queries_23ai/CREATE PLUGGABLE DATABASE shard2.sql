-- con_SYS_23ai_free

CREATE PLUGGABLE DATABASE shard2
    ADMIN USER sysdba IDENTIFIED BY pdb2 CREATE_FILE_DEST = 'C:\app\admin\product\23ai\oradata\FREE';

ALTER PLUGGABLE DATABASE shard2 OPEN READ WRITE;

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