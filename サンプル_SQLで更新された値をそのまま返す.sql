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

create table tbl_hello(id integer default nextval('seq_hello'), balance  money);

do $$
declare
    i integer;
begin
    for i in 0..100 loop
        insert into tbl_hello(balance) values(random()*100000::money);
    end loop;
end; $$ LANGUAGE plpgsql;

create function f(account integer, debit money) returns money as $$
    update tbl_hello
    set balance = balance-debit
    where id = f.account
    RETURNING balance;
$$ LANGUAGE sql;

select * from tbl_hello where id =10;
select f(10::integer,1000::money);