unit wbNifMath;

interface

type
  TMatrix33 = array [0..2, 0..2] of Extended;

  TQuaternion = packed record
    case Integer of
      0: (q: array [0..3] of Extended);
      1: (w, x, y, z: Extended)
  end;

  TVector2 = packed record
    class operator Add(const A, B: TVector2): TVector2; inline;
    class operator Subtract(const A, B: TVector2): TVector2; inline;
    class operator Multiply(const A, B: TVector2): TVector2; inline;
    case Integer of
      0: (v: array [0..1] of Extended);
      1: (x, y: Extended)
  end;
  TVector2Array = array of TVector2;
  PVector2 = ^TVector2;

  TVector3 = packed record
    class operator Add(const A, B: TVector3): TVector3; inline;
    class operator Subtract(const A, B: TVector3): TVector3; inline;
    class operator Subtract(const A: TVector3; const B: Extended): TVector3; inline;
    class operator Multiply(const A, B: TVector3): TVector3; inline;
    class operator Multiply(const A: TVector3; const B: Extended): TVector3; inline;
    class operator Divide(const A: TVector3; const B: Extended): TVector3; inline;
    function IsZero: Boolean;
    function Length: Extended;
    procedure Normalize;
    case Integer of
      0: (v: array [0..2] of Extended);
      1: (x, y, z: Extended)
  end;
  TVector3Array = array of TVector3;
  PVector3 = ^TVector3;

  TSingleVector3 = packed record
    case Integer of
      0: (v: array [0..2] of Single);
      1: (x, y, z: Single)
  end;
  PSingleVector3 = ^TSingleVector3;

  TTriangle = array [0..2] of Integer;
  TTriangleArray = array of TTriangle;
  PTriangle = ^TTriangle;

  TStrip = array of Word;
  TStripArray = array of TStrip;

procedure M33ToEuler(const m: TMatrix33; var x, y, z: Extended);
procedure EulerToM33(const x, y, z: Extended; var m: TMatrix33);
procedure M33ToQuaternion(const m: TMatrix33; var Quat: TQuaternion);
procedure QuaternionToAxisAngle(const Quat: TQuaternion; var a, x, y, z: Extended);
procedure AxisAngleToQuaternion(a, x, y, z: Extended; var Quat: TQuaternion);
procedure EulerToQuaternion(const x, y, z: Extended; var Quat: TQuaternion);
procedure QuaternionToEuler(const Quat: TQuaternion; var x, y, z: Extended);
procedure M33ToAxisAngle(const m: TMatrix33; var a, x, y, z: Extended);
procedure AxisAngleToM33(const a, x, y, z: Extended; var m: TMatrix33);

function Triangulate(const strip: TStrip): TTriangleArray; overload;
function Triangulate(const strips: TStripArray): TTriangleArray; overload;

procedure CalculateCenterRadius(
  const verts: TVector3Array;
  var center: TVector3;
  var r: Extended;
  aFromMinMax: Boolean = False
);

procedure CalculateFaceNormals(
  const verts: TVector3Array;
  const triangles: TTriangleArray;
  var norms: TVector3Array
);

procedure CalculateTangentsBitangents(
  const verts, norms: TVector3Array;
  const texco: TVector2Array;
  const triangles: TTriangleArray;
  var tan, bin: TVector3Array
);


implementation

uses
  Math;

class operator TVector2.Add(const A, B: TVector2): TVector2;
begin
  Result.X := A.X + B.X;
  Result.Y := A.Y + B.Y;
end;

class operator TVector2.Subtract(const A, B: TVector2): TVector2;
begin
  Result.X := A.X - B.X;
  Result.Y := A.Y - B.Y;
end;

class operator TVector2.Multiply(const A, B: TVector2): TVector2;
begin
  Result.X := A.X * B.X;
  Result.Y := A.Y * B.Y;
end;

