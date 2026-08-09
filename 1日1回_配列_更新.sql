drop function if exists f;
drop function if exists p;
drop function if exists hello;

BEGIN;
UPDATE sal_emp SET pay_by_quarter ='{111,222,333,444}' WHERE name='Bill';
UPDATE sal_emp SET pay_by_quarter[2]=999 WHERE name='Bill2';
UPDATE sal_emp SET pay_by_quarter =ARRAY[555,666,777,888] WHERE name='Carol';
UPDATE sal_emp SET pay_by_quarter[2:3]=ARRAY[222,333] WHERE name='Carol2';

select name,pay_by_quarter from sal_emp order by name asc;
COMMIT;