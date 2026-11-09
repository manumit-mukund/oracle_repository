SELECT
    level AS sequence_number
FROM
    dual
CONNECT BY
    level <= 5;

SELECT
    trunc(sysdate, 'IW') + ( level - 1 ) AS week_date
FROM
    dual
CONNECT BY
    level <= 7;