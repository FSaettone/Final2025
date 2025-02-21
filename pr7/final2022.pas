{Práctica: Se dispone de la información de los participantes inscriptos a una carrera (a lo sumo 5000). De cad
participante se tiene DNI, nombre y apellido, categoría (1 .. 5) y fecha de inscripción. Se pide implementar u
programa que guarde en una estructura adecuada los participantes de aquellas categorías que posean a lo sumo 5
inscriptos. Se sabe que cada participante se puede anotar en una sola categoría.}

program final2022;

type
		categoria=1..5;
		
		participante=record
			dni:integer;
			nombre:string[30];
			cat:categoria;
			fecha:string[30];
		end;
		
		lista=^nodo;
		
		nodo=record
			p:participante;
			sig:lista;
		end;
		
		participantes=array[1..500] of participante;
		
		contador=array[categoria] of integer;
	
procedure cargarParticipantes(var v:participantes);
begin

//se dispone
end;	
	
		
procedure contar(v:participantes; var c:contador);
var
	i:integer;
begin
	for i:=1 to 500 do 
		c[v[i].cat]+=1;
end;

function cumple(p:participante; c:contador) :boolean;
begin
	cumple:= c[p.cat] >= 5; 
end;

procedure agregarAdelante(var l:lista; p:participante);
var 
	nue:lista;
begin
	new(nue);
	nue^.p:=p;
	nue^.sig:=l;
	l:=nue;
end;

procedure guardarDatos(v:participantes; c:contador; var l:lista);
var i:integer;
begin
	for i:=1 to 500 do begin
		if(cumple(v[i],c)) then
			agregarAdelante(l,v[i]);
	end;
end;


var 
	v:participantes; c:contador; l:lista;
begin
	l:=nil;
	cargarParticipantes(v);
	contar(v,c);
	guardarDatos(v,c,l);
end.
