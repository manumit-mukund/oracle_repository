DROP TABLE IF EXISTS galaxies PURGE;

CREATE TABLE galaxies (
    id        NUMBER NOT NULL PRIMARY KEY,
    name      VARCHAR2(10 CHAR) NOT NULL UNIQUE,
    embedding VECTOR(5, INT8) NOT NULL, -- 5 dimensions, stored as int8
    doc       VARCHAR2(120 CHAR) NOT NULL
);

insert into galaxies 
   (id, name, embedding, doc)
values 
   (1, 'M31',     '[0,2,2,0,0]', 'Messier 31 is a barred spiral galaxy in the Andromeda constellation which has a lot of barred spiral galaxies.'),
   (2, 'M33',     '[0,0,1,0,0]', 'Messier 33 is a spiral galaxy in the Triangulum constellation.'),
   (3, 'M58',     '[1,1,1,0,0]', 'Messier 58 is an intermediate barred spiral galaxy in the Virgo constellation.'),
   (4, 'M63',     '[0,0,1,0,0]', 'Messier 63 is a spiral galaxy in the Canes Venatici constellation.'),
   (5, 'M77',     '[0,1,1,0,0]', 'Messier 77 is a barred spiral galaxy in the Cetus constellation.'),
   (6, 'M91',     '[0,1,1,0,0]', 'Messier 91 is a barred spiral galaxy in the Coma Berenices constellation.'),
   (7, 'M49',     '[0,0,0,1,1]', 'Messier 49 is a giant elliptical galaxy in the Virgo constellation.'),
   (8, 'M60',     '[0,0,0,0,1]', 'Messier 60 is an elliptical galaxy in the Virgo constellation.'),
   (9, 'NGC1073', '[0,1,1,0,0]', 'NGC 1073 is a barred spiral galaxy in Cetus constellation.');
   
commit;

with ngc1073 as (select vector('[0,1,1,0,0]', 5, int8) as query_vector)
select name, 
       round(vector_distance(embedding, query_vector, cosine), 3) as cosine_distance,
       round(vector_distance(embedding, query_vector, dot), 3) as inner_product,
       round(vector_distance(embedding, query_vector, euclidean), 3) as l2_distance,
       round(vector_distance(embedding, query_vector, euclidean_squared), 3) as l2_squared,
       round(vector_distance(embedding, query_vector, hamming), 3) as hamming_distance,
       round(vector_distance(embedding, query_vector, manhattan), 3) as l1_distance
  from galaxies, ngc1073
 order by cosine_distance;
 
with ngc1073 as (select vector('[0,1,1,0,0]', 5, int8) as query_vector)
select name, 
       round(embedding <=> query_vector, 3) as cosine_distance,
       round(embedding <-> query_vector, 3) as l2_distance,
       round(embedding <#> query_vector, 3) as inner_product
  from galaxies, ngc1073
 order by cosine_distance;
 
SELECT
    name,
    embedding
FROM
    galaxies
ORDER BY
    embedding <=> VECTOR('[0,1,1,0,0]', 5, INT8)
FETCH APPROX FIRST 3 ROWS ONLY WITH TARGET ACCURACY 80 PERCENT;