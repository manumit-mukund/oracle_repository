SELECT
    sysdate              AS "Current Date and Time",
    trunc(sysdate, 'IW') AS "Start of ISO Week"
FROM
    dual;
