show con_name;

ALTER SESSION SET container = pdb2;

show user;

CREATE BLOCKCHAIN TABLE bct_t1 (
    id           NUMBER,
    fruit        VARCHAR2(20),
    quantity     NUMBER,
    created_date DATE,
    CONSTRAINT bct_t1_pk PRIMARY KEY ( id )
)
no drop until 0 days idle
no delete until 16 days after insert
    hashing
    using
    "SHA2_512"
    version
        "v1";
        
        