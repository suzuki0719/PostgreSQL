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


-------------------------------------------
/*
PL/pgSQL関数の戻り値が多様型（anyelement、anyarray、anynonarray、anyenumまたはanyrange）として宣言されると、
特別な$0パラメータが作成されます。 このデータ型が、
実際の入力型から推定（項35.2.5を参照）された関数の実際の戻り値型です。 $0はNULLで初期化され、関数内で変更することができます。 ですので、必須ではありませんが、これを戻り値を保持するために使用しても構いません。 また$0に別名を付与することもできます。 例えば、以下の関数は+演算子を持つ任意のデータ型に対して稼働します。
*/
drop function if exists tmp_func;
create function tmp_func(v1 anyelement,v2 anyelement, v3 anyelement)
returns anyelement as $$
DECLARE 
  result alias for $0;
BEGIN
  result := v1 + v2 v3;
  return result;
END
$$ LANGUAGE plpgsql;

select tmp_func(2,3,4);


------------------------------------------------------------------
/*
1つ以上の出力パラメータを多様型として宣言することにより、同様の結果を得ることができます。 
この場合、特殊な$0パラメータは使用されません。 出力パラメータ自身が同じ目的を果たします。 
*/
drop function if exists tmp_func;
CREATE FUNCTION tmp_func(v1 anyelement, v2 anyelement, v3 anyelement,
                                 OUT sum anyelement)
AS $$
BEGIN
    sum := v1 + v2 + v3;
END;
$$ LANGUAGE plpgsql;