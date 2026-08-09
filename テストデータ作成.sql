drop table if exists TEST_00;
drop table if exists TEST_PERSON;
drop table if exists TEST_CITY;
drop table if exists TEST_PREF;
drop table if exists sal_emp;
drop table if exists TEST_ARRAY;

drop sequence if exists TEST_SEQ_PERSON;
drop sequence if exists TEST_SEQ_PREF;
drop sequence if exists TEST_SEQ_CITY;
drop sequence if exists TEST_SEQ_00;

create sequence TEST_SEQ_00;
create sequence TEST_SEQ_PERSON;
create sequence TEST_SEQ_PREF;
create sequence TEST_SEQ_CITY;



create table TEST_ARRAY(
    id integer,
    v1  integer[],
    v2  integer[][],
    s1  text[],
    s2  text[][]
);

do $$
DECLARE
    i int;
BEGIN
    for i in 1..5 loop
        insert into TEST_ARRAY(id,v1) VALUES
        (i,
            Array[
                    random()*1000,
                    random()*1000,
                    random()*1000
            ]);
    end loop;
END;$$ LANGUAGE plpgsql;



create table TEST_PREF(
    id_pref integer primary key, 
    name text
);

insert into TEST_PREF(id_pref,name) values
(nextval('TEST_SEQ_PREF'),'TOKYO'),
(nextval('TEST_SEQ_PREF'),'KANAGAWA'),
(nextval('TEST_SEQ_PREF'),'CHIBA'),
(nextval('TEST_SEQ_PREF'),'YAMANASHI'),
(nextval('TEST_SEQ_PREF'),'SAITAMA'),
( nextval('TEST_SEQ_PREF'),'SHIZUOKA');

create table TEST_CITY(
    id_city integer primary key,
    id_pref integer not null REFERENCES TEST_PREF(id_pref),
    name text
);
insert into TEST_CITY(id_pref,id_city,name) VALUES
(1,nextval('TEST_SEQ_CITY'),'SHINJYUKU'),
(1,nextval('TEST_SEQ_CITY'),'SHINAGAWA'),
(1,nextval('TEST_SEQ_CITY'),'TACHIKAWA'),
(2,nextval('TEST_SEQ_CITY'),'ATSUGI'),
(2,nextval('TEST_SEQ_CITY'),'YOKOHAMA'),
(2,nextval('TEST_SEQ_CITY'),'EBINA'),
(2,nextval('TEST_SEQ_CITY'),'SAGAMIHARA'),
(3,nextval('TEST_SEQ_CITY'),'MATSUDO'),
(3,nextval('TEST_SEQ_CITY'),'URAWA'),
(4,nextval('TEST_SEQ_CITY'),'KOFU'),
(4,nextval('TEST_SEQ_CITY'),'ISAWA');








create table TEST_00 ( 
    ID  integer,
    NAME    text,
    address text,
    age     integer,
    note    text
);

insert into TEST_00(id,name,address,age)
VALUES
(nextval('TEST_SEQ_00'),'yama','TOKYO',10),
(nextval('TEST_SEQ_00'),'kawa','TOKYO',20),
(nextval('TEST_SEQ_00'),'sora','TOKYO',30),
(nextval('TEST_SEQ_00'),'hello','KANAGAWA',10),
(nextval('TEST_SEQ_00'),'world','KANAGAWA',20),
(nextval('TEST_SEQ_00'),'yamaha','CHIBA',10),
(nextval('TEST_SEQ_00'),'honda','CHIBA',20),
(nextval('TEST_SEQ_00'),'kawasaki','CHIBA',30);


create table sal_emp(
    name text,
    pay_by_quarter integer[],
    --pay_by_quarter2 integer Array[4],
    --pay_by_quarter3 integer Array,
    schedule text[][]
);

insert into sal_emp
values(
    'Bill',
    '{10000,10000,10000,10000}',
    '{{"meeting","lunch"},{"trainning","presentation"}}');

insert into sal_emp
values(
    'Carol',
    '{10000,10000,10000,10000}',
    '{{"meeting","lunch"},{"trainning","presentation"}}');

insert into sal_emp
values(
    'Bill2',
    Array[30000,40000,50000,60000],
    Array[['test','rest'],['dinner','study']]
);
insert into sal_emp
values(
    'Carol2',
    Array[11111,22222,33333,44444],
    Array[['A','B'],['C','D'],['E','F']]
);
