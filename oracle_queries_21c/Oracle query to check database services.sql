-- coonect to SYS (connection name con_SYS_21c on my machine...)

SELECT
    name,
    con_id
FROM
    v$services;