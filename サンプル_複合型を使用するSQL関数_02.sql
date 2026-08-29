drop function if exists f;
drop function if exists p;
drop function if exists hello;

drop table if exists tbl_hello;
drop table if exists tbl_配列テスト;
drop table if exists tbl_範囲テスト;
drop table if exists tbl_型テスト;
drop table if exists tbl_master;


drop sequence if exists seq_範囲テスト;
create sequence seq_範囲テスト;

--連番を登録
drop sequence if exists seq_連番テスト;
create sequence seq_連番テスト;

drop sequence if exists seq_hello;
create sequence seq_hello;

create table tbl_hello(
    name text,
    salary numeric,
    age integer,
    cubicle point
);
insert into tbl_hello values('Bill',4200,45,'(2,1)');

CREATE FUNCTION f(tbl_hello) RETURNS numeric AS $$
    SELECT $1.salary * 2 AS salary;
$$ LANGUAGE SQL;

select f(tbl_hello.*) as dream from tbl_hello where tbl_hello.cubicle ~= point '(2,1)';;

