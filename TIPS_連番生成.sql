drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;


--連番生成
select * from generate_series(1,10) as 連番生成;

--現在日時+連番
select current_date + generate_series(1,30,7) as "現在日時+連番";

--任意の日付一覧取得
select *  from generate_series(
    '2000-1-1'::timestamp,
    '2000-1-31',
    '3 days'::interval,
    'America/New_York') as 任意の日付一覧;