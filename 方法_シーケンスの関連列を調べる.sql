drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;
drop table if exists tbl_範囲テスト;
drop table if exists tbl_型テスト;

drop sequence if exists seq_範囲テスト;
create sequence seq_範囲テスト;


select
    seq.sequence_name,
    col.table_name,
    col.column_name
from   information_schema.sequences as seq
inner join information_schema.columns as col
on col.column_default like concat('%',seq.sequence_name,'%');
    

SELECT * FROM pg_sequences;