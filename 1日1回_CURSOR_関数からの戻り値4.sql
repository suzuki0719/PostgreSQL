drop function if exists f;
drop function if exists p;

CREATE OR REPLACE FUNCTION f() 
RETURNS TABLE (u_id INT, u_name TEXT) 
LANGUAGE plpgsql AS $$
BEGIN
    RETURN QUERY SELECT id, name FROM test_00;
END;
$$;

do $$
DECLARE
    cur refcursor;
    rec record;
BEGIN
    for rec in select * from f() loop
        --raise info '%',rec;
        raise info 'u_id:%  u_name:%',rec.u_id,rec.u_name;
    end loop;
end;
$$ LANGUAGE plpgsql; 


