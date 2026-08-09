drop function if exists f;
drop function if exists p;
create function f(in argLimit integer,out rc1 refcursor)  as $$
DECLARE
    cur1 refcursor;
BEGIN
    open cur1 for select * from test_00 limit argLimit;
    rc1:=cur1;
    return; 
end; $$ LANGUAGE plpgsql;

do $$
DECLARE
    c1 refcursor;
    r1 record;
    myId int;
    myName text;
    myAddress text;
    myAge int;
BEGIN
    select rc1 into c1 from f(5);
    fetch c1 into r1;
    raise info '%',r1;

    fetch c1 into myId,myName,myAddress,myAge;
    raise info '% % % %',myId,myName,myAddress,myAge;

    close c1;

end; $$ LANGUAGE plpgsql;
