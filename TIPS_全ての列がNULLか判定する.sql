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



create table tbl_複合型(id integer, s1 text, s2 text);
insert into tbl_複合型(id,s1,s2) values(111,'yama','kakwa');
insert into tbl_複合型(id,s1,s2) values(222,'hello','world');
insert into tbl_複合型(id,s1,s2) values(NULL,NULL,NULL);
insert into tbl_複合型(id,s1,s2) values(NULL,NULL,NULL);

select * from tbl_複合型;

--全てがNULLか判定する
select row(tbl_複合型.*) IS NULL from tbl_複合型;