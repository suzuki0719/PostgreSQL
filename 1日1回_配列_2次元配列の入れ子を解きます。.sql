drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;

create function f(anyarray) returns setof anyelement as $$
    select $1[i][j]
        from generate_subscripts($1,1) g1(i),
             generate_subscripts($1,2) g2(j);
$$ LANGUAGE sql IMMUTABLE;


SELECT * FROM f(ARRAY[[1,2],[3,4]]);



