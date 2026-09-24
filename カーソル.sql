drop table if exists tbl_カーソル;
drop sequence if exists seq_カーソル;

create sequence seq_カーソル
start with 1
cycle
maxvalue 100;

create table tbl_カーソル(
    id integer default nextval('seq_カーソル'),
    s  text,
    v  integer
);

do $$
declare
    i integer;
begin
    for i in 0..100 loop
        insert into tbl_カーソル(s,v) values(myRndString(5),floor(random()*100));
    end loop;
end; $$ LANGUAGE plpgsql;

do $$
declare
    myid integer;

    cur1 CURSOR for select * from tbl_カーソル limit 3;
    rec1 record;

    cur2 refcursor;
    rec2 record;

    cur3 refcursor;
    rec3 record;

    cur4 CURSOR for select * from tbl_カーソル where id=myid;
    rec4 record;

    cur5 CURSOR (key integer) FOR SELECT * FROM tbl_カーソル WHERE id = key;
    rec5 record;

    cur6 scroll CURSOR for select * from tbl_カーソル;
    rec6 record;

begin
    open cur1;
    loop
        fetch cur1 into rec1;
        if NOT FOUND then exit;
        else raise info 'rec1:%',rec1;
        end IF;
    end loop;
    close cur1;

    myid := floor(random()*100)::integer;
    raise info 'myid:%',myid;
    open cur2 for select * from tbl_カーソル t where t.id = myid;
    fetch cur2 into rec2;
    raise info 'rec2:%',rec2;
    close cur2;

    open cur3 for execute 'select * from tbl_カーソル where id=$1' using myid;
    fetch cur3 into rec3;
    raise info 'rec3:%',rec3;
    close cur3;

    open cur4;
    fetch cur4 into rec4;
    raise info 'rec4:%',rec4;
    close cur4;


    open cur5(key:=10);
    fetch cur5 into rec5;
    raise info 'rec5:%',rec5;
    close cur5;


    open cur6;
    fetch cur6 into rec6;
    raise info 'rec6:%',rec6;

    move forward 1 from cur6;
    fetch cur6 into rec6;
    raise info 'rec6:%',rec6;

    move forward 1 from cur6;
    fetch relative 0 from cur6 into rec6;
    raise info 'rec6(FORWARD):%',rec6;

    fetch cur6 into rec6;
    move first from cur6;
    fetch relative 0 from cur6 into rec6;
    raise info 'rec6(LAST):%', rec6;

    move last from cur6;
    fetch relative 0 from cur6 into rec6;
    raise info 'rec6(LAST):%', rec6;

    move first from cur6;
    move forward 3 from cur6;
    update  tbl_カーソル set s = '****' where current of cur6;
    close cur6;

end; $$ LANGUAGE plpgsql;

select * from tbl_カーソル order by id  asc limit 10;

/*
do $$
declare
    cur1 cursor for select * from tbl_カーソル;
    rec1 record;
begin
    OPEN cur1;
     loop
        fetch cru1 into rec1;
        if NOT FOUND then exit;
        else raise info '%',rec1;
    end loop;
    close cur1;
end; $$ LANGUAGE plpgsql;
*/

