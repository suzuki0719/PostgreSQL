drop function if exists func_hello;
drop function if exists func_world;


--戻り値を return型とする場合
CREATE OR REPLACE FUNCTION func_hello(lmt integer)
RETURNS SETOF record AS $$
DECLARE
    r record;
BEGIN
    FOR r IN SELECT actor_id,first_name::text FROM actor limit lmt LOOP
        RETURN NEXT r;
    END LOOP;
    RETURN;
END;
$$ LANGUAGE plpgsql;

select actor_id,first_name from func_hello(3) as t(actor_id int,first_name text);
select * from func_hello(3) as t(actor_id int,first_name text);



--戻り値を actor%rowtypeとする場合
CREATE OR REPLACE FUNCTION func_world(lmt integer)
RETURNS SETOF actor AS $$
DECLARE
    r actor%rowtype;
BEGIN
    FOR r IN SELECT actor_id,first_name::text FROM actor limit lmt LOOP
        RETURN NEXT r;
    END LOOP;
    RETURN;
END;
$$ LANGUAGE plpgsql;

select actor_id,first_name from func_world(3);
select * from func_world(3);
