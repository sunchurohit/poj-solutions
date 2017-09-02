// Randomly rotated Icosahedron (12 pts) and Cube (8 pts)
uses
  Tools;

var
  g: Double;
  i, j, k: Integer;

begin
  randseed := 34;
  RandomRotation;
  g := (1 + Sqrt(5)) / 2;
  for i := -1 to 1 do
    if i <> 0 then
      for j := -1 to 1 do
        if j <> 0 then begin
          AddBombR(0, i, j * g);
          AddBombR(i, j * g, 0);
          AddBombR(j * g, 0, i);
          for k := -1 to 1 do
            if k <> 0 then
              AddBombR(i, j, k);
        end;
  Shuffle;
  Done;
end.
