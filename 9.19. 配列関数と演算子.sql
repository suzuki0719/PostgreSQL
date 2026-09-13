drop table if exists tbl_Array;
drop sequence if exists seq_Array;

create sequence seq_Array start with 1 increment by 5;

create table tbl_Array(
    id      integer default nextval('seq_Array'),
    rnd     integer,
    s       text,
    a       integer[],
    aa      integer[]
);

do $$
declare
    i   integer;
    j   integer;
    a   integer[];
begin
    for i in 0..10 loop
        a='{}';
        for j in 0..10 loop
            a := a || floor(random()*10);
        end loop;
        insert into tbl_Array(rnd,s,a) values(floor(random()*10),myRndString(5),a);
    end loop;
end; $$ LANGUAGE plpgsql;

/*
select * from tbl_Array where a @> Array[1];
select * from tbl_Array where Array[1] <@ a;
select * from tbl_Array where Array[1,2,3] && a;

select Array[11,22,33] || a[0:3] as mg ,a as org from tbl_Array;
select 123 || a[5:5] from tbl_Array;
select a[5:] || 333 from tbl_Array;
*/
--select id,s,a[:5] from tbl_Array A where a @> Array[1,2];

/*
select s,A.a[:5] from tbl_Array A where 1 in(select unnest(B.a[:5]) from tbl_Array B where A.id=B.id);
select s,a[:5] from tbl_Array where a[:5] @> Array[1];
*/

update tbl_Array set aa= Array[100,200] || a[0:3];

select id,* from tbl_Array where 5 < all(a[0:3]);
select id,a[0:3] from tbl_array;




