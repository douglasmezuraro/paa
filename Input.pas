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
    constructor Create(const Path: string);
  end;

implementation

uses
  REST.Json,
  System.IOUtils;

{ TInput }

constructor TInput.Create(const Path: string);
begin
  Self := TJson.JsonToObject<TInput>(TFile.ReadAllText(Path));
end;

end.
