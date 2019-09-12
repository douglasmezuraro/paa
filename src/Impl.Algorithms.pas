unit Impl.Algorithms;

interface

uses
  System.Generics.Collections,
  System.Math;

type
  TAlgorithms = class sealed
  private
    class function CopyArray<T>(const Source: TArray<T>): TArray<T>;
    class function HighestElement(const A: TArray<Integer>; const L, R: Integer): Integer; overload;
  public const
    NotFoundIndex = -1;
  public
    class function HighestElement(const A: TArray<Integer>): Integer; overload;
    class function Sort(const A: TArray<Integer>): TArray<Integer>;
  end;

implementation

{ TImpl }

class function TAlgorithms.CopyArray<T>(const Source: TArray<T>): TArray<T>;
var
  Size: Integer;
begin
  Size := Length(Source);
  SetLength(Result, Size);
  TArray.Copy<T>(Source, Result, Size);
end;

class function TAlgorithms.HighestElement(const A: TArray<Integer>): Integer;
begin
  if Length(A) = 0 then
    Exit(NotFoundIndex);

  Result := HighestElement(A, Low(A), High(A));
end;

class function TAlgorithms.HighestElement(const A: TArray<Integer>; const L, R: Integer): Integer;
var
  M, Curr, Prior, Next: Integer;
begin
  M := Floor((L + R) / 2);

  Prior := A[Pred(M)];
  Curr  := A[M];
  Next  := A[Succ(M)];

  if L = R then
    Exit(M);

  if (Curr > Prior) and (Curr > Next) then
    Exit(M);

  if Curr < Next then
    Exit(HighestElement(A, Succ(M), R));

  if Curr > Next then
    Exit(HighestElement(A, L, M));

  Result := NotFoundIndex;
end;

class function TAlgorithms.Sort(const A: TArray<Integer>): TArray<Integer>;
var
  B: TArray<Integer>;
  L, R, Temp: Integer;
begin
  if Length(A) = 0 then
    Exit(A);

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

