CREATE TABLE customers (
    cust_id   NUMBER,
    order_dat DATE,
    order_amt NUMBER(5, 2)
);

BEGIN
    INSERT INTO customers VALUES (
        100,
        '20-Jan-2015',
        10
    );

    INSERT INTO customers VALUES (
        101,
        '21-Jan-2015',
        101
    );

    INSERT INTO customers VALUES (
        102,
        '22-Jan-2015',
        105
    );

    INSERT INTO customers VALUES (
        103,
        '22-Jan-2015',
        104
    );

    INSERT INTO customers VALUES (
        101,
        '24-Jan-2015',
        107
    );

    INSERT INTO customers VALUES (
        100,
        '25-Jan-2015',
        108
    );

    INSERT INTO customers VALUES (
        102,
        '26-Jan-2015',
        109
    );

    INSERT INTO customers VALUES (
        101,
        '27-Jan-2015',
        106
    );

    INSERT INTO customers VALUES (
        103,
        '28-Jan-2015',
        101
    );

END;