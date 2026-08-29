drop function if exists f;
drop function if exists p;
drop function if exists hello;

drop table if exists tbl_hello;
drop table if exists tbl_配列テスト;
drop table if exists tbl_範囲テスト;
drop table if exists tbl_型テスト;
drop table if exists tbl_master;
drop table if exists tbl_type;
drop type if exists type_hello;

drop sequence if exists seq_範囲テスト;
create sequence seq_範囲テスト;

--連番を登録
drop sequence if exists seq_連番テスト;
create sequence seq_連番テスト;

drop sequence if exists seq_hello;
create sequence seq_hello;

drop table if exists f;

create table tbl_hello(name text, address text);
insert into tbl_hello values ('tom','tokyo');

create function f(tbl_hello) returns text as $$
    select concat($1.name,' is from ', $1.address);
$$ LANGUAGE sql;

select f(tbl_hello.*) from tbl_hello;





