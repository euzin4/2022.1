drop function texto;
create function texto (texto varchar) returns void as $$
declare
	vtexto varchar;
begin
	vtexto=texto;
	raise notice '%',vtexto;
end;
$$ language 'plpgsql';

select texto('algo');
