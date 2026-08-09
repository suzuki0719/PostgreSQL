drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;

select * from sal_emp where 10000 =any(pay_by_quarter);
select * from sal_emp where 10000 =All(pay_by_quarter);

select name,idx,pay_by_quarter[idx]  from (
    select name,pay_by_quarter,generate_subscripts(pay_by_quarter,1) as idx from sal_emp
) where pay_by_quarter[idx]=10000; 


select * from sal_emp where pay_by_quarter && Array[10000];