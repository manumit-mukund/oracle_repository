DROP TABLE test_json; --drop table if exists

CREATE TABLE test_json (
    id        NUMBER
        GENERATED ALWAYS AS IDENTITY,
    json_data json,
    CONSTRAINT pk_id PRIMARY KEY ( id )
);

DECLARE
    l_varchar2 VARCHAR2(500);
    l_clob     CLOB;
    l_blob     BLOB;
BEGIN
    l_varchar2 := '{"fruit":"mango","quantity":10}';
    l_clob := '{"fruit":"banana","quantity":11}';
    l_blob := utl_raw.cast_to_raw('{"fruit":"guava","quantity":12}');
    INSERT INTO test_json ( json_data ) VALUES (
        JSON(
            l_varchar2
        )
    );

    INSERT INTO test_json ( json_data ) VALUES (
        JSON(
            l_clob
        )
    );

    INSERT INTO test_json ( json_data ) VALUES (
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
    test_json;

SELECT
    id,
    JSON_SERIALIZE(json_data) AS json_data
FROM
    test_json;

column fruit format a10

SELECT
    a.id,
    JSON_VALUE(a.json_data, '$.fruit')                     AS fruit,
    JSON_VALUE(a.json_data, '$.quantity' RETURNING NUMBER) AS quantity
FROM
    test_json a
ORDER BY
    1;

column fruit format a10
column quantity format a10

SELECT
    a.id,
    JSON_QUERY(a.json_data, '$.fruit' RETURNING VARCHAR2)    AS fruit,
    JSON_QUERY(a.json_data, '$.quantity' RETURNING VARCHAR2) AS quantity
FROM
    test_json a
ORDER BY
    1;

SELECT
    a.id,
    jt.fruit,
    jt.quantity
FROM
    test_json a,
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
    test_json a
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
        test_json
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
        test_json
    WHERE
        id = 1;
  
  -- Create a JSON_OBJECT_T object and output the contents.
    l_obj := json_object_t(l_json);
    dbms_output.put_line('l_obj.stringify = ' || l_obj.stringify);

  -- Convert it back to JSON.
    l_json := l_obj.to_json;
    dbms_output.put_line('l_json = ' || JSON_SERIALIZE(l_json));
  
  -- Update the JSON column.
    UPDATE test_json
    SET
        json_data = l_json
    WHERE
        id = 1;

END;
/