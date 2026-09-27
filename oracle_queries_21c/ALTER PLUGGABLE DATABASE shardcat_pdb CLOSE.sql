-- con_SYS_21c

ALTER PLUGGABLE DATABASE shardcat_pdb CLOSE;

ALTER PLUGGABLE DATABASE shardcat_pdb UNPLUG INTO 'C:\Users\admin\Downloads\WINDOWS.X64_213000_db_home\oradata\shardcat_pdb.xml';

DROP PLUGGABLE DATABASE shardcat_pdb;