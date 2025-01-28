{ Se dispone de la informacion de los participantes inscriptos a una carrera (a lo sumo 500). De cada participante se 
tiene DNI, nommbre, apellido, categoria (1..5) y fecha de inscripcion. Se pide implementar un programma que guarde 
en una estructura adecuada los participantes de aquellas categorias que posean a lo sumo 50 inscriptos. 
Se sabe que cada participante se puede anotar en una sola categoria.
}

program final2022_09_08;

const  MaxP=499;
type
		cat=1..5;
		participante=record
			DNI:integer;
			nombre:string[30];
			apellido:string[30];
			categoria:cat;
			fechaInscripcion:string[10];
		end;
		
		
		vectorParticipantes=array [0..MaxP] of participante;
		vectorContadorCategorias=array[cat] of integer;

		listaP=^nodo;

		nodo=record
			dato:participante;
			sig:listaP;
		end;
		

procedure cargarParticipantes( var vp:vectorParticipantes);
var
	p:participante; i:integer;
begin
	i:=0;
	writeln('nombre'); readln(p.nombre);
	while(p.nombre<>'null') do begin
		writeln('categoria nro 1..5'); readln(p.categoria);
		vP[i]:=p;
		i:=i+1;
		writeln('nombre'); readln(p.nombre);
	end;
	writeln('Finalizo la carga');
end;

procedure inicializarContador(var vc:vectorContadorCategorias);
var i:integer;
begin 
	for i:=1 to 5 do
		vc[i]:=0;
	
	for i:=1 to 5 do
		writeln('posicion ,',i,' limpia');
end;

procedure contarParticipantes(vp:vectorParticipantes;  var vc:vectorContadorCategorias);
var i:integer;
begin
	for i:=0  to MaxP  do begin
		vc[vp[i].categoria]:=vc[vp[i].categoria] + 1;
	end;
end;

procedure agregarAdelante(var l:listaP; p:participante);
var
	nue:listaP;
begin
	new(nue);
	nue^.dato:=p;
	nue^.sig:=l;
	l:=nue;
end;

procedure guardarParticipantes(vp:vectorParticipantes;vc:vectorContadorCategorias; var l:listaP);
var 
	i,catActual:integer;
begin
	catActual:=0;
	for i:=0 to MaxP do begin
		catActual:=vp[i].categoria;
		if(vc[catActual]>=3) then
			agregarAdelante(l,vp[i]);
	end;
end;


var
	vp:vectorParticipantes; vc:vectorContadorCategorias; l:listaP;
begin
	l:=nil;
	inicializarContador(vc);
	cargarParticipantes(vp);
	contarParticipantes(vp,vc);
	guardarParticipantes(vp,vc,l);
end.
		
	


	
