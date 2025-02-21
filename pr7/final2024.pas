{Una empresa ispone e una estructura de ddatos con las ventas e su comercio. De cada venta se conoce nro de venta, cant de productos y tipo e pago. 
se pide implementar un programa que genere una segundda estructura con las ventas cuya cantidad dde productos tenga mas digitos pares que impares. 
En la estructura generadddda deben quedar almacenadas las ventas de tipo de pago efectivo antes que las de tipo de pago con tarjeta.
}


program final2024;

type 
		
		venta=record
			nro:integer;
			cant:integer;
			pago:string[10];
		end;
			
		lista=^nodo;
		
		nodo=record
			v:venta;
			sig:lista;
		end;
		
function cumple(v:venta)  :boolean;
var
	num, dig, cantPar, cantImp:integer;
begin
	cantPar:=0; cantImp:=0;
	num:=v.cant;
	while(num<>0) do begin
		dig:=num mod 10;
		if(dig mod 2=0)then
			cantPar+=1
			else
			cantImp+=1;
		num:=num div 10;
	end;
	if(cantPar>cantImp) then
		cumple:=true
	else
		cumple:=false;
end;	

procedure insertarOrdenado(var l2:lista; v:venta);
var
	nue,ant,act:lista;
begin
	new(nue);
	nue^.v:=v;
	ant:=l2; act:=l2;
	while(act<>nil) and (v.pago<act^.v.pago) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(ant=act) then
		l2:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;


procedure procesarDatos(l:lista; var l2:lista);
begin
	while(l<>nil) do begin
		if(cumple(l^.v)) then
			insertarOrdenado(l2,l^.v);
		l:=l^.sig;
	end;
end;
		
var
	l,l2:lista;
	d: array[1..100] of integer; i:integer;
begin
	l:=nil; l2:=nil;
	//cargarDatos(l);
	procesarDatos(l,l2);
	
end.
		  
		 


 
			
			
			
		
	



