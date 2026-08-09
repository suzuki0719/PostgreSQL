do $$
DECLARE 
    cur1 CURSOR (argId integer,argLen integer,argOffset integer)
        FOR select * from TEST_00 where id < argId order by id asc limit argLen offset argOffset for update;
    rec1 record;
BEGIN
    open cur1(8,3,2);
    loop
        move cur1;
        if NOT FOUND then exit;
        ELSE            
            --update TEST_00 set note='***' where current of cur1;
            UPDATE TEST_00 SET note = '***' WHERE CURRENT OF cur1;
        end if;

    end loop;
    close cur1;
end; $$ LANGUAGE plpgsql;


select * from TEST_00;