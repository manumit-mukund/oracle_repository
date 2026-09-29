-- con_SYS_21c

ALTER PLUGGABLE DATABASE shardcat_pdb CLOSE;

ALTER PLUGGABLE DATABASE shardcat_pdb UNPLUG INTO 'E:\Oracle Tablespace Files\shardcat_pdb.xml';

DROP PLUGGABLE DATABASE shardcat_pdb;