
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

create table tbl_Array2(
    a integer[]
);


do $$
declare
    i integer;
    j integer;
    s text;
    a integer[];
begin
    for i in 0..10 loop
        a='{}';
        for j in 0..1 loop
            a := array_append(a,floor(random()*100));
        end loop;
        insert into tbl_Array2(a) values(a);
    end loop;



    for i in 0..1000 loop
        a='{}';
        for j in 0..10 loop
            a = array_append(a,floor(random()*100));
        end loop;
        insert into tbl_Array(s,a) values(myRndString(3),a);
    end loop;
end; $$ LANGUAGE plpgsql;


select ary1.a,ary2.a from tbl_array ary1 inner join tbl_Array2 ary2 on  ary2.a <@ ary1.a limit 3;
select ary1.a,ary2.a from tbl_array ary1 inner join tbl_array2 ary2 on ary2.a && ary1.a limit 3;


