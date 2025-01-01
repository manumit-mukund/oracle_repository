SELECT
    instance_name,
    version,
    open_mode
FROM
    v$instance,
    v$database;