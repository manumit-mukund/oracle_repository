CREATE TABLE items (
    itemno   NUMBER(5)
        CONSTRAINT items_pk PRIMARY KEY,
    itemname VARCHAR2(20),
    rate     NUMBER(8, 2)
        CONSTRAINT items_rate_chk CHECK ( rate >= 0 ),
    taxrate  NUMBER(4, 2) DEFAULT 0
        CONSTRAINT items_taxrate_chk CHECK ( taxrate >= 0 )
);

INSERT INTO items VALUES (
    1,
    'Samsung 14" monitor',
    7000,
    10.5
);

INSERT INTO items VALUES (
    2,
    'TVS Gold Keyboard',
    1000,
    10
);

INSERT INTO items VALUES (
    3,
    'Segate HDD 20GB',
    6500,
    12.5
);

INSERT INTO items VALUES (
    4,
    'PIII processor',
    8000,
    8
);

INSERT INTO items VALUES (
    5,
    'Logitech Mouse',
    500,
    5
);

INSERT INTO items VALUES (
    6,
    'Creative MMK',
    4500,
    11.5
);

CREATE TABLE customers (
    custno   NUMBER(5)
        CONSTRAINT customers_pk PRIMARY KEY,
    custname VARCHAR2(20)
        CONSTRAINT customers_custname_nn NOT NULL,
    address1 VARCHAR2(50),
    address2 VARCHAR2(50),
    city     VARCHAR2(30),
    state    VARCHAR2(30),
    pin      VARCHAR2(10),
    phone    VARCHAR2(30)
);

INSERT INTO customers VALUES (
    101,
    'Raul',
    '12-22-29',
    'Dwarakanagar',
    'Vizag',
    'AP',
    '530016',
    '453343,634333'
);

INSERT INTO customers VALUES (
    102,
    'Denilson',
    '43-22-22',
    'CBM Compound',
    'Vizag',
    'AP',
    '530012',
    '744545'
);

INSERT INTO customers VALUES (
    103,
    'Mendiator',
    '45-45-52',
    'Abid Nagar',
    'Vizag',
    'AP',
    '530016',
    '567434'
);

INSERT INTO customers VALUES (
    104,
    'Figo',
    '33-34-56',
    'Muralinagar',
    'Vizag',
    'AP',
    '530021',
    '875655,876563,872222'
);

INSERT INTO customers VALUES (
    105,
    'Zidane',
    '23-22-56',
    'LB Colony',
    'Vizag',
    'AP',
    '530013',
    '765533'
);

CREATE TABLE orders (
    ordno    NUMBER(5)
        CONSTRAINT orders_pk PRIMARY KEY,
    orddate  DATE,
    shipdate DATE,
    custno   NUMBER(5)
        CONSTRAINT orders_custno_pk
            REFERENCES customers,
    address1 VARCHAR2(50),
    address2 VARCHAR2(50),
    city     VARCHAR2(30),
    state    VARCHAR2(30),
    pin      VARCHAR2(10),
    phone    VARCHAR2(30),
    CONSTRAINT order_dates_chk CHECK ( orddate <= shipdate )
);

INSERT INTO orders VALUES (
    1001,
    '15-May-2001',
    '10-jun-2001',
    102,
    '43-22-22',
    'CBM Compound',
    'Vizag',
    'AP',
    '530012',
    '744545'
);

INSERT INTO orders VALUES (
    1002,
    '15-May-2001',
    '5-jun-2001',
    101,
    '12-22-29',
    'Dwarakanagar',
    'Vizag',
    'AP',
    '530016',
    '453343,634333'
);

INSERT INTO orders VALUES (
    1003,
    '17-May-2001',
    '7-jun-2001',
    101,
    '12-22-29',
    'Dwarakanagar',
    'Vizag',
    'AP',
    '530016',
    '453343,634333'
);

INSERT INTO orders VALUES (
    1004,
    '18-May-2001',
    '17-jun-2001',
    103,
    '45-45-52',
    'Abid Nagar',
    'Vizag',
    'AP',
    '530016',
    '567434'
);

INSERT INTO orders VALUES (
    1005,
    '20-May-2001',
    '3-jun-2001',
    104,
    '33-34-56',
    'Muralinagar',
    'Vizag',
    'AP',
    '530021',
    '875655,876563,872222'
);

INSERT INTO orders VALUES (
    1006,
    '23-May-2001',
    '11-jun-2001',
    104,
    '54-22-12',
    'MVP Colony',
    'Vizag',
    'AP',
    '530024',
    NULL
);

CREATE TABLE lineitems (
    ordno   NUMBER(5)
        CONSTRAINT lineitems_ordno_fk
            REFERENCES orders,
    itemno  NUMBER(5)
        CONSTRAINT lineitems_itemno_fk
            REFERENCES items,
    qty     NUMBER(3)
        CONSTRAINT lineitems_qty_chk CHECK ( qty >= 1 ),
    price   NUMBER(8, 2),
    disrate NUMBER(4, 2) DEFAULT 0
        CONSTRAINT lineitems_disrate_chk CHECK ( disrate >= 0 ),
    CONSTRAINT lineitems_pk PRIMARY KEY ( ordno,
                                          itemno )
);

INSERT INTO lineitems VALUES (
    1001,
    2,
    3,
    1000,
    10.0
);

INSERT INTO lineitems VALUES (
    1001,
    1,
    3,
    7000,
    15.0
);

INSERT INTO lineitems VALUES (
    1001,
    4,
    2,
    8000,
    10.0
);

INSERT INTO lineitems VALUES (
    1001,
    6,
    1,
    4500,
    10.0
);

INSERT INTO lineitems VALUES (
    1002,
    6,
    4,
    4500,
    20.0
);

INSERT INTO lineitems VALUES (
    1002,
    4,
    2,
    8000,
    15.0
);

INSERT INTO lineitems VALUES (
    1002,
    5,
    2,
    600,
    10.0
);

INSERT INTO lineitems VALUES (
    1003,
    5,
    10,
    500,
    0.0
);

INSERT INTO lineitems VALUES (
    1003,
    6,
    2,
    4750,
    5.0
);

INSERT INTO lineitems VALUES (
    1004,
    1,
    1,
    7000,
    10.0
);

INSERT INTO lineitems VALUES (
    1004,
    3,
    2,
    6500,
    10.0
);

INSERT INTO lineitems VALUES (
    1004,
    4,
    1,
    8000,
    20.0
);

INSERT INTO lineitems VALUES (
    1005,
    6,
    1,
    4600,
    10.0
);

INSERT INTO lineitems VALUES (
    1005,
    2,
    2,
    900,
    10.0
);

INSERT INTO lineitems VALUES (
    1006,
    2,
    10,
    950,
    20.0
);

INSERT INTO lineitems VALUES (
    1006,
    4,
    5,
    7800,
    10.0
);

INSERT INTO lineitems VALUES (
    1006,
    3,
    5,
    6600,
    15.0
);

SELECT
    *
FROM
    items;

SELECT
    *
FROM
    customers;

SELECT
    *
FROM
    orders;

SELECT
    *
FROM
    lineitems
ORDER BY
    ordno,
    itemno;