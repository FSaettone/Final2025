{Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2020. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de
destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código
de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.}

program ej3;


type 


		viaje=record
			nro:integer;
			cod:integer;
			origen:string[40];
			destino:string[40];
			km:integer;
		end;
		
		lista=^nodo;
		
		nodo=record
			v:viaje;
			sig:lista;
		end;
		
procedure insertarOrdenado(var l:lista; v:viaje);
var
	nue,ant,act:lista;
begin
	new(nue);
	nue^.v:=v;
	act:=l; ant:=l;
	while(act<>nil) and (v.nro>l^.v.nro) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act=ant) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure procesarDatos(l:lista; var l2:lista);
var
	cod1,cod2,cant1,cant2:integer;
begin
	cod1:=0; cod2:=0; cant1:=0; cant2:=0;
	while(l<>nil) do begin
		if (l^.v.km>cant1) then begin
			cant2:=cant1;
			cod2:=cod1;     
			cant1:=l^.v.km;
			cod1:=l^.v.cod;
		end
		else if(l^.v.km>cant2) then
			cant2:=l^.v.km;
			cod2:=l^.v.cod;
		if(l^.v.km>5) then
			insertarOrdenado(l2,l^.v);
		l:=l^.sig;
	end;
	writeln('el viaje con mas km es el del auto codigo: ',cod1,' y el segunddo es el del auto con codigo: ',cod2);
end;		
		
var
	l,l2:lista;	
begin
	l:=nil;
	l2:=nil;
	//cargarDatos(l);
	procesarDatos(l,l2);
	
end.



