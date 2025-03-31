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

COMMIT;
    
