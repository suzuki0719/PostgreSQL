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

create table tbl_master(id integer not null default  nextval('seq_連番テスト'),ss text);
create table tbl_型テスト(id integer default nextval('seq_連番テスト'), ss text);

DO $$
DECLARE
    i integer;
    r_set tbl_型テスト[]; 
    r tbl_型テスト;
BEGIN
    for i in 0..10 loop
        insert into tbl_型テスト(ss) values(myRndString(5));
    end loop;

    SELECT array_agg(t) INTO r_set 
    FROM tbl_型テスト t;

    RAISE INFO '取得件数: % 件', cardinality(r_set);

    FOREACH r IN ARRAY r_set LOOP
        RAISE INFO 'ID: %, SS: %', r.id, r.ss;
    END LOOP;
END; $$ LANGUAGE plpgsql;



