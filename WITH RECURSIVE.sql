drop table if exists tmp_hello;
create table tmp_hello(
  x integer
);


WITH RECURSIVE t(n,x) AS (
    VALUES (1,floor(random()*100))
  UNION ALL
    SELECT n+1,floor(random()*100) FROM t WHERE n < 100
)
insert into tmp_hello(x) SELECT x FROM t;

select * from tmp_hello;

