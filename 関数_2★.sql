drop procedure if exists p;
drop function if exists ff;
drop function if exists f;
drop function if exists func;
drop function if exists  hello;

create function hello(arg0 IN OUT integer, arg1 IN OUT integer) returns record as $$
BEGIN
    arg0 = arg0 * 10;
    arg1 = arg1 * 100;
    return;
end; $$ LANGUAGE plpgsql;

do $$
DECLARE
    v0 integer;
    v1 integer;
    r0 record;
    r1 record;
BEGIN
    select * into r0  from hello(1,2);
    select arg0,arg1 into r1  from hello(1,2);
    select arg0,arg1 into v0,v1  from hello(1,2);
    
    raise info 'v0:%',v0;
    raise info 'v1:%',v1;
    raise info 'r0:%',r0;
    raise info 'r1:%',r1;

end; $$ LANGUAGE plpgsql;