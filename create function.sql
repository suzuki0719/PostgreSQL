drop function if exists sales_tax;

create function sales_tax(subtotal real) returns real as $$
DECLARE
  subtotal alias for $1;
BEGIN
  return subtotal * 0.6;
END
$$ language plpgsql;

select sales_tax(10);


---------------------------------------
drop function if exists sales_tax2;

create function sales_tax2(subtoal real, out tax real) as $$
DECLARE
  subtotal alias for $1;
BEGIN
  tax := subtotal * 0.9;
END
$$ language plpgsql;

select sales_tax2(10);


-----------------------------------------
drop function if exists sum_n_product;

CREATE FUNCTION sum_n_product(x int, y int, OUT sum int, OUT prod int) AS $$
BEGIN
    sum := x + y;
    prod := x * y;
END;
$$ LANGUAGE plpgsql;

select sum_n_product(1,2);

-----------------------------
drop table if exists aa;
create table aa(
  name text,
  address text
);
insert into aa VALUES
('yama','tokyo'),('kawa','chiba');



drop function if exists tmp_func;
CREATE FUNCTION tmp_func(arg text)
RETURNS TABLE(arg1 text, arg2 text) AS $$
BEGIN
    RETURN QUERY select name,address from aa where name=arg;
END;
$$ LANGUAGE plpgsql;

select tmp_func('yama');