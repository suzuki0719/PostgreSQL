drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;
drop table if exists tbl_範囲テスト;
drop sequence if exists seq_範囲テスト;
drop sequence if exists tmp_seq;

create sequence seq_範囲テスト;

do $$
DECLARE
    i integer;
begin
    create table tbl_範囲テスト(id text,range int4range);

    for i in 1..10 loop
        insert into tbl_範囲テスト(id, range)
        values(nextval('seq_範囲テスト'),int4range(floor(random()*10)::integer,floor(random()*100)::integer));
    end loop;
end; $$ LANGUAGE plpgsql;

select * from tbl_範囲テスト;
select * from tbl_範囲テスト where range @> int4range(5,40);
select * from tbl_範囲テスト where  int4range(5,20) @> range;


