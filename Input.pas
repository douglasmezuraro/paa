unit Input;

interface

uses
  System.Generics.Collections;

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
    procedure Assign(const JSON: string);
  end;

implementation

uses
  REST.Json;

{ TInput }

procedure TInput.Assign(const JSON: string);
begin
  Self := TJson.JsonToObject<TInput>(JSON);
end;

end.
