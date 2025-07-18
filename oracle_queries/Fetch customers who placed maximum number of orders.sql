SELECT
    *
FROM
    customers
WHERE
    customer_id = (
        SELECT
            customer_id
        FROM
            orders
        GROUP BY
            customer_id
        HAVING
            COUNT(*) >= ALL (
                SELECT
                    COUNT(customer_id)
                FROM
                    orders
                GROUP BY
                    customer_id
            )
    );
