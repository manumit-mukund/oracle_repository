DROP TABLE supplier_parts PURGE;

CREATE TABLE supplier_parts (
    supplier_id NUMBER,
    partnum     NUMBER,
    price       NUMBER
)
    PARTITION BY RANGE (
        supplier_id,
        partnum
    )
    ( PARTITION p1
        VALUES LESS THAN ( 10,
        100 ),
    PARTITION p2
        VALUES LESS THAN ( 10,
        200 ),
    PARTITION p3
        VALUES LESS THAN (
            MAXVALUE,
            MAXVALUE
        )
    );

INSERT INTO supplier_parts VALUES ( 5,
                                    5,
                                    1000 );

INSERT INTO supplier_parts VALUES ( 5,
                                    150,
                                    1000 );

INSERT INTO supplier_parts VALUES ( 10,
                                    100,
                                    1000 );

SELECT
    *
FROM
    supplier_parts PARTITION ( p1 );

SELECT
    *
FROM
    supplier_parts PARTITION ( p2 );