drop function if exists myRndString;
create function myRndString(arglength integer) returns text as $$
declare
    i integer;
    s text := '';
begin
    for i in 1..arglength loop
        s := s || chr(floor(random()*(122-65)+(65))::integer);
    end loop;
    return s;

end; $$ language plpgsql;


--select * from myRndString(10);