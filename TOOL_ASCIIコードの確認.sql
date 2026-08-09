drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop table if exists tbl_ASCIIコードの確認;
drop sequence if exists tmp_seq;

create table tbl_ASCIIコードの確認(
    code integer,
    name text,
    val  integer
);

do $$
DECLARE
    i integer;
    s text;
BEGIN
    for i in 65..90 loop
        insert into tbl_ASCIIコードの確認(code,name,val) values 
        (i,chr(i),floor(random()*100));
    end loop;

    for i in 97..122 loop
        insert into tbl_ASCIIコードの確認(code,name,val) values 
        (i,chr(i),floor(random()*100));
    end loop;



end; $$ LANGUAGE plpgsql;

select * from tbl_ASCIIコードの確認;
