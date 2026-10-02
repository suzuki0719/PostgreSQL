select * 
from information_schema.tables
where table_type = 'BASE TABLE'
and table_schema = 'public'
order by table_name asc;