class operator TVector3.Multiply(const A: TVector3; const B: Extended): TVector3;
begin
  Result.X := A.X * B;
  Result.Y := A.Y * B;
  Result.Z := A.Z * B;
end;

class operator TVector3.Divide(const A: TVector3; const B: Extended): TVector3;
begin
  Result.X := A.X / B;
  Result.Y := A.Y / B;
  Result.Z := A.Z / B;
end;

class operator TVector3.Add(const A, B: TVector3): TVector3;
begin
  Result.X := A.X + B.X;
  Result.Y := A.Y + B.Y;
  Result.Z := A.Z + B.Z;
end;

class operator TVector3.Subtract(const A, B: TVector3): TVector3;
begin
  Result.X := A.X - B.X;
  Result.Y := A.Y - B.Y;
  Result.Z := A.Z - B.Z;
end;

class operator TVector3.Subtract(const A: TVector3; const B: Extended): TVector3;
begin
  Result.X := A.X - B;
  Result.Y := A.Y - B;
  Result.Z := A.Z - B;
end;

class operator TVector3.Multiply(const A, B: TVector3): TVector3;
begin
  Result.X := A.X * B.X;
  Result.Y := A.Y * B.Y;
  Result.Z := A.Z * B.Z;
end;

function TVector3.IsZero: Boolean;
begin
  Result := SameValue(X, 0.0) and SameValue(Y, 0.0) and SameValue(Z, 0.0);
end;

function TVector3.Length: Extended;
begin
  Result := Sqrt(X*X + Y*Y + Z*Z);
end;

procedure TVector3.Normalize;
var
  s: Extended;
begin
  s := sqrt(x*x + y*y + z*z);
  if s > 0.0 then begin
    x := x / s;
    y := y / s;
    z := z / s;
  end;
end;


procedure Normalize(var x, y, z: Extended);
var
  s: Extended;
begin
  s := sqrt(x*x + y*y + z*z);
  if s > 0.0 then begin
    x := x / s;
    y := y / s;
    z := z / s;
  end;
end;

procedure IdentityM33(var m: TMatrix33);
var
  i, j: Integer;
begin
  for i := 0 to 2 do
    for j := 0 to 2 do
      if i = j then m[i][j] := 1.0 else m[i][j] := 0.0;
end;

procedure M33ToEuler(const m: TMatrix33; var x, y, z: Extended);
begin
	if m[0][2] < 1.0 then begin
		if m[0][2] > -1.0 then begin
			x := ArcTan2(-m[1][2], m[2][2]);
			y := ArcSin(m[0][2]);
			z := ArcTan2(-m[0][1], m[0][0]);
		end
    else begin
			x := -ArcTan2(-m[1][0], m[1][1]);
			y := -System.PI / 2;
			z := 0.0;
		end
	end
  else begin
		x := ArcTan2(m[1][0], m[1][1]);
		y := System.PI / 2;
		z := 0.0;
	end
end;

procedure EulerToM33(const x, y, z: Extended; var m: TMatrix33);
var
  sinX, cosX, sinY, cosY, sinZ, cosZ: Extended;
begin
  if SameValue(x, 0.0) and SameValue(y, 0.0) and SameValue(z, 0.0) then begin
    IdentityM33(m);
    Exit;
  end;

	sinX := Sin( x );
	cosX := Cos( x );
	sinY := sin( y );
	cosY := cos( y );
	sinZ := sin( z );
	cosZ := cos( z );

	m[0][0] := cosY * cosZ;
	m[0][1] := -cosY * sinZ;
	m[0][2] := sinY;
	m[1][0] := sinX * sinY * cosZ + sinZ * cosX;
	m[1][1] := cosX * cosZ - sinX * sinY * sinZ;
	m[1][2] := -sinX * cosY;
	m[2][0] := sinX * sinZ - cosX * sinY * cosZ;
	m[2][1] := cosX * sinY * sinZ + sinX * cosZ;
	m[2][2] := cosX * cosY;
end;

