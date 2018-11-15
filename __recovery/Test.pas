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
  Pair: TInputPair;
  Value: Integer;
begin
  Result := True;
  for Pair in FInput.Arrays do
  begin
    Value := TImpl.HighestElement(Pair.Key);
    if Value <> Pair.Value then
      Exit(False);
  end;
end;

function TImplTest.TestSort: Boolean;
var
  Pair: TInputPair;
  Index: Integer;
  A: TArray<Integer>;
begin
  Result := True;
  for Pair in FInput.Arrays do

  begin
    A := TImpl.Sort(Pair.Key);
    for Index := Succ(Low(A)) to High(A) do
    begin
      if A[Index] < A[Pred(Index)] then
        Exit(False);
    end;
  end;
end;

end.
