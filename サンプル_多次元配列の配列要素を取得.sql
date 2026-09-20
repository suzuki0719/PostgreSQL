
drop table if exists tbl_Array;
drop sequence if exists seq_Array;
create sequence seq_Array
start with 100
increment 10
maxvalue 1000
cycle;

create table tbl_Array(
    id integer default nextval('seq_Array'),
    s text,
    a integer[][]
);

do $$
declare
    cnt integer;
    i integer;
    j integer;
    a integer[][];
    r integer[];
begin
    for cnt in 0..10 loop
        a :='{}';
        for i in 0..3 loop
            r :='{}';
            for j in 0..3 loop
                r = array_append(r,floor(random()*100)::integer);
            end loop;
            if i=1 then
                a := Array[r];
            else
                a = a || r;
            end if;
        end loop;
        insert into tbl_Array(s,a) values(myRndString(5),a);
    end loop;

end; $$ LANGUAGE plpgsql;


select  s,a[idx:idx],
(
    select array_agg(e)
    from unnest(a[idx:idx]) as e
    --select array_agg(a[idx][j]) 
    --from generate_series(1,len) as j
) from(
    select s,a,generate_subscripts(a,1) as idx, array_length(a,1) as len from tbl_array
);

/*
select s,a,a[idx:idx][1:len],
(
    select array_agg(a[idx][j])
    from generate_series(1,len) as j
)
 from (
    select s,a,generate_subscripts(a,1) as  idx,array_length(a,2) as len from tbl_Array
)
*/
