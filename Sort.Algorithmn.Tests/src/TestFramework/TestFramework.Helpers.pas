unit TestFramework.Helpers;

interface

uses
  TestFramework, System.SysUtils;

type
  TCheckArrayTestCase = class Helper for TTestCase
  strict private
    function ArrayToString(const Value: TArray<Integer>): string;
    function EqualsArrays(const A, B: TArray<Integer>): Boolean;
  public
    procedure CheckEquals(const Expected, Actual: TArray<Integer>;
      const Msg: string = string.Empty); overload;
  end;

implementation

{ TCheckArrayTestCase }

function TCheckArrayTestCase.ArrayToString(const Value: TArray<Integer>): string;
var
  Element: Integer;
begin
  for Element in Value do
  begin
    if Result.Trim.IsEmpty then
      Result := Element.ToString
    else
      Result := Result + ', ' + Element.ToString;
  end;

  Result := string.Format('[%s]', [Result]);
end;

procedure TCheckArrayTestCase.CheckEquals(const Expected, Actual: TArray<Integer>; const Msg: string);
var
  LMsg: string;
  Equals: Boolean;
begin
  Equals := EqualsArrays(Expected, Actual);

  if (not Equals) and Msg.Trim.IsEmpty then
    LMsg := string.Format(sExpButWasFmt, [Msg, ArrayToString(Expected), ArrayToString(Actual)]);

  CheckTrue(Equals, LMsg);
end;

function TCheckArrayTestCase.EqualsArrays(const A, B: TArray<Integer>): Boolean;
var
  Index: Integer;
begin
  if Length(A) <> Length(B) then
    Exit(False);

  if Length(A) = 0 then
    Exit(True);

  for Index := Low(A) to High(A) do
    if A[Index] <> B[Index] then
      Exit(False);

  Result := True;
end;

end.
