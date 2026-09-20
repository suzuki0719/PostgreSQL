
drop table if exists tbl_Array;
drop table if exists tbl_Array2;
drop sequence if exists seq_Array;
create sequence seq_Array 
start with 100
cycle
maxvalue 200
increment 10;

create table tbl_Array(
    id integer default nextval('seq_Array'),
    s text,
    a integer[]
);

create table tbl_Array2(
    a integer[],
    a2 text[][]
);


do $$
declare
    i integer;
    a integer[];
    a2 text[][];
begin
    --NULLの場合は明示的なキャストが必要
    a:=array_fill(NULL::integer,Array[5]);
    insert into tbl_Array2(a) values(a);

    --2次元配列の初期化
    a2:=array_fill('a'::text,Array[3,5]);
    insert into tbl_Array2(a2) values(a2);

    

end; $$ LANGUAGE plpgsql;

select * from tbl_Array2;