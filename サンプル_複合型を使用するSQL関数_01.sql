drop function if exists f;
drop function if exists p;
drop function if exists hello;

drop table if exists tbl_hello;
drop table if exists tbl_配列テスト;
drop table if exists tbl_範囲テスト;
drop table if exists tbl_型テスト;
drop table if exists tbl_master;


drop sequence if exists seq_範囲テスト;
create sequence seq_範囲テスト;

--連番を登録
drop sequence if exists seq_連番テスト;
create sequence seq_連番テスト;

drop sequence if exists seq_hello;
create sequence seq_hello;

create table tbl_hello(id text default nextval('seq_hello'),s1 text, s2 text,v integer);
do $$
declare
    i integer;
begin
    for i in 0..10 loop
        insert into tbl_hello(s1,s2,v) values(myRndString(5),myRndString(5),random()*100);
    end loop;
end; $$ LANGUAGE plpgsql;

create function f(tbl_hello) returns text as $$
    select concat($1.s1,'-',$1.s2) as s3;
$$ LANGUAGE SQL;


select f(tbl_hello.*),v from tbl_hello where tbl_hello.v between 20 and 40;



