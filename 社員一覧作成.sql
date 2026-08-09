drop table if exists member;
drop table if exists mydep;
drop table if exists myemp;
drop table if exists mypos;
drop sequence if exists empid;
drop procedure if exists regemp;

create sequence empid;

create table mypos(
    poscode integer primary key,
    NAME    text unique not null
);

create table mydep (
    id      integer primary key,
    NAME    text
);

create table myemp(
    id      integer primary key,
    poscode integer not null references mypos(poscode), 
    NAME    text,
    age     numeric(3,0)
);



create table member(
    empid   integer not null references myemp(id),
    depid   INTEGER not null references mydep(id),
    primary key(empid,depid)
);

create procedure regemp(
        count in integer,
        depid in integer,
        poscode in integer,
        empname in text,
        age in integer
        ) as $$
DECLARE
BEGIN
    if count < 1 then return;
    elseif count = 1 THEN
        INSERT INTO myemp(id,poscode,name,age) values((select nextval('empid')),poscode,empname,age);
        INSERT INTO member(empid,depid) values(currval('empid'),depid);
    ELSE
        for i in 1..count loop
            INSERT INTO myemp(id,poscode,name,age) values((select nextval('empid')),poscode,empname || '_' || i,age);
            INSERT INTO member(empid,depid) values(currval('empid'),depid);
        end loop;
    end if;


end; $$ LANGUAGE plpgsql;

do $$
DECLARE
BEGIN
    --Rest the sequence of empid
    perform setval('empid',1,false);

    INSERT INTO mydep(id,name) 
    values (0,'営業部'),
            (1,'開発部'),
            (2,'人事部');

    INSERT INTO mypos(poscode, name)
    values (0,'部長'),
            (1,'課長'),
            (2,'係長'),
            (3,'社員');

    call regemp(1,0,0,'営業部長',40);
    call regemp(1,1,0,'開発部部長',45);
    call regemp(1,2,0,'人事部部長',50);

    call regemp(3,0,1,'営業課長',30);
    call regemp(3,1,1,'開発部課長',30);
    call regemp(3,2,1,'人事部課長',30);

    call regemp(30,0,2,'営業主任',25);
    call regemp(30,1,2,'開発部主任',26);
    call regemp(30,2,2,'人事部主任',27);

    call regemp(100,0,3,'営業社員',20);
    call regemp(100,1,3,'開発部社員',21);
    call regemp(100,2,3,'人事部社員',22);



END;
$$ LANGUAGE plpgsql;

select * from mydep;
select * from mypos;
select * from myemp;
select * from member;
