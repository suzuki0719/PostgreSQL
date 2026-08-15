drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;
drop table if exists tbl_範囲テスト;
drop sequence if exists tmp_seq;

create table tbl_範囲テスト(room text,during tsrange);
insert into tbl_範囲テスト(room,during)
values('1108','[2010-01-01 14:30,2010-01-01 15:30]');


select * from tbl_範囲テスト;

--含有(含んでいるか)
select int4range(10,20) @> 11;

--重なり(重なっている部分があるか)
select numrange(11.1,22.2) && numrange(20.0,30.0);

--上限取得
select upper(int8range(15,25));


--共通部分
select int4range(10,20) * int4range(15,25);


    


