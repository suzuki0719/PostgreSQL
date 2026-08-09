drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;

--配列に要素を追加
select array_append(Array[1,2,3],99);
select Array[1,2,3] || 99;

--配列に配列を追加
select array_cat(Array[1,2,3],'{4,5,6}');
select Array[1,2,3] || '{4,5,6}';

--配列の次元を取得
select array_dims(Array[1,2,3]);
select array_dims(Array[Array[1,2,3],Array[4,5,6]]);

--配列を埋める
select array_fill(7,Array[3]);
select array_fill(9, ARRAY[3], ARRAY[2]); -- → [2:4]={7,7,7} *array_lowerで確認できる
select array_fill(-1,Array[2]);

--配列の長さ
select array_length(Array[1,2,3],1);
select array_length(Array[Array[1,2,3,4],Array[5,6,7,8]],2);

--配列の下限
select array_lower('[0:2]={1,2,3}'::integer[], 1);
select array_lower('[10:12]={1,2,3}'::integer[],1);
select array_lower(array_fill(1,Array[3],Array[4]),1);

--配列の次元数
select array_ndims(Array[1,2,3]);
select array_ndims(Array[Array[1,2,3],Array[4,5,6]]);

--配列の検索
select array_position('{a,b,c}','b',1);      --1番目の要素から検索
select array_position('{a,b,c,a,b,c}','b',3); --3番目の要素から検索

--配列の先頭に追加
select array_prepend('hello','{world,yama,kawa}');

---配列から要素を削除
select array_remove('{1,2,3,1,2,3}',2);

--配列の要素を置換
select array_replace('{a,b,c,a,b,c}','b','*');

--配列の要素を連結して文字列にする
select array_to_string(Array['a','b',NULL,'c'],'-');
select array_to_string(Array['a','b',NULL,'c'],'-','*');

--配列の上限
select array_upper(Array[1,2,3],1);
select array_upper(Array[Array[1,2,3,4],Array[5,6,7,8]],2);

--配列の要素数
select cardinality(Array[[1,2,3],[4,5,6]]);

--文字列を分割
select string_to_array('hello,world,good,morning',',');
select string_to_array('hello,world,good,morning',',','world');

--配列を集合に転回
select unnest(Array[1,2,3]);
select * from unnest(ARRAY[1,2], ARRAY['foo','bar','baz']) as x(a,b);

