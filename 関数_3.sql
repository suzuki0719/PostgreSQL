drop procedure if exists p;
drop function if exists ff;
drop function if exists f;
drop function if exists func;
drop function if exists  hello;

create function hello(a out integer, b out integer, c out integer) returns record as $$
BEGIN
    a = 100;
    b = 200;
    c = 300;

    return;
end; $$ LANGUAGE plpgsql;

do $$
DECLARE
    r record;
BEGIN
    select * into r from hello();
    raise info '% % %',r.a,r.b,r.c;
end; $$ LANGUAGE plpgsql;