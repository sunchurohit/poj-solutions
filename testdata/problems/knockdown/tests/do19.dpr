uses
  Tools;

var
  i: Integer;

begin
  randseed := 19;
  RandomDeflector;
  for i := 1 to MAX_N do
    AddRandomDeflectedBomb(3);
  Done;
end.
