drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;
drop table if exists tbl_範囲テスト;
drop sequence if exists seq_範囲テスト;
drop sequence if exists tmp_seq;

create sequence seq_範囲テスト;
create table tbl_範囲テスト(id integer,irange int4range);

do $$
declare
    i integer;
    j integer;
    f integer;
    t integer;
BEGIN
    for i in 1..100 loop
            f := floor(random()*10);
            t := floor(random()*10) + 10;
            insert into tbl_範囲テスト(id, irange)
            values(nextval('seq_範囲テスト'),int4range(f,t));
    end loop;
end; $$ LANGUAGE plpgsql;

select * from tbl_範囲テスト where irange <@ int4range(9,13);

