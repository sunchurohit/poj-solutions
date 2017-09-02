uses
	math;
const
	s: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
var
	m, n: longint;
	b: array [1..30, 1..30] of longint;
	a: array [1..30, 1..30] of char;
	i, j: longint;
	k: longint;
begin
	m := 20;
	n := 20;
	randseed := 0927340;

	k := 1;
    for i := 1 to m do
    	for j := 1 to n do begin
    		a[i][j] := s[k];
    		if ((random(8) = 0) or (j = n)) and (k < length(s)) then
    			inc(k);
    	end;

	writeln(m, ' ', n);
	for i := 1 to m do begin
		for j := 1 to n do begin
			write(a[i][j]);
		end;
		writeln;
	end;
end.