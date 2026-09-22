drop table if exists tbl_集合;
drop table if exists tbl_集合_売上;
drop table if exists tbl_集合_master;
drop sequence if exists seq_集合;

create sequence seq_集合;

create table tbl_集合(
    s text
);

do $$
DECLARE
    i integer;

BEGIN
    for i in 0..10 loop
        insert into tbl_集合(s) values(myRndString(5));
    end loop;
end; $$ LANGUAGE plpgsql;

SELECT 
    *,
    row_number() OVER () AS ordinality
FROM tbl_集合;