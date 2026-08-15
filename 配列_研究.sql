drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_配列テスト;
drop sequence if exists tmp_seq;

create table tbl_配列テスト(id integer,name text, Arr integer[]);
do $$
declare 
    a integer[];
BEGIN
    for i in 1..10 loop
        a := '{}';
        for j in 1..floor(random()*3)+1 loop
            a := array_append(a,floor(random()*100));
        end loop;
        insert into tbl_配列テスト(id,name,Arr) 
        values(i,myRndString(10),a);
    end loop;
end;$$ LANGUAGE plpgsql;

do $$
declare
    i integer;
    ary integer[];
    cur refcursor;
    rec record;
begin
    ary :='{}';
    for i in 1..3 loop
        ary := array_append(ary,1);
    end loop;

    --最初の配列が2番目を含んでいるか(AND)?
    open cur for select * from tbl_配列テスト where Arr @> Array[10,11];
    loop
        fetch cur into rec; 

        if NOT FOUND then exit;
        else raise info '%',rec;
        end if;

    end loop;
    close cur;


    raise info '---------------------------------';
    --■最初の配列が2番目に含まれているか?'(AND);
    open cur for select * from tbl_配列テスト where Array[10,11] <@ Arr;
    loop
        fetch cur into rec;
        if NOT FOUND then exit;
        else raise info '%',rec;
        end if;
    end loop;
    close cur;

    raise info '---------------------------------';
    --■配列は重なっているか?'(OR);
    open cur for select * from tbl_配列テスト where Arr && Array[99,88];
    loop
        fetch cur into rec;
        if NOT FOUND then exit;
        else raise info '%',rec;
        end if;
    end loop;
    close cur;

    raise info '---------------------------------';
    --■配列を結合
    ary='{}';
    open cur for select * from tbl_配列テスト;
    loop
        fetch cur into rec;
            if NOT FOUND then exit;
            else ary:= ary || rec.Arr;
            end if;
    end loop;
    close cur;
    raise info '%',ary;
        


end; $$ language plpgsql;

select * from tbl_配列テスト;

/*
select Array[1,2,3] @> Array[3,4]; --OR
select Array[1,2,3] && Array[3,4]; --AND
*/


