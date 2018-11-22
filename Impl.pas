unit Impl;

interface

uses
  System.Generics.Collections,
  System.Math;

type
  TImpl = class
  private
    class function CopyArray<T>(const Source: TArray<T>): TArray<T>;
  public
    class function HighestElement(const A: TArray<Integer>): Integer; overload;
    class function HighestElement(const A: TArray<Integer>; const L, R: Integer): Integer; overload;
    class function Sort(const A: TArray<Integer>): TArray<Integer>;
  end;

implementation

{ TImpl }

class function TImpl.CopyArray<T>(const Source: TArray<T>): TArray<T>;
var
  Size: Integer;
begin
  Size := Length(Source);
  SetLength(Result, Size);
  TArray.Copy<T>(Source, Result, Size);
end;

class function TImpl.HighestElement(const A: TArray<Integer>): Integer;
begin
  Result := HighestElement(A, 0, Length(A));
end;

class function TImpl.HighestElement(const A: TArray<Integer>; const L, R: Integer): Integer;
var
  M, Curr, Prior, Next: Integer;
begin
  M := Floor((L + R) / 2);

  Prior := A[Pred(M)];
  Curr := A[M];
  Next := A[Succ(M)];

  if L = R then
    Exit(M);

  if (Curr > Prior) and (Curr > Next) then
    Exit(M);

  if Curr < Next then
    Exit(HighestElement(A, Succ(M), R));

  if Curr > Next then
    Exit(HighestElement(A, L, M));

  Result := -1;
end;

class function TImpl.Sort(const A: TArray<Integer>): TArray<Integer>;
var
  B: TArray<Integer>;
  L, R, Temp: Integer;
begin
  B := CopyArray<Integer>(A);
  L := HighestElement(B);
  R := Pred(Length(B));
  while (R - L) > 0 do
  begin
    Temp := B[L];
    B[L] := B[R];
    B[R] := Temp;

    Inc(L);
    Dec(R);
  end;
  Result := B;
end;

end.

