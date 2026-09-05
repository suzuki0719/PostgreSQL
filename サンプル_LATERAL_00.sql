drop function if exists func_dbl(tbl_hello);
drop function if exists double_salary;

drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop function if exists f_複合型;

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
create sequence seq_hello;

drop sequence if exists seq_world;
create sequence seq_world;



create table tbl_Hello(id integer DEFAULT nextval('seq_hello') , ss text);
create table tbl_World(id integer default nextval('seq_world'), ss text);

do $$ 
declare
    i integer;
begin
    i :=0 ;
    while i < 10
    loop
        i = i+1;
        insert into tbl_Hello(ss) values(myRndString(5));
        insert into tbl_World(ss) values(myRndString(50));
    end loop;

    for i in 0..3 loop
        insert into tbl_Hello(ss) values(myRndString(5));
    end loop;

end; $$ LANGUAGE plpgsql;

select h.ss hello,w.ss  from tbl_hello as h,LATERAL (select * from tbl_world as w where w.id=h.id) as w;

select * from tbl_hello;
