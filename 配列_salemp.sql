DROP TABLE IF EXISTS SAL_EMP;
CREATE TABLE SAL_EMP(
    NAME TEXT,
    PAY_BY_QUARTER INTEGER[],
    SCHEDULE TEXT[][]

);

/*
CREATE TABLE sal_emp (
    name            text,
    pay_by_quarter  integer[],
    schedule        text[][]
);
*/

INSERT INTO sal_emp
    VALUES ('Bill',
    '{10000, 10000, 10000, 10000}',
    '{
        {"meeting", "lunch"}, 
        {"training", "presentation"},
        {"3行目1列", "3行目2列"},
        {"4行目1列", "4行目2列"},
        {"5行目1列", "5行目2列"},
        {"6行目1列", "6行目2列"}
    }');

INSERT INTO sal_emp
    VALUES ('Carol',
    '{20000, 25000, 123, 25000}',
    '{{"breakfast", "consulting"}, {"meeting", "lunch"}}');


INSERT INTO sal_emp
    VALUES ('hello',
    '{10000, 10000, 10000, 123,10000}',
    '{
        {"R1C1", "R1C2","R1C3"},
        {"R2C1", "R2C2","R2C3"},
        {"R3C1", "R3C2","R3C3"},
        {"R4C1", "R4C2","R4C3"},
        {"R5C1", "R5C2","R5C3"},
        {"R6C1", "R6C2","R6C3"}
    }');

select array_position(Array['hello','world','hello','world'],'world');
select array_positions(Array[1,2,3,1,2,3],2);


select * from sal_emp where pay_by_quarter && Array[123];

select * from sal_emp where 123 = any(pay_by_quarter);
select * from sal_emp where 10000 = all(pay_by_quarter);

select name,generate_subscripts(pay_by_quarter,1) from sal_emp; --where name='hello';

--select pay_by_quarter,generate_subscripts(pay_by_quarter,1) from sal_emp;
select * from (
    SELECT name,pay_by_quarter,
           generate_subscripts(pay_by_quarter, 1) AS index
      FROM sal_emp) as foo
where pay_by_quarter[index]=123;


/*
CREATE TEMP TABLE AA(
    ID INTEGER[]
);

INSERT INTO AA(ID) VALUES([1,2,3]); 

select id from aa;
*/
/*
drop table if exists sal_emp;
CREATE temp TABLE sal_emp (
    name            text,
    pay_by_quarter  integer[],
    schedule        text[][]
);

INSERT INTO sal_emp
    VALUES ('Bill',
    '{10000, 10000, 10000, 10000}',
    '{{"meeting", "lunch","A"}, {"training", "presentation","B"},{"aa","bb","cc"}}');

INSERT INTO sal_emp
    VALUES ('Carol',
    '{20000, 25000, 25000, 25000}',
    '{{"breakfast", "consulting","C"}, {"meeting", "lunch","D"},{"dd","ee","ff"}}');


select array_dims(schedule) from sal_emp;
SELECT array_upper(schedule, 1) FROM sal_emp WHERE name = 'Carol';
select array_length(schedule,1) from sal_emp;
select cardinality(schedule) from sal_emp;

*/

/*select name from sal_emp where pay_by_quarter[1] <> pay_by_quarter[2];

select pay_by_quarter[3] from sal_emp;


select schedule[2][1:2] from sal_emp;
*/

/*
--切り出し指定子の勉強 -----------------------------------------------------------
-片方を切り出し指定子を使用した場合、他方も自動的に切り出し指定子となる
select b[1:2][2:2] from (
select 
array[1,2,3,4,5,6,7,8,9,10] as a,
array[[1,2,3,4,5,6],[11,22,33,44,55,66],[111,222,333,444,555,666]] as b
);

--------------------------------------------------------------------------------
*/

/*
select a from (
select array_agg(pay_by_quarter) as a from sal_emp
);


drop table if exists aa;
create temp table aa(
    hello text[3],
    schedule        text[][],
    world        text[][]
    --world text[]text[]
);

insert into aa(hello) values('{"yama","kawa"}');
insert into aa(hello) values('{"yama","kawa","sora","aa","bb"}');
insert into aa(hello) values('{null,"hello",NULL,"world"}');
insert into aa(schedule) values('{{"meeting", "lunch"}, {"training", "presentation"}}');
insert into aa(schedule) values('{{"AA","BB"},{"aa","bb"}}');
insert into aa(hello) values(array[['A','B'],['C','D']]);
--insert into aa(world) values('{{"AA","BB"},{"aa","bb","cc"}}');

select * from aa;
--insert into aa(world) values('{{"AA","BB"},{"aa","bb","cc"}}');
--select * from aa;
*/