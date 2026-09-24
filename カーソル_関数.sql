drop table if exists tbl_カーソル;
drop sequence if exists seq_カーソル;
drop function if exists func_カーソル;

create sequence seq_カーソル
start with 100
increment 1
maxvalue 10000
cycle;

create table tbl_カーソル(
    id integer default nextval('seq_カーソル'),
    ss text
);

do $$
declare
    i integer;
    c refcursor;
begin
    for i in 0..1000 loop
        insert into tbl_カーソル(ss) values(myRndString(10));
    end loop;  



end; $$ LANGUAGE plpgsql;


create function func_カーソル(refcursor) returns refcursor as $$
begin
    open $1 for select * from tbl_カーソル order by id asc;
    return $1;
end;
$$ language plpgsql;


begin;
    select func_カーソル('hello');
    --fetch all in hello;
    fetch first in hello;
    fetch last in hello;
    fetch ABSOLUTE  3 in hello;
    fetch FORWARD 1 in hello;
    fetch forward 0 in hello;
    fetch backward all in hello;
    fetch forward 1 in hello;
commit;


begin;
    declare mycur cursor for select * from tbl_カーソル order by id desc;
    fetch forward 5 from mycur;
    close mycur;
commit;
