drop procedure if exists p;
drop function if exists ff;
drop function if exists f;
drop function if exists func;

create function func(empAge IN numeric(3,0), CNT IN OUT numeric(2,0)) as $$
DECLARE
BEGIN
    raise info 'CNT:%',CNT;
    select count(*) into CNT from myemp where age >=empAge;
    raise info 'CNT:%',CNT;

    return;
end; $$ LANGUAGE plpgsql;

do $$
DECLARE
    c numeric(2,0);
BEGIN
    SELECT CNT into c from func(40,c);
    raise info 'c:%',c;

end; $$ LANGUAGE plpgsql;