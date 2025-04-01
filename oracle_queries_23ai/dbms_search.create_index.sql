CREATE USER tiger IDENTIFIED BY oracle_4u;

GRANT dba TO tiger;

CREATE USER scott IDENTIFIED BY oracle_4u;

GRANT dba TO scott;

CREATE TABLE tiger.person (
    person_id   NUMBER,
    person_name VARCHAR2(20),
    description VARCHAR2(4000)
);

CREATE TABLE scott.person (
    person_id   NUMBER,
    person_name VARCHAR2(20),
    description VARCHAR2(4000)
);

ALTER TABLE tiger.person ADD CONSTRAINT pk_person PRIMARY KEY ( person_id );

ALTER TABLE scott.person ADD CONSTRAINT pk_person PRIMARY KEY ( person_id );

INSERT INTO scott.person VALUES ( 1,
                                  'GAVIN',
                                  'THIS IS GAVIN IN SCOTT.PERSON TABLE' );

INSERT INTO scott.person VALUES ( 2,
                                  'SOORMA',
                                  'THIS IS SOORMA IN SCOTT.PERSON TABLE' );

INSERT INTO tiger.person VALUES ( 1,
                                  'GAVIN',
                                  'THIS IS GAVIN IN TIGER.PERSON TABLE' );

INSERT INTO tiger.person VALUES ( 2,
                                  'SOORMA',
                                  'THIS IS SOORMA IN TIGER.PERSON TABLE' );

COMMIT;

SELECT
    object_name,
    object_type
FROM
    user_objects
WHERE
    object_name = 'PERSON_INDX';

BEGIN
    dbms_search.create_index('PERSON_INDX');
END;
/

SELECT
    object_name,
    object_type
FROM
    user_objects
WHERE
    object_name = 'PERSON_INDX';

desc PERSON_INDX;

SELECT
    index_type,
    owner,
    ityp_owner,
    table_name
FROM
    dba_indexes
WHERE
    index_name = 'PERSON_INDX';

BEGIN
    dbms_search.add_source('PERSON_INDX', 'SCOTT.PERSON');
    dbms_search.add_source('PERSON_INDX', 'TIGER.PERSON');
END;
/

SELECT
    JSON_SERIALIZE(dbms_search.get_document('PERSON_INDX', metadata))
FROM
    person_indx;

SELECT
    JSON_SERIALIZE(metadata)
FROM
    person_indx;

SELECT
    JSON_SERIALIZE(dbms_search.get_document('PERSON_INDX', metadata))
FROM
    person_indx p
WHERE
        p.metadata.owner = 'SCOTT'
    AND p.metadata.source = 'PERSON'
    AND p.metadata.key.person_id = 1;

col owner format a20
col source format a20

SELECT
    p.metadata.owner,
    p.metadata.source,
    COUNT(*)
FROM
    person_indx p
GROUP BY
    p.metadata.owner,
    p.metadata.source;

SELECT
    JSON_SERIALIZE(metadata)
FROM
    person_indx
WHERE
    contains(data, 'GAVIN') > 0;

SELECT
    JSON_SERIALIZE(metadata)
FROM
    person_indx
WHERE
    contains(data, 'gavin') > 0;

SELECT
    JSON_SERIALIZE(metadata)
FROM
    person_indx
WHERE
    JSON_TEXTCONTAINS ( data, '$.SCOTT.PERSON', 'GAVIN' );

SELECT
    JSON_SERIALIZE(dbms_search.get_document('PERSON_INDX', metadata))
FROM
    person_indx
WHERE
    contains(data, 'gavin') > 0;