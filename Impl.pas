unit Impl;

interface

uses
  System.Generics.Collections;

type
  TImpl = class
  public
    class function HighestElement(A: TArray<Integer>): Integer; overload;
    class function HighestElement(A: TArray<Integer>; L, R: Integer): Integer; overload;
    class function Sort(const A: TArray<Integer>): TArray<Integer>;
  end;

implementation

{ TImpl }

class function TImpl.HighestElement(A: TArray<Integer>): Integer;
begin
  Result := HighestElement(A, 0, Length(A));
end;

class function TImpl.HighestElement(A: TArray<Integer>; L, R: Integer): Integer;
var
  M, Curr, Prior, Next: Integer;
begin
  M := L + Round((R - L) / 2);

  Prior := A[Pred(M)];
  Curr := A[M];
  Next := A[Succ(M)];

  if (M = 0) or (M = Length(A)) then
    Exit(M);

  if (Curr > Prior) and (Curr > Next) then
    Exit(M);

  if Curr < Next then
    Exit(HighestElement(A, M, R));

  if Curr > Next then
    Exit(HighestElement(A, 0, M));
end;

class function TImpl.Sort(const A: TArray<Integer>): TArray<Integer>;
var
  B: TArray<Integer>;
  L, R, Size, Temp: Integer;
begin
  Size := Length(A);
  SetLength(B, Size);
  TArray.Copy<Integer>(A, B, Size);

  L := HighestElement(B);
  R := Pred(Size);
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
