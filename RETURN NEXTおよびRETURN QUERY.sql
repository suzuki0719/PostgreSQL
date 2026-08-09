drop function if exists get_all_foo;
drop function if exists get_all_foo2;
drop table if exists foo;



create temp table foo(fooID int,foosubID int, fooName text);
insert into foo values (1,2,'three');
insert into foo values (3,4,'seven');

create or replace function get_all_foo() returns setof foo as $BODY$
DECLARE
  r foo%rowtype;
BEGIN
  for r in 
    select * from foo where fooID > 0
  loop
    return next r;
  end loop;
  return;

END $BODY$
language plpgsql;


select get_all_foo();

----------------------------------------------------------------------
--create or replace function get_all_foo2() returns table(a int,b int,c text) AS $$
create or replace function get_all_foo2() returns setof foo as $$
DECLARE
DECLARE
  r foo%rowtype;
BEGIN
  return query select * from foo where fooID > 0;
  return;
END $$
language plpgsql;


select get_all_foo2();