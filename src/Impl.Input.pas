unit Impl.Input;

interface

type
  TInputTuple = class
  private
    FKey: TArray<Integer>;
    FValue: Integer;
  public
    property Key: TArray<Integer> read FKey write FKey;
    property Value: Integer read FValue write FValue;
  end;

  TInput = class
  private type
    TInputTuples = TArray<TInputTuple>;
  private
    FArrays: TInputTuples;
    function GetCount: Integer;
    function GetIsEmpty: Boolean;
  public
    destructor Destroy; override;
    property Arrays: TInputTuples read FArrays write FArrays;
    property Count: Integer read GetCount;
    property IsEmpty: Boolean read GetIsEmpty;
  end;

implementation

{ TInput }

destructor TInput.Destroy;
var
  Tuple: TInputTuple;
begin
  for Tuple in Arrays do
    Tuple.Free;

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

