{$q+,r+,o-}
uses
    sysutils;
type
    tpos = array [1..9] of longint;

var
    v, s: array [1..9, 0..4] of char;
    c: array [0..1953125] of double;
    u: array [0..1953125] of boolean;

function encode(var p: tpos): longint;
var
    i: longint;
    q: longint;
begin
    result := 0;
    q := 1;
    for i := 1 to 9 do begin
        result := result + p[i] * q;
        q := q * 5;
    end;
end;

function pr(var p: tpos): double;
var
    code: longint;
    i, j: longint;
    q: longint;
begin
    code := encode(p);
    if not u[code] then begin
        u[code] := true;
        c[code] := 0;
        q := 0;
        for i := 1 to 9 do begin
            for j := i + 1 to 9 do begin
                if v[i][p[i]] = v[j][p[j]] then begin
                    dec(p[i]);
                    dec(p[j]);
                    c[code] := c[code] + pr(p);
                    inc(p[i]);
                    inc(p[j]);

                    inc(q);
                end;
            end;
        end;
        if q <> 0 then begin
            c[code] := c[code] / q;
        end;
    end;
    pr := c[code];
end;

var
    ch: char;
    i, j, k, l: longint;
    p: tpos;
begin
    assign(input, 'double.in'); reset(input);
    assign(output, 'double.out'); rewrite(output);

    for i := 1 to 9 do begin
        for j := 1 to 4 do begin
            read(v[i][j]);
            assert(v[i][j] in ['6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']);
            read(s[i][j]);
            assert(s[i][j] in ['C', 'S', 'D', 'H']);
            read(ch);
            if j < 4 then begin
                assert(ch = ' ');
            end else begin
                assert(ch = #13);
                read(ch);
                assert(ch = #10);
            end;
        end;
    end;
    assert(eof);

    for i := 1 to 9 do begin
        for j := 1 to 4 do begin
            for k := 1 to 9 do begin
                for l := 1 to 4 do begin
                    assert((i = k) and (j = l) or (v[i][j] <> v[k][l]) or (s[i][j] <> s[k][l]));
                end;
            end;
        end;
    end;

    for i := 1 to 9 do begin
        v[i][0] := chr(i);
    end;

    for i := 1 to 9 do begin
        p[i] := 4;
    end;

    u[0] := true;
    c[0] := 1;
    writeln(pr(p):0:10);

    close(input);
    close(output);
end.