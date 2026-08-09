drop function if exists f;
drop function if exists p;

do $$
DECLARE
    cur1 CURSOR for SELECT * FROM TEST_00;
    cur2 CURSOR(argId integer) for select * from TEST_00 where id <=argId;

    rec1 record;
    rec2 record;
BEGIN
    for rec1 in cur1 loop
        raise info '%',rec1;
    end loop;

    for rec2 in cur2(2) loop
        raise info '%',rec2;
    end loop;

end; $$ LANGUAGE plpgsql;
