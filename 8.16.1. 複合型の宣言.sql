drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop function if exists f_複合型;

drop table if exists tbl_hello;
drop table if exists tbl_配列テスト;
drop table if exists tbl_範囲テスト;
drop table if exists tbl_型テスト;
drop table if exists tbl_master;
drop table if exists tbl_type;
drop table if exists tbl_複合型;


drop type if exists type_hello;

drop sequence if exists seq_範囲テスト;
create sequence seq_範囲テスト;

--連番を登録
drop sequence if exists seq_連番テスト;
create sequence seq_連番テスト;

drop sequence if exists seq_hello;
create sequence seq_hello;

drop table if exists f;

drop type if exists type_hello;
create type type_hello as (a text,b text);


drop table if exists on_hand;
drop function if exists price_extention;
drop type if exists inventory_items;

create type inventory_items as (
    name text,
    supplier_id integer,
    price numeric
);

create table on_hand(
    item    inventory_items,
    count   integer
);

insert into on_hand(item, count) values(row('fuzzy',10,123),100);
insert into on_hand(item, count) values(row('hello',10,456),100);

create function price_extention(inventory_items,integer) returns numeric as $$
select $1.price * $2;
$$ LANGUAGE SQL;

select price_extention(item,10) from on_hand;