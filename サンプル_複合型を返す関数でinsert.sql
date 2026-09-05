drop function if exists func_dbl(tbl_hello);
drop function if exists double_salary;


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


drop function if exists func_dbl(tbl_hello);
drop type if exists type_hello;
create type type_hello as (a text,b text);

create table tbl_hello(s text, v integer);

insert into tbl_hello(s,v) values('hello',100);

create function f() returns tbl_hello as $$
    select 'yama' as s,123 as v;
$$ LANGUAGE SQL;

insert into tbl_hello select * from f();
select * from tbl_hello;

