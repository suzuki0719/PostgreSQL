drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;
drop table if exists tbl_範囲テスト;
drop table if exists tbl_型テスト;

drop sequence if exists seq_範囲テスト;
create sequence seq_範囲テスト;

--連番を登録
drop sequence if exists seq_連番テスト;
create sequence seq_連番テスト;

--連番を使用するテーブル
create table tbl_連番テスト(
    id integer default nextval('seq_連番テスト'),
    v integer
);
alter sequence seq_連番テスト owned by tbl_連番テスト.id;

--連番の関連先をリセット
alter sequence seq_連番テスト owned by none;
drop table tbl_連番テスト;

--連番を削除
drop sequence seq_連番テスト;