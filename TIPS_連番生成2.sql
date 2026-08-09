drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;


do $$
DECLARE
    idx integer[];
    elem integer;
BEGIN
    select array_agg(s) into idx
    from generate_subscripts('{1,2,3}'::integer[],1) as s;

    FOREACH elem IN ARRAY idx LOOP
        RAISE NOTICE '要素: %', elem;
    END LOOP;

end; $$ LANGUAGE plpgsql;