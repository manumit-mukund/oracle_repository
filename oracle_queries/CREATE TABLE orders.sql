CREATE TABLE orders (
    orderid INT,
    product VARCHAR(50),
    price   DECIMAL(10, 2)
);

INSERT INTO orders (
    orderid,
    product,
    price
) VALUES ( 1,
           'Laptop',
           1000.00 );

INSERT INTO orders (
    orderid,
    product,
    price
) VALUES ( 2,
           'Smartphone',
           500.00 );

INSERT INTO orders (
    orderid,
    product,
    price
) VALUES ( 3,
           'Tablet',
           300.00 );

SELECT
    SUM(price) AS total_sales
FROM
    orders;