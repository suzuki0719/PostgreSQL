drop function if exists func_dbl(tbl_hello);
drop function if exists double_salary;

drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop function if exists f_複合型;

drop table if exists tbl_world;
drop table if exists tbl_hello;
drop table if exists tbl_hell;
drop table if exists tbl_world;
drop table if exists tbl_配列テスト;
drop table if exists tbl_範囲テスト;
drop table if exists tbl_型テスト;
drop table if exists tbl_master;
drop table if exists tbl_type;
drop table if exists tbl_複合型;

drop type if exists type_hello;

drop sequence if exists seq_範囲テスト;
create sequence seq_範囲テスト;

drop sequence if exists seq_hello;
create sequence seq_hello start with 1;

drop sequence if exists seq_world;
create sequence seq_world;

create table tbl_hello(a integer[]);

drop table if exists sal_emp;
create table sal_emp(name text,pay_by_quarter integer[],schedule text[][]);
insert into sal_emp
values 
    (
        'Bill',
        '{10000,10000,10000,10000}',
        '{{"meeting","lunch"},{"trainning","presentation"}}'
    ),
    (
        'Carol',
        ARRAY[20000,25000,25000,25000],
        ARRAY[['breakfast','consulting'],['meeting','lunch']]
    );
/*
select * from sal_emp;
select * from sal_emp where pay_by_quarter[1] <> pay_by_quarter[2];
select pay_by_quarter[3] from sal_emp;
select schedule[1:2][1:1] from sal_emp where name ='Bill';
select schedule[1:2][2] from sal_emp where name = 'Bill';

select schedule from sal_emp where name='Bill';
select schedule[2][2:] from sal_emp where name='Bill';
select schedule[:][1:1] from sal_emp where name='Bill';


select array_dims(schedule) from sal_emp where name='Carol'; 
select array_upper(schedule,1) from sal_emp where name='Carol';
select cardinality(schedule) from sal_emp where name='Carol';


update sal_emp set pay_by_quarter = '{25000,25000,27000,27000}' where name='Carol';
Update sal_emp set pay_by_quarter[4]=15000 where name='Bill';
Update sal_emp set pay_by_quarter[1:2]='{100,100}' where name='Carol';
select * from sal_emp;

select Array[11,22] || Array[33,44];
select Array[111,222] || Array[[333,444],[555,666]];

insert into tbl_hello(a) values(1||'[0:1]={2,3}'::integer[]);
select * from tbl_hello;

--追加
select array_prepend(1000,Array[100,200]);  --前に追加
select array_append(Array[100,200],1000);   --後ろに追加

--array_catは多次元でも連結できる
select array_cat(Array[1,2],Array[3,4]);
select array_cat(Array[[100,101],[200,201]],Array[11,22]);
select array_cat(Array[11,22],Array[[1111,2222],[3333,4444]]);
--select array_dims(1||'[0:1]={2,3}'::integer[]);

--NULLを追加する
select Array[1,2] || null as 追加できない;  
select array_append(Array[1,2],null) as 追加できる;
*/

--配列内を検索する
select * from sal_emp;
select * from sal_emp where 10000 = any(pay_by_quarter);

select generate_subscripts(pay_by_quarter,1) from sal_emp;


/*
-- 各記事(posts)が持っているタグ配列(tags)を行に展開する
SELECT 
    p.post_id, 
    p.title, 
    t.tag_name
FROM posts p
CROSS JOIN LATERAL unnest(p.tags) AS t(tag_name);
*/