drop table if exists tbl_cursor_a;
drop table if exists tbl_cursor_b;
drop table if exists tbl_cursor_c;
drop function if exists func_cursor;

drop sequence if exists seq_cursor_a;
drop sequence if exists seq_cursor_b;

create sequence seq_cursor_a
start with 100
INCREMENT 10;

create sequence seq_cursor_b
start with 1000
increment 10
MAXVALUE   10000
cycle;


create table tbl_cursor_a(
    id integer default nextval('seq_cursor_a'),
    s text
);

create table tbl_cursor_b(
    id  integer default nextval('seq_cursor_b'),
    s   text
);

create table tbl_cursor_c(
    id  integer,
    s   text
);

do $$
declare
    i integer;
begin
    for i in 0..1000 loop
        insert into tbl_cursor_a(s) values(myRndString(5));
        insert into tbl_cursor_b(s) values(myRndString(10));
    end loop;




end; $$ LANGUAGE plpgsql;

create function func_cursor(refcursor,refcursor) returns setof refcursor as $$
begin
    open $1 for select * from tbl_cursor_a order by id limit 10;
    return next $1;

    open $2 for select * from tbl_cursor_b order by id limit 10;
    return next $2;
end; $$ LANGUAGE plpgsql;

begin;
    select * from func_cursor('a','b');

    do $$
    declare
        rec record;
    begin
        for rec in fetch all from "a" loop
            insert into tbl_cursor_c(id,s)
            values (rec.id,rec.s);
        end loop;
    end $$;

    select * from tbl_cursor_c;
commit;



