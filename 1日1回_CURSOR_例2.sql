drop function if exists f;
drop function if exists p;

begin;
declare cur scroll cursor for select * from test_00;
FETCH FORWARD 2 FROM cur;
FETCH 3 FROM cur;
fetch next from cur;
FETCH PRIOR FROM CUR;
FETCH LAST FROM CUR;
FETCH FIRST FROM CUR;
FETCH FORWARD ALL FROM CUR;



commit;

