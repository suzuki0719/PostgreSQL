drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;

do $$
DECLARE 
    arrays integer[] := ARRAY[11,12,13,14,15];
    r integer[];
BEGIN
    select array_agg(arrays[idx]) into r
    from(select generate_subscripts(arrays,1) as idx) foo;

    raise info '%',r;

end; $$ LANGUAGE plpgsql;
