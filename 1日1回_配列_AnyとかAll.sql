drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_AnyとAllの確認;
drop sequence if exists tmp_seq;

create table tbl_AnyとAllの確認(
    ID  integer,
    val integer[]
);

do $$
DECLARE
    i   integer;
    j   integer;
    a   integer[];
BEGIN
    for i in 1..10 loop
        a := '{}';
        for j in 1..10 loop
            a:=array_append(a,floor(random()*100));
        end loop;
        insert into tbl_AnyとAllの確認(ID,val) values(i,a);
    end loop;
end; $$ LANGUAGE plpgsql;


select * from tbl_AnyとAllの確認 where 5 = any(val);
select * from tbl_AnyとAllの確認 where 90 < any(val);
select * from tbl_AnyとAllの確認 where 90 > all(val);

