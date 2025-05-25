-- Create Customers table
CREATE TABLE customers (
    customer_id  NUMBER(10) PRIMARY KEY,
    first_name   VARCHAR2(255) NOT NULL,
    last_name    VARCHAR2(255) NOT NULL,
    email        VARCHAR2(255) UNIQUE NOT NULL,
    phone_number VARCHAR2(20)
);

-- Create Orders table
CREATE TABLE orders (
    order_id     NUMBER(10) PRIMARY KEY,
    customer_id  NUMBER(10) NOT NULL,
    order_date   DATE NOT NULL,
    total_amount NUMBER(10, 2) NOT NULL,
    FOREIGN KEY ( customer_id )
        REFERENCES customers ( customer_id )
);

-- Insert some sample data into Customers
INSERT INTO customers (
    customer_id,
    first_name,
    last_name,
    email,
    phone_number
) VALUES ( 1,
           'John',
           'Doe',
           'john.doe@example.com',
           '555-123-4567' );

INSERT INTO customers (
    customer_id,
    first_name,
    last_name,
    email,
    phone_number
) VALUES ( 2,
           'Jane',
           'Smith',
           'jane.smith@example.com',
           '555-987-6543' );

INSERT INTO customers (
    customer_id,
    first_name,
    last_name,
    email,
    phone_number
) VALUES ( 3,
           'Robert',
           'Jones',
           'robert.jones@example.com',
           '555-555-1212' );

-- Insert some sample data into Orders
INSERT INTO orders (
    order_id,
    customer_id,
    order_date,
    total_amount
) VALUES ( 1,
           1,
           sysdate,
           50.00 );

INSERT INTO orders (
    order_id,
    customer_id,
    order_date,
    total_amount
) VALUES ( 2,
           2,
           sysdate,
           100.00 );

INSERT INTO orders (
    order_id,
    customer_id,
    order_date,
    total_amount
) VALUES ( 3,
           1,
           sysdate,
           75.00 );

INSERT INTO orders (
    order_id,
    customer_id,
    order_date,
    total_amount
) VALUES ( 4,
           3,
           sysdate,
           25.00 );