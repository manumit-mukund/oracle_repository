DROP TABLE ccnews_tmp;

CREATE TABLE IF NOT EXISTS ccnews_tmp (
    sentence VARCHAR2(4000)
)
ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER DEFAULT DIRECTORY dm_dump
                         ACCESS PARAMETERS
                           (RECORDS DELIMITED BY 0x'0A'
                            READSIZE 100000000
                            FIELDS (sentence CHAR(4000 ) ) )
    LOCATION ( dm_dump : 'C:\app\admin\product\23ai\admin\free\dpdump/696168A276CE4123B9217F9EB76F43DF\dataset_200K.txt' )
)
PARALLEL REJECT LIMIT
unlimited;

SELECT
    COUNT(*)
FROM
    ccnews_tmp;

SELECT
    *
FROM
    ccnews_tmp
WHERE
    ROWNUM < 4;

EXECUTE DBMS_VECTOR.LOAD_ONNX_MODEL('DM_DUMP','all-MiniLM-L6-v2.onnx','doc_model');

col model_name format a12
col mining_function format a12
col algorithm format a12
col attribute_name format a20
col data_type format a20
col vector_info format a30
col attribute_type format a20
set lines 120
    
SELECT
    model_name,
    mining_function,
    algorithm,
    algorithm_type,
    model_size
FROM
    user_mining_models
WHERE
    model_name = 'DOC_MODEL'
ORDER BY
    model_name;
    
SELECT
    model_name,
    attribute_name,
    attribute_type,
    data_type,
    vector_info
FROM
    user_mining_model_attributes
WHERE
    model_name = 'DOC_MODEL'
ORDER BY
    attribute_name;
    
CREATE TABLE IF NOT EXISTS ccnews (
    id   NUMBER(10) NOT NULL,
    info VARCHAR2(4000),
    vec  vector
);

commit;

INSERT INTO ccnews (
    id,
    info,
    vec
)    SELECT
        ROWNUM,
        sentence,
        to_vector(VECTOR_EMBEDDING(doc_model
            USING sentence AS data
        ))
    FROM
        ccnews_tmp;
