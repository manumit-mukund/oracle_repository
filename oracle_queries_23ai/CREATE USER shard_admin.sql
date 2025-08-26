CREATE USER shard_admin IDENTIFIED BY shard_admin;

GRANT
    CREATE SESSION,
    CREATE ANY TABLE,
    CREATE ANY INDEX,
    CREATE ANY PROCEDURE,
    CREATE ANY TRIGGER,
    CREATE ANY SEQUENCE,
    CREATE ANY VIEW,
    CREATE ANY MATERIALIZED VIEW,
    CREATE ANY SYNONYM,
    CREATE ANY PROCEDURE,
    CREATE ANY TRIGGER,
    CREATE ANY SEQUENCE,
    CREATE ANY VIEW,
    CREATE ANY MATERIALIZED VIEW,
    CREATE ANY SYNONYM
TO shard_admin;

GRANT gsmadmin_role TO shard_admin;
    -- Create a tablespace for sharded tables
CREATE TABLESPACE sharded_data
    DATAFILE 'E:\Oracle Tablespace Files\sharded_data01.dbf' SIZE 100M
    AUTOEXTEND ON NEXT 10M;
    
-- Using gdsctl (Global Data Services Control)
gdsctl add shard -shard shard1 -connect shard1_connect_string -region region1;
gdsctl add shard -shard shard2 -connect shard2_connect_string -region region2;

CREATE SHARDED TABLE Customers (
        CustID NUMBER,
    name   VARCHAR2(100),
    region VARCHAR2(50),
    CONSTRAINT pk_customers PRIMARY KEY ( custid )
)
    PARTITION BY CONSISTENT HASH (CustID)
    PARTITIONS AUTO
    TABLESPACE SET ts1;