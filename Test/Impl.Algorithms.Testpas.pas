unit Impl.Algorithms.Testpas;

interface

uses
  TestFramework, System.Math, System.Generics.Collections, Impl.Algorithms;

type
  TestTAlgorithms = class(TTestCase)
  strict private
    FAlgorithms: TAlgorithms;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestHighestElement1;
    procedure TestSort;
  end;

implementation

procedure TestTAlgorithms.SetUp;
begin
  FAlgorithms := TAlgorithms.Create;
end;

procedure TestTAlgorithms.TearDown;
begin
  FAlgorithms.Free;
  FAlgorithms := nil;
end;

procedure TestTAlgorithms.TestHighestElement1;
begin
end;

procedure TestTAlgorithms.TestSort;
begin
end;

initialization
  RegisterTest(TestTAlgorithms.Suite);

end.

