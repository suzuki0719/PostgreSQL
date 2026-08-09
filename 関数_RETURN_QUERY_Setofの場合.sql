drop procedure if exists p;
drop function if exists ff;
drop function if exists f;
drop function if exists func;
drop function if exists  hello;
drop function if exists  hello2;

create function hello() returns setof myemp as $$
DECLARE
BEGIN
    return query select * from myemp limit 10;
end; $$ LANGUAGE plpgsql;

do $$
DECLARE
    ret_id integer;
    poscode integer;
    ret_NAME text;
    age numeric(3,0);
BEGIN
    for ret_id,ret_NAME IN select id,NAME from hello() loop  
        raise info '%  %',ret_id,ret_NAME;      
    end loop;


end; $$ LANGUAGE plpgsql;