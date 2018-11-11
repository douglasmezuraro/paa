unit Impl;

interface

type
  TImpl = class
  public
    class function HighestElement(A: TArray<Integer>): Integer; overload;
    class function HighestElement(A: TArray<Integer>; L, R: Integer): Integer; overload;
    class procedure Sort(var A: TArray<Integer>);
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

class procedure TImpl.Sort(var A: TArray<Integer>);
var
  L, R, Temp: Integer;
begin
  L := HighestElement(A);
  R := Pred(Length(A));
  while (R - L) > 0 do
  begin
    Temp := A[L];
    A[L] := A[R];
    A[R] := Temp;

    Inc(L);
    Dec(R);
  end;
end;

end.
