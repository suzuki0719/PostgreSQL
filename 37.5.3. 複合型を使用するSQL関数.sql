drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop function if exists f_複合型;

drop table if exists tbl_hello;
drop table if exists tbl_配列テスト;
drop table if exists tbl_範囲テスト;
drop table if exists tbl_型テスト;
drop table if exists tbl_master;
drop table if exists tbl_type;
drop table if exists tbl_複合型;


drop type if exists type_hello;

drop sequence if exists seq_範囲テスト;
create sequence seq_範囲テスト;

--連番を登録
drop sequence if exists seq_連番テスト;
create sequence seq_連番テスト;

drop sequence if exists seq_hello;
create sequence seq_hello;

drop table if exists f;

create table tbl_複合型(
        id integer default nextval('seq_hello'),
        name text,
        address text
);

create table tbl_hello(id integer default nextval('seq_hello'), ss text,item tbl_複合型);

do $$
declare
    i integer;
begin
    for i in 0..10 loop
        insert into tbl_hello(ss,item) values('test',ROW(NULL,myRndString(3),myRndString(10)));
    end loop;
end; $$ LANGUAGE plpgsql;

select * from tbl_hello;

create function f_複合型() returns setof tbl_複合型 as $$
    select tbl_hello.item from tbl_hello;
$$ language SQL;


select f_複合型();




