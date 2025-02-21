{Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un
programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.}


program ej4;

type 
	semanas=1..42;
	pesos=array [semanas] of real;


	
	paciente=record
		nombre:integer;
		apellido:integer;
		embarazo:pesos; 
	end;
	
	lista=^nodo;
	
	nodo=record
		p:paciente;
		sig:lista;
	end;

var	
	l:lista;
begin
	l:=nil;



end.
