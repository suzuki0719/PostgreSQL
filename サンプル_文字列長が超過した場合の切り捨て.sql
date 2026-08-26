drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;
drop table if exists tbl_範囲テスト;
drop table if exists tbl_型テスト;


drop sequence if exists seq_範囲テスト;
create sequence seq_範囲テスト;

--連番を登録
drop sequence if exists seq_連番テスト;
create sequence seq_連番テスト;


create table tbl_型テスト(id integer default nextval('seq_連番テスト'), c char(5),v varchar(5));


--insert into tbl_型テスト(c,v) values('012345','012345');
insert into tbl_型テスト(c,v) values('012345'::char(5),'012345'::varchar(5));
select * from tbl_型テスト;

