SELECT
    TO_NUMBER(vector_distance(
        vector('[3, 0]'),
        vector('[0, 4]'),
        euclidean
    )) AS distance
FROM
    dual;