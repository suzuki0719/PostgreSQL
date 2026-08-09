drop function if exists f;
drop function if exists p;

create function f(argId integer) returns  refcursor as $$ 
DECLARE
    cur1 CURSOR(pId integer) FOR SELECT * FROM TEST_00 WHERE id <pId;
BEGIN
    open cur1(argId);
    return cur1;
end; $$ LANGUAGE plpgsql;


do $$
DECLARE
    c refcursor;
    r record;
BEGIN
    select * into c from f(3);
    loop
        fetch c into r;
        if NOT FOUND then exit;
        else raise info '%',r;
        end if;
    end loop;
    close c;

end; $$ LANGUAGE plpgsql;
