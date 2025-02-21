program tuvieja;

type
		
		
		auto=record
			patente:integer;
			color:string[10];
		end;
		
		lista=^nodo;
		
		nodo=record
			a:auto;
			sig:lista;
		end;
		
		
		
procedure insertarOrdenado(var l:lista; a:auto);
var
	nue,ant,act:lista;
begin
	new(nue);
	nue^.a:=a;
	ant:=l; act:=l;
	while(act<>nil) and (a.patente>act^.a.patente) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act=ant) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=nue;
end;

procedure agregarAdelante(var l:lista;a:auto);
var
	nue:lista;
begin
	new(nue);
	nue^.a:=a;
	nue^.sig:=l;
	l:=nue;
end;

procedure agregarAtras(var l:lista; ULT:lista; a:auto);
var
	nue:lista;
begin
	new(nue);
	nue^.a:=a;
	nue^.sig:=nil;
	if(l=nil) then
		l:=nue
		else ULT^.sig:=nue;
	ULT:=nue;
end;

begin

end.
