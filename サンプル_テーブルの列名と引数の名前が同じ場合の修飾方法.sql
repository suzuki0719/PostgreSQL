drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;
drop table if exists tbl_範囲テスト;
drop table if exists tbl_型テスト;
drop table if exists tbl_master;


drop sequence if exists seq_範囲テスト;
create sequence seq_範囲テスト;

--連番を登録
drop sequence if exists seq_連番テスト;
create sequence seq_連番テスト;

create table tbl_型テスト(id integer not null DEFAULT nextval('seq_連番テスト'),ss text,v integer);
do $$
declare
    i integer;
begin
    for i in 0..100 loop
        insert into tbl_型テスト(ss,v) values(myRndString(3),floor(random()*100));
    end loop;
end; $$ LANGUAGE plpgsql;

create function f(v integer) returns void as $$
begin
    delete from tbl_型テスト as t where t.v < f.v;
end $$ LANGUAGE plpgsql;

select f(50);
select * from tbl_型テスト order by v asc;






