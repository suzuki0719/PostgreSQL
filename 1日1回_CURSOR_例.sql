drop table if exists tmp_test;
drop function if exists tmp_reffunc;

do $$
DECLARE
    cur1 refcursor;
    rec1 record;

    myid integer;
    cur2 CURSOR FOR SELECT * FROM TEST_00 WHERE id=myid;
    rec2 record;

    cur3 CURSOR(argId integer) FOR SELECT * FROM TEST_00 WHERE id=argId;
    rec3 record;

BEGIN
    open cur1 for execute 'select * from TEST_00 where id < $1 ' using 5;
    loop
        fetch cur1 into rec1;
        if NOT FOUND then exit;
        else raise info '%',rec1;
        end if;
    end loop;
    close cur1;

    raise info '---------------------------------------------';
    myid = 3;
    open cur2;
    fetch cur2 into rec2;
    raise info '%',rec2;
    close cur2;

    raise info '---------------------------------------------';
    open cur3(2);
    fetch cur3 into rec3;
    raise info '%',rec3;


end; $$ LANGUAGE plpgsql;