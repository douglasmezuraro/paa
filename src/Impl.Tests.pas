unit Impl.Tests;

interface

uses
  Impl.Algorithms,
  Impl.Input,
  System.SysUtils;

type
  TTests = class
  private
    FInput: TInput;
    FSuccesses: Integer;
    FFails: Integer;
    procedure TestHighestElement;
    procedure TestSort;
    function ReadCount: Integer;
  public
    function Execute: Boolean;
    property Input: TInput read FInput write FInput;
    property Successes: Integer read FSuccesses write FSuccesses;
    property Fails: Integer read FFails write FFails;
    property Count: Integer read ReadCount;
  end;

implementation

{ TImplTest }

function TTests.Execute: Boolean;
begin
  Successes := 0;
  Fails := 0;

  if not Assigned(Input) then
    Exit(False);

  TestHighestElement;
  TestSort;

  Result := Fails = 0;
end;

function TTests.ReadCount: Integer;
begin
  Result := Fails + Successes;
end;

procedure TTests.TestHighestElement;
var
  Tuple: TInputTuple;
  Value: Integer;
begin
  for Tuple in FInput.Arrays do
  begin
    Value := TAlgorithms.HighestElement(Tuple.Key);

    if Value = Tuple.Value then
      Inc(FSuccesses)
    else
      Inc(FFails);
  end;
end;

procedure TTests.TestSort;
var
  Result: Boolean;
  Tuple: TInputTuple;
  Index: Integer;
  A: TArray<Integer>;
begin
  for Tuple in FInput.Arrays do
  begin
    Result := True;
    A := TAlgorithms.Sort(Tuple.Key);

    for Index := Low(A) to Pred(High(A)) do
    begin
      if A[Index] > A[Succ(Index)] then
      begin
        Result := False;
        Break;
      end;
    end;

    if Result then
      Inc(FSuccesses)
    else
      Inc(FFails);
  end;
end;

end.

