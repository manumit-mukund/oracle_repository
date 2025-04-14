CREATE TABLE line_items (
    id        NUMBER,
    name      VARCHAR2(30),
    item_type VARCHAR2(30),
    price     FLOAT
);

INSERT INTO line_items VALUES ( 1,
                                'Red Red Wine',
                                'ALCOHOL',
                                15.6 );

INSERT INTO line_items VALUES ( 2,
                                'Its Cold Out There Heater',
                                'RADIATOR',
                                200.49 );

INSERT INTO line_items VALUES ( 3,
                                'How Sweet It Is Cake',
                                'FOOD',
                                4.56 );

COMMIT;

SELECT
    *
FROM
    line_items;

SELECT
    id,
    CASE
        WHEN item_type = 'ALCOHOL'     THEN
            round(1.2 * price, 2)
        WHEN item_type = 'SOLAR PANEL' THEN
            round(1.05 * price, 2)
        WHEN item_type = 'RADIATOR'    THEN
            round(1.05 * price, 2)
        ELSE
            price
    END AS total_price_with_tax
FROM
    line_items;

CREATE OR REPLACE FUNCTION total_price_with_tax (
    the_price     FLOAT,
    the_item_type VARCHAR2
) RETURN VARCHAR2 SQL_MACRO ( scalar ) IS
BEGIN
    RETURN q'[CASE
    WHEN the_item_type = 'ALCOHOL'     THEN ROUND(1.2 * the_price, 2)
    WHEN the_item_type = 'SOLAR PANEL' THEN ROUND(1.05 * the_price, 2)
    WHEN the_item_type = 'RADIATOR'    THEN ROUND(1.05 * the_price, 2)
    ELSE the_price END]';
END;
/

SELECT
    id,
    total_price_with_tax(price, item_type) AS total_price_with_tax
FROM
    line_items;