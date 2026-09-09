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

create table tbl_hello(
    id integer default nextval('seq_hello'),
    s text,
    a integer[][]
);

do $$
declare
    rcnt integer;
    i integer;
    j integer;
    a integer[2][2];
    r integer[];
    r2 integer[];
begin

    r = Array[11,22];
    r2 = Array[33,44];

    a= Array[Array[1,2],Array[3,4]];
    raise info '%',a;

    a ='{}';
    a := Array[r];
    a := a || r2;
    a := array_cat(a,r2);
    raise info '%',a;

    for rcnt in 0..100 loop
        a := '{}';
        for i in 0..9 loop
            r :='{}';
            for j in 0..4 loop
                r := array_append(r,floor(random()*100));
            end loop;
            if i = 0 then
                a = Array[r];
            else
                a = a || r;
            end if;
        end loop;
        insert into tbl_hello(s,a) values(myRndString(3),a);
    end loop;
    
end; 
$$ LANGUAGE plpgsql;


select * from tbl_hello;