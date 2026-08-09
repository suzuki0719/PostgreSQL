drop function if exists f;
drop function if exists p;

create function f(refcursor,refcursor) returns SETOF refcursor AS $$
BEGIN
    open $1 for select * from test_00 order by id asc;
    return next $1;

    open $2 for select * from test_00 order by id desc;
    return next $2;
end; $$ LANGUAGE plpgsql;

BEGIN;
    select * from f('a','b');
    fetch all from a;
    fetch all in b;
commit;