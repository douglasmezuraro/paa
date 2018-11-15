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
    destructor Destroy; override;
    property Arrays: TInputPairs read FArrays write FArrays;
  end;

implementation

{ TInput }

destructor TInput.Destroy;
var
  Pair: TInputPair;
begin
  for Pair in Arrays do
    Pair.Free;

  inherited Destroy;
end;

end.
