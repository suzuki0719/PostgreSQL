drop function if exists f;
drop function if exists p;

do $$
DECLARE
    cur1 CURSOR for SELECT * FROM TEST_00;
    cur2 CURSOR(argId integer) for select * from TEST_00 where id <=argId;

BEGIN
    -- r はloopの中で自動生成される。カーソルをクローズする必要はない
    for r in cur1 loop
        raise info '%',r;
    end loop;

    raise info '------------------------';
    for r in cur2(5) loop
        raise info '%',r;
    end loop;

end; $$ LANGUAGE plpgsql;
