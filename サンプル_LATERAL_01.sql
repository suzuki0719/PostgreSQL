drop function if exists func_dbl(tbl_hello);
drop function if exists double_salary;

drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop function if exists f_複合型;

drop table if exists tbl_world;
drop table if exists tbl_hello;
drop table if exists tbl_hell;
drop table if exists tbl_world;
drop table if exists tbl_配列テスト;
drop table if exists tbl_範囲テスト;
drop table if exists tbl_型テスト;
drop table if exists tbl_master;
drop table if exists tbl_type;
drop table if exists tbl_複合型;

drop type if exists type_hello;

drop sequence if exists seq_範囲テスト;
create sequence seq_範囲テスト;

drop sequence if exists seq_hello;
create sequence seq_hello start with 1;

drop sequence if exists seq_world;
create sequence seq_world;

create table tbl_hello(pid integer primary key default nextval('seq_hello'),name text);
create table tbl_world(
    id integer default nextval('seq_world'),
    pid integer REFERENCES tbl_hello(pid),
    item text,
    hizuke date
);

insert into tbl_hello(name) values('Yama'),('Kawa'),('Sora'),('Tani');

do $$
declare
    i integer;
begin
    i := 0;
    while i < 100
    Loop
        i = i+1;
        insert into tbl_world(pid,item,hizuke) values(floor(random()*4)+1,myRndString(5),CURRENT_DATE + (floor(random()*100) || ' days')::interval);
    end loop;
end; $$ LANGUAGE plpgsql;

select h.name,w.item,w.hizuke
from tbl_hello as h
left join lateral (select * from tbl_world as w where h.pid = w.pid order by hizuke asc limit 1) w on true;


select w.pid,h.NAME,item,hizuke from tbl_world w  inner join tbl_hello h on h.pid=w.pid and h.pid=1 order by w.hizuke asc;