unit Test;

interface

uses
  SysUtils,
  Input,
  Impl;

type
  TTest = class
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

function TTest.Execute: Boolean;
begin
  Successes := 0;
  Fails := 0;

  if not Assigned(Input) then
    Exit(False);

  TestHighestElement;
  TestSort;

  Result := Fails = 0;
end;

function TTest.ReadCount: Integer;
begin
  Result := Fails + Successes;
end;

procedure TTest.TestHighestElement;
var
  Pair: TInputPair;
  Value: Integer;
begin
  for Pair in FInput.Arrays do
  begin
    Value := TImpl.HighestElement(Pair.Key);

    if Value = Pair.Value then
      Inc(FSuccesses)
    else
      Inc(FFails);
  end;
end;

procedure TTest.TestSort;
var
  Result: Boolean;
  Pair: TInputPair;
  Index: Integer;
  A: TArray<Integer>;
begin
  for Pair in FInput.Arrays do
  begin
    Result := True;
    A := TImpl.Sort(Pair.Key);

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
