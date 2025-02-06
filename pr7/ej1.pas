{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura
finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo 1º elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.} 

program ej1;

type
		codigo=1..5;
		persona=record
			dni:integer;
			apellido:string[30];
			nombre:string[30];
			edad:integer;
			cod:codigo;
		end;
		
		lista=^nodo;
		
		nodo=record
			p:persona;
			sig:lista;
		end;
		
		vectorContador=array [codigo] of integer;

procedure inicializarContador(var v:vectorContador);
var i:integer;
begin
	for i:=1 to 5 do 
		v[i]:=0;
end;
procedure agregarAdelante(var l:lista; p:persona);
var 
	nue:lista;
begin
	new(nue);
	nue^.p:=p;
	nue^.sig:=l;
	l:=nue;
end;



procedure cargarPersonas(var l:lista; var v:vectorContador);
var
	p:persona;
begin
	repeat
		writeln('ingrese dni') ;readln(p.dni);
		writeln('ingrese numero categoria 1..5');readln(p.cod); 
		v[p.cod]+=1;
		agregarAdelante(l,p)
	until (p.dni=333);
		writeln('finalizo la carga');
end;

function cumple (dni:integer) :boolean;
var cantP,cantImp:integer;
begin
	cantP:=0; cantImp:=0;
	while(dni <> 0) do begin
		if(dni mod 2=0) then
			cantP+=1
			else cantImp+=1;
		dni:=dni div 10;
	end;
	if (cantP>cantImp) then 
	cumple:= true 
	else cumple:=false;
end;

procedure incisoA(l:lista);
var cant:integer;
begin
	cant:=0;
	while(l<>nil) do begin
		if(cumple(l^.p.dni)) then
			cant+=1;
		l:=l^.sig;
	end;
	writeln('la cantidad de personas que tienen el dni con mas digitos pares que impares es de: ',cant);
end;

procedure incisoB(v:vectorContador);
var i,codMax, codMax2,cant1,cant2:integer;
begin
	cant1:=0; cant2:=0;
	codMax:=-1; codMax2:=-1;
	for i:= 1 to 5 do begin
		if(v[i]>cant1) then begin
			codMax:=i;
			cant1:=v[i];
		end
		else if (v[i]>cant2) then begin
			codMax2:=i;
			cant2:=v[i];
		end;
	end;
	writeln('el genero con  mas inscriptos es el numero: ',codMax,' con ',cant1,' inscriptos. El segundo con mas inscriptos es el numero: ',codMax2,' con ',cant2,' inscriptos.');
end;


procedure incisoC(var l:lista);
var 
	dni:integer; seBorro:boolean; ant:lista;
begin
	seBorro:=false;
	writeln('ingrese un dni que quiera eliminar'); readln(dni);
	while(l<>nil) or (seBorro) do begin
		ant:=l; // hago una copia del puntero actual para luego realizar el enganche con el siguiente al nodo a borrar.
		if(l^.p.dni=dni) then begin
			ant^.sig:=l^.sig;
			dispose(l);
			seBorro:=true;
		end;
		l:=l^.sig;
	end;
	if(seBorro) then
		writeln('Se ha borrado la persona con dni ',dni)
		else
			writeln('no se ha encontrado la persona con el dni ingresado');
end;

var
	l:lista; v:vectorContador;
begin
	inicializarContador(v);
	cargarPersonas(l,v);
	incisoA(l);
	incisoB(v);
	incisoC(l);
end.
		
	
		
	


