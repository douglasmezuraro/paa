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
    function GetCount: Integer;
    function GetIsEmpty: Boolean;
  public
    destructor Destroy; override;
    property Arrays: TInputPairs read FArrays write FArrays;
    property Count: Integer read GetCount;
    property IsEmpty: Boolean read GetIsEmpty;
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

function TInput.GetCount: Integer;
begin
  Result := Length(Arrays);
end;

function TInput.GetIsEmpty: Boolean;
begin
  Result := Count = 0;
end;

end.

