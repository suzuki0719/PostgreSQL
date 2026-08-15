
select 
    string_agg(district,',' order by district DESC) filter(where city_id between 300 and 400)  as _300to400,
    string_agg(district,'-' order by district ASC ) filter(where city_id between 500 and 600) as _500to600
from address;