drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;

BEGIN;
create table tbl_配列テスト (
    name text,
    myarray integer[]
);

insert into tbl_配列テスト(name,myarray)
values
('hello',ARRAY[10,20,30]),
('world',ARRAY[100,200,300]);

select * from tbl_配列テスト order by name;

--拡張
update tbl_配列テスト set myarray[5:6]=ARRAY[55,66] where name='hello';

--追加(1次元配列のみ可能)
insert into tbl_配列テスト(name,myarray) values('yama',array_append(ARRAY[1,2,3],99));

--先頭に挿入(1次元配列のみ可能)
insert into tbl_配列テスト(name,myarray) values('kawa',array_prepend(-1,ARRAY[99,88,77]));

--2次元配列の追加
insert into tbl_配列テスト(name,myarray) values('sora',array_cat(ARRAY[111,222],ARRAY[333,444]));
insert into tbl_配列テスト(name,myarray) values('tani',array_cat(ARRAY[[1,2],[3,4]],ARRAY[555,666]));

select * from tbl_配列テスト;

COMMIT;