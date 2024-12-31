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