procedure M33ToQuaternion(const m: TMatrix33; var Quat: TQuaternion);
const
  next: array [0..2] of Integer = (1, 2, 0);
var
  trace, root: Extended;
  i, j, k: Integer;
begin
	trace := m[0][0] + m[1][1] + m[2][2];

  with Quat do
	if trace > 0.0 then begin
		root := sqrt( trace + 1.0 );
		q[0] := root / 2.0;
		root := 0.5 / root;
		q[1] := ( m[2][1] - m[1][2] ) * root;
		q[2] := ( m[0][2] - m[2][0] ) * root;
		q[3] := ( m[1][0] - m[0][1] ) * root;
	end
  else begin
		if m[1][1] > m[0][0] then i := 1 else i := 0;
		if m[2][2] > m[i][i] then
			i := 2;

		j := next[i];
		k := next[j];

		root := sqrt( m[i][i] - m[j][j] - m[k][k] + 1.0 );
		q[i + 1] := root / 2;
		root := 0.5 / root;
		q[0] := ( m[k][j] - m[j][k] ) * root;
		q[j + 1] := ( m[j][i] + m[i][j] ) * root;
		q[k + 1] := ( m[k][i] + m[i][k] ) * root;
	end;
end;

procedure QuaternionToM33(const Quat: TQuaternion; var m: TMatrix33);
var
  fTx, fTy, fTz, fTwx, fTwy, fTwz, fTxx, fTxy, fTxz, fTyy, fTyz, fTzz: Extended;
begin
  with Quat do begin
    fTx := 2.0 * q[1];
    fTy := 2.0 * q[2];
    fTz := 2.0 * q[3];
    fTwx := fTx * q[0];
    fTwy := fTy * q[0];
    fTwz := fTz * q[0];
    fTxx := fTx * q[1];
    fTxy := fTy * q[1];
    fTxz := fTz * q[1];
    fTyy := fTy * q[2];
    fTyz := fTz * q[2];
    fTzz := fTz * q[3];
  end;

	m[0][0] := 1.0 - (fTyy + fTzz);
	m[0][1] := fTxy - fTwz;
	m[0][2] := fTxz + fTwy;
	m[1][0] := fTxy + fTwz;
	m[1][1] := 1.0 - (fTxx + fTzz);
	m[1][2] := fTyz - fTwx;
	m[2][0] := fTxz - fTwy;
	m[2][1] := fTyz + fTwx;
	m[2][2] := 1.0 - (fTxx + fTyy);
end;

procedure QuaternionToAxisAngle(const Quat: TQuaternion; var a, x, y, z: Extended);
var
  squaredLength: Extended;
begin
  with Quat do squaredLength := q[1] * q[1] + q[2] * q[2] + q[3] * q[3];
  if squaredLength > 0.0 then begin
    a := ArcCos( Quat.q[0] ) * 2.0;
    squaredLength := sqrt( squaredLength );
    x := Quat.q[1] / squaredLength;
    y := Quat.q[2] / squaredLength;
    z := Quat.q[3] / squaredLength;
  end
  else begin
    x := 1.0;
    y := 0.0;
    z := 0.0;
    a := 0.0;
  end;
end;

procedure AxisAngleToQuaternion(a, x, y, z: Extended; var Quat: TQuaternion);
var
  s: Extended;
begin
	Normalize(x, y, z);
	s := Sin( a / 2 );
  Quat.q[0] := Cos( a / 2 );
  Quat.q[1] := s * x;
  Quat.q[2] := s * y;
  Quat.q[3] := s * z;
end;

procedure EulerToQuaternion(const x, y, z: Extended; var Quat: TQuaternion);
var
  m: TMatrix33;
begin
  EulerToM33(x, y, z, m);
  M33ToQuaternion(m, Quat);
end;

procedure QuaternionToEuler(const Quat: TQuaternion; var x, y, z: Extended);
var
  m: TMatrix33;
