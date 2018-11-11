unit Input;

interface

type
  TInputPair = class
  private
    FKey: TArray<Integer>;
    FValue: Integer;
  public
    property Key: TArray<Integer> read FKey write FKey;
    property Value: Integer read FValue write FValue;
  end;

  TInputPairs = TArray<TInputPair>;

  TInput = class
  private
    FArrays: TInputPairs;
  public
    property Arrays: TInputPairs read FArrays write FArrays;
    function Assign(const JSON: string): TInput;
  end;

implementation

uses
  REST.Json;

{ TInput }

function TInput.Assign(const JSON: string): TInput;
begin
  Self := TJson.JsonToObject<TInput>(JSON);
  Result := Self;
end;

end.
