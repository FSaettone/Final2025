{Una empresa dispone de una estructura de ddatos con las ventas de su comercio. De cada venta se conoce numero  de venta, cantidad de productos y tipo de  pago (efectivo o tarjeta).
Se pide implementar un programa que genere una segunda estructura con las ventas cuya cantidad de productos tenga mas digitos pares que impares. 
En la estructura generada deben quedar almacenadas las ventas de tipo de pago efectivo antes que las de tipo de pago con tarjeta,}
 
program final2024;

type
	pago=1..2;
	venta=record
		nro:integer;
		cant:integer;
		tipoPago:pago; //1 efectivo 2 tarjeta
	end;
	
	listaVentas=^nodo;
	
	nodo=record
		dato:venta;
		sig:listaVentas;
	end;

function cumple(v:venta): boolean ;
var 
	digito,cantPar,CantImpar:integer;
begin
	digito:=0; cantPar:=0; cantImpar:=0;
	while(v.cant<>0) do begin
		digito:=v.cant mod 10;
		if(digito div 2=0) then
			cantPar:=cantPar+1
		else
			cantImpar:=cantImpar+1;
	end;
	if (cantPar > cantImpar) then
		cumple:=true
		else
			cumple:=false;
end;
	
procedure InsertarOrdenado(var lista2:listaVentas; v:venta);
var 
	nue, ant, act:listaVentas;
begin
	new(nue);
	nue^.dato:=v;
	act:=lista2;
	ant:=lista2;
	while(act<>nil) and (act^.dato.tipoPago < v.tipoPago) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(ant=act) then 
		l:=nue
		else
			ant^.sig:=nue;
	nuew^.sig:=act;
end;

procedure procesarDatos(lista1:listaVentas; var lista2:listaVentas);

begin
		while(lista1<>nil) do begin
			if(cumple(lista1^.dato)) then
				InsertarOrdenado(lista2,lista1^.dato);
			lista1:=lista1^.sig;
		end;
end;	
	
var
	lista1,lista2:listaVentas;
begin
	lista1:=nil; lista2:=nil;
	//cargarDatos(lista1);
	procesarDatos(lista1,lista2);

end.
	