begin
  QuaternionToM33(Quat, m);
  M33ToEuler(m, x, y, z);
end;

procedure M33ToAxisAngle(const m: TMatrix33; var a, x, y, z: Extended);
var
  q: TQuaternion;
begin
  M33ToQuaternion(m, q);
  QuaternionToAxisAngle(q, a, x, y, z);
end;

procedure AxisAngleToM33(const a, x, y, z: Extended; var m: TMatrix33);
var
  q: TQuaternion;
begin
  AxisAngleToQuaternion(a, x, y, z, q);
  QuaternionToM33(q, m);
end;

function Vector3Cross(const A, B: TVector3): TVector3;
begin
  Result.X := (A.Y * B.Z) - (B.Y * A.Z);
  Result.Y := (A.Z * B.X) - (B.Z * A.X);
  Result.Z := (A.X * B.Y) - (B.X * A.Y);
end;

function Vector3Dot(const A, B: TVector3): Single;
begin
  Result := (A.X * B.X) + (A.Y * B.Y) + (A.Z * B.Z);
end;

function Triangulate(const strip: TStrip): TTriangleArray;
var
  a, b, c: Word;
  s: Integer;
  flip: Boolean;
begin
  if Length(strip) < 3 then
    Exit;

	b := strip[0];
	c := strip[1];
	flip := False;

	for s := 2 to Pred(Length(strip)) do begin
		a := b;
		b := c;
		c := strip[s];

		if ( a <> b ) and ( b <> c ) and ( c <> a ) then begin
      SetLength(Result, Succ(Length(Result)));
			if not flip then begin
        Result[Pred(Length(Result))][0] := a;
        Result[Pred(Length(Result))][1] := b;
        Result[Pred(Length(Result))][2] := c;
			end
      else begin
        Result[Pred(Length(Result))][0] := a;
        Result[Pred(Length(Result))][1] := c;
        Result[Pred(Length(Result))][2] := b;
      end;
    end;

    flip := not flip;
	end;
end;

function Triangulate(const strips: TStripArray): TTriangleArray;
var
  t: TTriangleArray;
  i, j: Integer;
begin
  for j := Low(strips) to High(strips) do begin
    t := Triangulate(strips[j]);
    i := Length(Result);
    SetLength(Result, i + Length(t));
    System.Move(t[0], Result[i], SizeOf(TTriangle) * Length(t));
  end;
end;

procedure CalculateCenterRadius(
  const verts: TVector3Array;
  var center: TVector3;
  var r: Extended;
  aFromMinMax: Boolean = False
);
var
  i: integer;
  d: Extended;
  xMin, xMax, yMin, yMax, zMin, zMax: Extended;
begin
  if Length(verts) = 0 then
    Exit;

  if aFromMinMax then begin
    xMin := MaxSingle; xMax := -MaxSingle;
    yMin := MaxSingle; yMax := -MaxSingle;
    zMin := MaxSingle; zMax := -MaxSingle;

    for i := Low(verts) to High(verts) do with verts[i] do begin
			if v[0] < xMin then
        xMin := v[0]
			else if v[0] > xMax then
        xMax := v[0];

			if v[1] < yMin then
        yMin := v[1]
			else if v[1] > yMax then
        yMax := v[1];

			if v[2] < zMin then
        zMin := v[2]
			else if v[2] > zMax then
        zMax := v[2];
    end;
    center.x := (xMin + xMax) / 2;
    center.y := (yMin + yMax) / 2;
    center.z := (zMin + zMax) / 2;
  end

  else begin
    for i := Low(verts) to High(verts) do
      center := center + verts[i];
    center := center / Length(verts);
  end;

  for i := Low(verts) to High(verts) do begin
    d := ( center - verts[i] ).Length;
    if d > r then
      r := d;
  end;
end;

procedure CalculateFaceNormals(
  const verts: TVector3Array;
  const triangles: TTriangleArray;
  var norms: TVector3Array
);
var
  a, b, c, fn: TVector3;
  i: Integer;
