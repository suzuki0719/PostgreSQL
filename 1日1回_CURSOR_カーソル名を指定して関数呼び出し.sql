drop function if exists f;
drop function if exists p;

create function f(refcursor) returns refcursor as $$
BEGIN
    open $1 for select * From test_00;
    return $1;
end; $$ LANGUAGE plpgsql;

BEGIN;
    select f('hello');
    fetch all in hello;
commit;
