{Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza
contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente
con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.
}


program ej2;

type 
	poliza=1..6;
	cliente=record
		cod:integer;
		dni:integer;
		nombre:string[30];
		apellido:string[30];
		pCod:poliza;
		monto:real;
	end;
	
	lista=^nodo;
	
	nodo=record
		c:cliente;
		sig:lista;
	end;
	
	vectorPoliza=array[poliza] of real;
	

procedure agregarAtras(var l:lista; c:cliente; var ULT:lista);
var
	nue:lista;
begin
	new(nue);
	nue^.c:=c;
	nue^.sig:=nil;
	if(l=nil) then
		l:=nue
		else
			ULT^.sig:=nue;
		ULT:=nue;
end;
	
procedure inicializarVector(var v:vectorPoliza);
var
		i:integer;
begin
	for i:=1 to 6 do 
		v[i]:=800;
end;
	
	
procedure cargarDatos(var l:lista);
var
	c:cliente; ULT:lista;
begin
	ULT:=nil;
	repeat 
		readln(c.cod);
		readln(c.nombre);
		readln(c.pCod);
		readln(c.monto);
		agregarAtras(l,c,ULT);
	until (c.cod=1111);
end;


{
procedure Eliminar (Var l: lista; cod:integer);
Var
 actual,ant:lista;

Begin
  actual:=l; 
  while (actual <> nil) do  // corta cuando termina la lista incluso luego de haber eliminado 
  begin
    if (actual^.datos.cod <> cod) then begin 
        ant:=actual;                                  //recorre la lista con dos var auxiliares
        actual:= actual^.sig
    end
    else 
    begin
		if (actual = l) then 
			l:= l^.sig			
			else 
			ant^.sig:= actual^.sig;
		dispose (actual);
      actual:= ant;
    end;
  end;
End;
}


procedure incisoA(var l:lista;v:vectorPoliza);
begin
	while(l<>nil) do begin
		writeln('debe pagar: ',l^.c.monto+v[l^.c.pCod]);
		//alta paja poner todos los writeln al re pedo
		//jaja le da paja una compu
	end;
end;

function cumple (dni:integer) :boolean;
var 	
	cant:integer;
begin
	cant:=0;
	while(dni<> 0) do begin
		if(dni mod 10 = 9) then
			cant+=1;
		dni:=dni div 10;
	end;
	if(cant>=2) then
		cumple:=true
		else cumple:=false;
end;

procedure incisoB(l:lista);
begin
	while(l<>nil) do begin
		if(cumple(l^.c.dni)) then
			writeln('aca se imprimen nombre y apellido si tiene al menos dos digitos 9');
		l:=l^.sig;
	end;
end;
	
procedure incisoC(var l:lista);
var 
	cod:integer; seEncontro:boolean; ant:lista;
begin
	seEncontro:=false;
	readln(cod);
	while(l<>nil) or (seEncontro=false) do begin
		ant:=l;
		if(l^.c.cod=cod) then begin
			ant^.sig:=l^.sig;
			seEncontro:=true;
			dispose(l);     // todo el inciso C es a revisar ya que lo hice de 0 pensando como tendria que ser.
		end;
		if(seEncontro=false) then
			l:=l^.sig;
	end;
end;



var
	l:lista; v:vectorPoliza;
begin
	l:=nil;
	inicializarVector(v);
	cargarDatos(l);
	incisoA(l,v);
	incisoB(l);
//	incisoC(l);
end.
	
