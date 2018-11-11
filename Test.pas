unit Test;

interface

uses
  SysUtils, Input, Impl;

type
  TImplTest = class
  private
    FInput: TInput;
    FMessage: string;
    function ArrayToString(A: TArray<Integer>): string;
    function TestHighestElement: Boolean;
  public
    constructor Create(Input: TInput);
    function Execute: Boolean;
    property Message: string read FMessage write FMessage;
  end;

implementation

{ TImplTest }

function TImplTest.ArrayToString(A: TArray<Integer>): string;
var
  Element: Integer;
begin
  for Element in A do
  begin
    if Result.IsEmpty then
      Result := Element.ToString
    else
      Result := Format('%s, %d', [Result, Element]);
  end;

  Result := Format('[%s]', [Result]);
end;


constructor TImplTest.Create(Input: TInput);
begin
  FInput := Input;
  FMessage := 'Testes executados com sucesso!';
end;

function TImplTest.Execute: Boolean;
begin
  Result := TestHighestElement;
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
    begin
      Message := Format('Os teste falhou no método "TestHighestElement" com a seguinte entrada: %s.', [ArrayToString(InputPair.Key)]);
      Exit(False);
    end;
  end;
end;

end.
