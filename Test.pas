unit Test;

interface

uses
  SysUtils, Input, Impl;

type
  TImplTest = class
  private
    FInput: TInput;
    function TestHighestElement: Boolean;
    function TestSort: Boolean;
  public
    function Execute: Boolean;
    property Input: TInput read FInput write FInput;
  end;

implementation

{ TImplTest }

function TImplTest.Execute: Boolean;
begin
  Result := True;

  if not Assigned(Input) then
    Exit;

  Result := TestHighestElement;

  if not Result then
    Exit;

  Result := TestSort;
end;

function TImplTest.TestHighestElement: Boolean;
var
  InputPair: TInputPair;
  Value: Integer;
begin
  Result := True;
  for InputPair in FInput.Arrays do
  begin
    Value := TImpl.HighestElement(InputPair.Key);
    if Value <> InputPair.Value then
      Exit(False);
  end;
end;

function TImplTest.TestSort: Boolean;
var
  InputPair: TInputPair;
  Index: Integer;
  A: TArray<Integer>;
begin
  Result := True;
  for InputPair in FInput.Arrays do
  begin
    A := InputPair.Key;
    TImpl.Sort(A);
    InputPair.Key := A;
    for Index := Low(A) to High(A) do
    begin
      if Index = 0 then
        Continue;

      if A[Index] < A[Pred(Index)] then
        Exit(False);
    end;
  end;
end;

end.
