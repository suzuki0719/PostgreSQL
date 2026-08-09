drop procedure if exists p;
drop function if exists ff;
drop function if exists f;
drop function if exists func;
drop function if exists  hello;
drop function if exists  hello2;

create function hello() returns setof myemp as $$
DECLARE
    r_emp myemp%rowtype;
BEGIN
    for r_emp IN SELECT * FROM myemp order by id desc loop
        return next r_emp;
    end loop;
    return ;
end; $$ LANGUAGE plpgsql;

do $$
DECLARE
    row myemp%rowtype;
begin
    for row in select *  from hello() loop
        raise info '%',row;
    end loop;

end; $$ LANGUAGE plpgsql;

