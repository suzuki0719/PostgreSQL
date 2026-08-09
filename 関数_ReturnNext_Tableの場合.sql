drop procedure if exists p;
drop function if exists ff;
drop function if exists f;
drop function if exists func;
drop function if exists  hello;
drop function if exists  hello2;

create function hello() 
returns table(
    id integer,
    Name text
) as $$
DECLARE
    r myemp%rowtype;
BEGIN
    for r IN select * from myemp limit 10 loop
        id := r.id;
        Name := r.NAME;
        return next;
    end loop;
    return;
end; $$ LANGUAGE plpgsql;


do $$
DECLARE
    id integer;
    Name text;
BEGIN
    for id,Name IN select * from hello() loop        
        raise info 'a:% b:%',id,Name;
    end loop;

end; $$ LANGUAGE plpgsql;