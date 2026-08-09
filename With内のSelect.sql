drop table if exists orders;

create table orders(
    product  text,
    region   text,
    quantity int,
    amount   int
);


insert into orders(product,region,amount)
values
('apple','tokyo',1000),
('apple','tokyo',10),
('orange','tokyo',10),
('orange','tokyo',10),
('apple','chiba',10),
('apple','chiba',10),
('orange','chiba',10),
('orange','chiba',10),
('apple','kawagawa',1000),
('apple','kanagawa',10),
('orange','kanagawa',10),
('orange','kanagawa',10);



with regional_sales as (
    select region,product,sum(amount) as total_sales
    from orders group by region,product
),top_regions as (
    select region 
    from regional_sales 
    where total_sales > (select sum(total_sales)/10 from regional_sales)
)
select region, product,sum(total_sales) from regional_sales
where region in ( select region from top_regions)
group by region,product;

