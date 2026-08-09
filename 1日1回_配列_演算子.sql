drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;

--左側の要素は、右側の要素をすべて含んでいるか?
select Array[1,2,3] @> Array[1,3];

--右側の要素は、左側の要素をすべて含んでいるか?
select Array[1,2,3] <@ Array[1,2,35];

--共通の要素を持っているか?
select Array[1,2,3] && Array[4,5,6,2];

--結合
select Array[1,2,3] || Array[11,12,13];
select Array[1,2,3] || Array[[11,22,33],[111,222,333]];

--連結(anyelementを配列に連結)
select 99 || Array[0,1,2,3];
select Array[0,1,2,3] || 99;
