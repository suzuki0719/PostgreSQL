drop table if exists tbl_集合;
drop table if exists tbl_集合_売上;
drop table if exists tbl_集合_master;
drop sequence if exists seq_集合;

create sequence seq_集合;

create table tbl_集合_master(
   item_id integer primary key   default nextval('seq_集合'),
   name text,
   price money
);

create table tbl_集合_売上(
    item_id integer references tbl_集合_master(item_id),
    amount integer,
    hizuke  date
);

insert into tbl_集合_master(name,price)
values 
('apple',1000),
('lemon',2000),
('orange',3000);

do $$
declare
    i integer;
    itemcnt integer;
begin
    select count(*) into itemcnt from tbl_集合_master;
    for i in 0..100 loop
        insert into tbl_集合_売上(item_id,amount,hizuke)
        values (
            floor(random()*itemcnt)+1,
            floor(random()*100)::integer,
            current_date - floor(random()*100)::integer
        );
    end loop;
end; $$ LANGUAGE plpgsql;


select row_number() OVER (partition by sales.hizuke) AS ordinality,master.name,sales.hizuke from tbl_集合_master as master
inner join tbl_集合_売上 as sales using(item_id)
order by sales.hizuke desc;
