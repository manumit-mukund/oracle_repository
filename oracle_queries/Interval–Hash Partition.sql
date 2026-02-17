DROP TABLE transactions;

CREATE TABLE transactions (
    txn_id           NUMBER,
    customer_id      NUMBER,
    transaction_date DATE,
    amount           NUMBER
)
    PARTITION BY RANGE ( transaction_date ) INTERVAL ( numtoyminterval(1, 'MONTH') )
        SUBPARTITION BY HASH ( customer_id ) SUBPARTITIONS 4
    ( PARTITION p_before_2025
        VALUES LESS THAN ( DATE '2025-01-01' )
    );

INSERT INTO transactions VALUES ( 1,
                                  101,
                                  DATE '2024-12-15',
                                  500 );

INSERT INTO transactions VALUES ( 2,
                                  102,
                                  DATE '2025-01-10',
                                  600 );

INSERT INTO transactions VALUES ( 3,
                                  103,
                                  DATE '2025-02-05',
                                  700 );

INSERT INTO transactions VALUES ( 4,
                                  101,
                                  DATE '2025-02-20',
                                  800 );

INSERT INTO transactions VALUES ( 5,
                                  104,
                                  DATE '2025-03-12',
                                  900 );

COMMIT;

SELECT
    partition_name,
    high_value
FROM
    user_tab_partitions
WHERE
    table_name = 'TRANSACTIONS';

SELECT
    partition_name,
    subpartition_name
FROM
    user_tab_subpartitions
WHERE
    table_name = 'TRANSACTIONS';

SELECT
    *
FROM
    transactions
WHERE
    transaction_date BETWEEN DATE '2025-02-01' AND DATE '2025-02-28';

SELECT
    *
FROM
    transactions PARTITION ( p_before_2025 );