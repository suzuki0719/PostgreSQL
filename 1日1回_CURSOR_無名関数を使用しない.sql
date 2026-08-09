drop function if exists f;
drop function if exists p;

begin;
DECLARE cur CURSOR FOR SELECT * FROM test_00;
FETCH ALL IN CUR;
commit;
