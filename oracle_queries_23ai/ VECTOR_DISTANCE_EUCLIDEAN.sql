SELECT
    TO_NUMBER(vector_distance(
        vector('[5, 0]'),
        vector('[0, 12]'),
        euclidean
    )) AS distance
FROM
    dual;