
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
        for j in 0..5 loop
            a=array_append(a,floor(random()*10));
        end loop;
        insert into tbl_Array(s,a) values(myRndString(3),a);
    end loop;
end; $$ LANGUAGE plpgsql;

select s,array_agg(aitem) from (
select A.s,A.item as Aitem,B.item as Bitem from 
(select s,unnest(a) as item from tbl_Array)  A
left outer join (
select s,unnest(Array[1,2,3]) as item from tbl_Array 
) B on (A.s=B.s and A.item=B.item) 
where B.item is NULL order by A.item
) group by s;


/*
select A.s,A.item as Aitem,B.item as Bitem from 
(select s,unnest(a) as item from tbl_Array)  A
left outer join (
select s,unnest(Array[1,2,3]) as item from tbl_Array 
) B on (A.s=B.s and A.item=B.item) 
where B.item is NULL;
*/



/*
select s,array_agg(e) from (
select distinct s, e from(
select s,a,unnest(array_remove(a,item)) e from (
select s,a,unnest(Array[1,2,3]) as item from tbl_Array
) ) ) group by s order by s asc limit 1 ;

select s,a from tbl_Array order by s asc limit 1;
*/


/*
select s,e
 from(
        select s,unnest(array_remove(a,item)) e from (
select s,a,unnest(Array[1,2,3]) as item from tbl_Array
) ) group by s;
*/

/*
select s,array_agg(e) from(
        select s,unnest(array_remove(a,item)) e from (
select s,a,unnest(Array[1,2,3]) as item from tbl_Array
) ) group by s;
*/

