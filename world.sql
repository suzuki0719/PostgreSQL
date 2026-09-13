drop table if exists tbl_hello;

drop sequence if exists seq_hello;

create sequence seq_hello;

create table tbl_hello(
    id  integer default nextval('seq_hello'),
    a   integer[]
);

do $$
declare
    i integer;
    j integer;
    a integer[];
begin
    for i in 0..100 loop
        a :='{}';
        for j in 0..10 loop
            a := a || floor(random()*100);
        end loop;
        insert into tbl_hello(a) values(a);
    end loop;
end; $$ LANGUAGE plpgsql;


--対象の要素とインデックスまで抽出できる
select idx,a[idx] from (
    select a,generate_subscripts(a,1) as idx from tbl_hello
) where a[idx] in (10,20,30);