begin
  SetLength(norms, Length(triangles) * SizeOf(TTriangle));
  Assert(Length(norms) = Length(verts));
  for i := Low(triangles) to High(triangles) do begin
    a := verts[triangles[i][0]];
    b := verts[triangles[i][1]];
    c := verts[triangles[i][2]];
    fn := Vector3Cross(b - a, c - a);
    norms[triangles[i][0]] := norms[triangles[i][0]] + fn;
    norms[triangles[i][1]] := norms[triangles[i][1]] + fn;
    norms[triangles[i][2]] := norms[triangles[i][2]] + fn;
  end;

  for i := Low(norms) to High(norms) do
    norms[i].Normalize;
end;

procedure CalculateTangentsBitangents(
  const verts, norms: TVector3Array;
  const texco: TVector2Array;
  const triangles: TTriangleArray;
  var tan, bin: TVector3Array
);
var
  i, j, tr, i1, i2, i3: Integer;
  tri: PTriangle;
  v1, v2, v3, n, t, b: PVector3;
  w1, w2, w3: PVector2;
  v2v1, v3v1: TVector3;
  w2w1, w3w1: TVector2;
  sdir, tdir: TVector3;
  r: Extended;
begin
  SetLength(tan, Length(verts));
  SetLength(bin, Length(verts));

  for tr := Low(triangles) to High(triangles) do begin
    tri := @triangles[tr];
    i1 := tri[0];
    i2 := tri[1];
    i3 := tri[2];
    v1 := @verts[i1];
    v2 := @verts[i2];
    v3 := @verts[i3];
    w1 := @texco[i1];
    w2 := @texco[i2];
    w3 := @texco[i3];

		v2v1 := v2^ - v1^;
		v3v1 := v3^ - v1^;

		w2w1 := w2^ - w1^;
		w3w1 := w3^ - w1^;

    r := w2w1.v[0] * w3w1.v[1] - w3w1.v[0] * w2w1.v[1];

    if r >= 0 then r := r + 1 else r := r - 1;

    sdir.v[0] := ( w3w1.v[1] * v2v1.v[0] - w2w1.v[1] * v3v1.v[0] ) * r;
		sdir.v[1] := ( w3w1.v[1] * v2v1.v[1] - w2w1.v[1] * v3v1.v[1] ) * r;
		sdir.v[2] := ( w3w1.v[1] * v2v1.v[2] - w2w1.v[1] * v3v1.v[2] ) * r;

		tdir.v[0] := ( w2w1.v[0] * v3v1.v[0] - w3w1.v[0] * v2v1.v[0] ) * r;
		tdir.v[1] := ( w2w1.v[0] * v3v1.v[1] - w3w1.v[0] * v2v1.v[1] ) * r;
		tdir.v[2] := ( w2w1.v[0] * v3v1.v[2] - w3w1.v[0] * v2v1.v[2] ) * r;

    sdir.Normalize;
    tdir.Normalize;

    for j := 0 to 2 do begin
      i := tri[j];
      tan[i] := tan[i] + tdir;
      bin[i] := bin[i] + sdir;
    end;
  end;

  for i := Low(verts) to High(verts) do begin
    n := @norms[i];
    t := @tan[i];
    b := @bin[i];

    if t.IsZero or b.IsZero then begin
      t.v[0] := n.v[1]; t.v[1] := n.v[2]; t.v[2] := n.v[0];
      b^ := Vector3Cross( n^, t^ );
    end
    else begin
			t.Normalize;
			t^ := ( t^ - n^ * Vector3Dot( n^, t^ ) );
			t.Normalize;

			b.Normalize;
			b^ := ( b^ - n^ * Vector3Dot( n^, b^ ) );
			b^ := ( b^ - t^ * Vector3Dot( t^, b^ ) );
			b.Normalize;
    end;
  end;
end;



end.
