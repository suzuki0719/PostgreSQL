do $$
declare
	i int:=0;
	j int:=0;
begin
	<<outer>>
	i=0;
	while true loop
		i=i+1;
		raise notice '%',i;
		exit when i=5;
		<<inner>>
		j=0;
		while true loop
			j=j+1;
			raise notice '%',j;
			exit when j=3;
		end loop;
	end loop;

end;

$$;