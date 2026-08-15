drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;
drop sequence if exists tmp_seq;

create function f() returns setof text as $$
declare
    r TEST_CITY%rowtype;
begin
    for r in select *  from TEST_CITY
    loop
        return next r.name;
    end loop;
end; $$ LANGUAGE plpgsql;

do $$
declare
    s text[];
    r text;
    name text;
begin
    for r in select * from f()
    loop
        s := array_append(s,r);
    end loop;

    for name in select unnest(s) loop
        raise info '%',name;
    end loop;


end $$ LANGUAGE plpgsql;



    


