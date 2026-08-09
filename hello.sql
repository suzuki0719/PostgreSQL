drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;
drop sequence if exists tmp_seq;

create table tbl_配列テスト(id integer, a integer[]);
do $$
declare 
    a integer[];
BEGIN
    for i in 1..10 loop
        a := '{}';
        for j in 1..floor(random()*10)+1 loop
            a := array_append(a,floor(random()*100));
        end loop;
        insert into tbl_配列テスト(id,a) values(i,a);
    end loop;
end;$$ LANGUAGE plpgsql;

select * from tbl_配列テスト where 90 < any(a);
select * from tbl_配列テスト where 10 < all(a);

select array_length(a,1) from tbl_配列テスト;
select unnest(a) from tbl_配列テスト where id=1;



