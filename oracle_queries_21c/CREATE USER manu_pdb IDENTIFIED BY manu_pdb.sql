----------------------------------------connect to SYS of PDB2 (coonection name on my machine: con_SYS_PDB_21c)---------------------------------------

show pdbs;

show con_name;

show user;

DROP USER manu_pdb; -- if already exists

CREATE USER manu_pdb IDENTIFIED BY "manu_pdb";

DEFAULT TABLESPACE
users;

GRANT connect,
      resource TO manu_pdb;

GRANT
    UNLIMITED TABLESPACE
TO manu_pdb;

GRANT
    RESTRICTED SESSION
TO manu_pdb;

----------------------------------------connect to SYS of PDB2 (coonection name on my machine: con_SYS_PDB_21c)--------------------------------------