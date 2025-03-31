CREATE TABLE IF NOT EXISTS ccnews_tmp (
    sentence VARCHAR2(4000)
)
ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER DEFAULT DIRECTORY dm_dump
                         ACCESS PARAMETERS
                           (RECORDS DELIMITED BY 0x'0A'
                            READSIZE 100000000
                            FIELDS (sentence CHAR(4000 ) ) )
    LOCATION ( dm_dump : 'dataset_200K.txt' )
)
    PARALLEL REJECT LIMIT UNLIMITED;
    

    
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
    
