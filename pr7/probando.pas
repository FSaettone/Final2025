program ejercicio;


function auxiliar(val:integer): integer;
begin
	val := val * val;
	auxiliar := val;
end;

procedure calculo(c: integer; var b:integer);
begin
	b := b + c DIV 4;
end;

var
a,b:integer;
begin
a := 16;
b := 6;
calculo(auxiliar(a),b);
writeln(b);
end.
