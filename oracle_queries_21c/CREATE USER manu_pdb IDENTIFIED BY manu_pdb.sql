show pdbs;

show con_name;

show user;

CREATE USER manu_pdb IDENTIFIED BY "manu_pdb";

DEFAULT TABLESPACE USERS;
        
temporary
    tablespace
temp;

GRANT connect, resource TO manu_pdb;