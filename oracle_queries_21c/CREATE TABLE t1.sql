DROP TABLE t1;

CREATE TABLE t1 (
    id        NUMBER
        GENERATED ALWAYS AS IDENTITY,
    json_data json,
    CONSTRAINT ta_pk PRIMARY KEY ( id )
);

DECLARE
    l_varchar2 VARCHAR2(32767);
    l_clob     CLOB;
    l_blob     BLOB;
BEGIN
    l_varchar2 := '{"fruit":"apple","quantity":10}';
    l_clob := '{"fruit":"orange","quantity":20}';
    l_blob := utl_raw.cast_to_raw('{"fruit":"banana","quantity":30}');
    INSERT INTO t1 ( json_data ) VALUES (
        JSON(
            l_varchar2
        )
    );

    INSERT INTO t1 ( json_data ) VALUES (
        JSON(
            l_clob
        )
    );

    INSERT INTO t1 ( json_data ) VALUES (
        JSON(
            l_blob
        )
    );

    COMMIT;
END;
/

SELECT
    *
FROM
    t1;

SELECT
    id,
    JSON_SERIALIZE(json_data) AS json_data
FROM
    t1;

column fruit format a10

SELECT
    a.id,
    JSON_VALUE(a.json_data, '$.fruit')                     AS fruit,
    JSON_VALUE(a.json_data, '$.quantity' RETURNING NUMBER) AS quantity
FROM
    t1 a
ORDER BY
    1;

column fruit format a10
column quantity format a10

SELECT
    a.id,
    JSON_QUERY(a.json_data, '$.fruit' RETURNING VARCHAR2)    AS fruit,
    JSON_QUERY(a.json_data, '$.quantity' RETURNING VARCHAR2) AS quantity
FROM
    t1 a
ORDER BY
    1;

SELECT
    a.id,
    jt.fruit,
    jt.quantity
FROM
    t1 a,
    JSON_TABLE ( a.json_data, '$'
            COLUMNS (
                fruit VARCHAR2 ( 10 CHAR ) PATH '$.fruit',
                quantity NUMBER PATH '$.quantity'
            )
        )
    jt;

SELECT
    a.id,
    JSON_SERIALIZE(a.json_data.fruit)    AS fruit,
    JSON_SERIALIZE(a.json_data.quantity) AS quantity
FROM
    t1 a
ORDER BY
    1;

set serveroutput on

DECLARE
    l_json json;
    l_obj  json_object_t;
BEGIN
  -- Get the JSON data.
    SELECT
        json_data
    INTO l_json
    FROM
        t1
    WHERE
        id = 1;
  
  -- Create a JSON_OBJECT_T object and output the contents.
    l_obj := json_object_t(l_json);
    dbms_output.put_line('l_obj.stringify = ' || l_obj.stringify);
END;
/

set serveroutput on

DECLARE
    l_json json;
    l_obj  json_object_t;
BEGIN
  -- Get the JSON data.
    SELECT
        json_data
    INTO l_json
    FROM
        t1
    WHERE
        id = 1;
  
  -- Create a JSON_OBJECT_T object and output the contents.
    l_obj := json_object_t(l_json);
    dbms_output.put_line('l_obj.stringify = ' || l_obj.stringify);

  -- Convert it back to JSON.
    l_json := l_obj.to_json;
    dbms_output.put_line('l_json = ' || JSON_SERIALIZE(l_json));
  
  -- Update the JSON column.
    UPDATE t1
    SET
        json_data = l_json
    WHERE
        id = 1;

END;
/