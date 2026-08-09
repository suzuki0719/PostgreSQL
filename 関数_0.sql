drop procedure if exists p;
drop function if exists ff;
drop function if exists f;
drop function if exists func;
drop function if exists  hello;

create function hello( v IN integer) returns integer as $$
DECLARE
    ret integer;
BEGIN
    ret = v * 2;
    return ret;
end; $$ LANGUAGE plpgsql;


select hello(2);