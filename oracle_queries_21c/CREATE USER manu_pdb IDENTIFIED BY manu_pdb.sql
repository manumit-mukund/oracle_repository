----------------------------------------Use con_SYS_PDB start---------------------------------------

show pdbs;

show con_name;

show user;

CREATE USER manu_pdb IDENTIFIED BY "manu_pdb";

DEFAULT TABLESPACE USERS;
        
GRANT connect, resource TO manu_pdb;

----------------------------------------Use con_SYS_PDB end---------------------------------------