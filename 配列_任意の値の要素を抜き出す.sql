
drop table if exists tbl_Array;
drop table if exists tbl_Array2;
drop sequence if exists seq_Array;
create sequence seq_Array 
start with 100
cycle
maxvalue 200
increment 10;

create table tbl_Array(
    id integer default nextval('seq_Array'),
    s text,
    a integer[]
);



do $$
declare
    i integer;
    j integer;
    a integer[];
begin
    for i in 0..100 loop
        a:='{}';
        for j in 0..100 loop
            a=array_append(a,floor(random()*100));
        end loop;
        insert into tbl_Array(s,a) values(myRndString(3),a);
    end loop;
end; $$ LANGUAGE plpgsql;

select s,a[idx],idx,a from (
    select s,a,unnest(pos) as idx,array_length(pos,1) from (
        select s,a,array_positions(a,unnest(Array[10,20])) as pos from tbl_Array
    ) where array_length(pos,1)::integer > 0
);