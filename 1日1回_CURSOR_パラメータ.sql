do $$
DECLARE 
    cur1 CURSOR (argId integer,argLen integer,argOffset integer)
        FOR select * from TEST_00 where id < argId order by id asc limit argLen offset argOffset;
    rec1 record;
BEGIN
    open cur1(8,3,2);
    loop
        fetch cur1 into rec1;
        if NOT FOUND then exit;
        ELSE            
            raise info '%',rec1;
        end if;

    end loop;
    close cur1;
end; $$ LANGUAGE plpgsql;




