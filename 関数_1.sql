drop procedure if exists p;
drop function if exists ff;
drop function if exists f;
drop function if exists func;
drop function if exists  hello;

create function hello( a out integer, b out text) returns record as $$
DECLARE
BEGIN
    a=123;
    b='OK'; 
    return;
end; $$ LANGUAGE plpgsql;


select hello();