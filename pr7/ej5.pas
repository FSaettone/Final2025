{5. Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100
camiones. De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en
toneladas que puede transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa. De
cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en kilómetros
recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura finaliza cuando
se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en
que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.

}


program ej5;

type
		
		camion=record
			patente:string[10];
			anio:integer;
			capacidad:integer;
		end;
	
	vCamion=array [1.100] of camion;
	
		viaje=record
			codViaje:integer;
			codCamion:integer;
			distancia:integer;
			destino:string[30];
			anio:integer;
			dni:integer;
		end;
		
		lista=^nodo;
		
		nodo=record
			v:viaje;
			sig:lista;
		end;	

procedure cargarDatos(var l:lista);
var 
	v:viaje;
begin
	readln(v.codViaje);
	while(v.codViaje<>-1) do begin
		
	
	
	end;
	

end;


var
	v:vCamion; l:lista;
Begin
	l:=nil;
	cargarDatos(l);



end.
		
		
		
