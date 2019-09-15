unit Impl.Algorithms.Test;

interface

uses
  TestFramework, TestFramework.Helpers, Impl.Algorithms;

type
  TAlgorithmsTest = class(TTestCase)
  published
    {$REGION 'TestHighestElement'}
    procedure TestHighestElementWhenArrayIsEmpty;
    procedure TestHighestElementWhenHighestElementIsAtTheBeginning;
    procedure TestHighestElementWhenHighestElementIsAtTheMiddle;
    procedure TestHighestElementWhenHighestElementIsAtARandomIndex;
    procedure TestHighestElementWhenHighestElementIsAtTheEnd;
    {$ENDREGION}

    {$REGION 'TestSort'}
    procedure TestSortWhenArrayIsEmpty;
    procedure TestSortWhenArrayIsSortedInReverse;
    procedure TestSortWhenArrayIsSorted;
    procedure TestSortWhenArrayIsNotSorted;
    {$ENDREGION}
  end;

implementation

{ TAlgorithmsTest }

procedure TAlgorithmsTest.TestHighestElementWhenArrayIsEmpty;
begin
  CheckEquals(TAlgorithms.NotFoundIndex, TAlgorithms.HighestElement([]));
end;

procedure TAlgorithmsTest.TestHighestElementWhenHighestElementIsAtARandomIndex;
const
  LArray: TArray<Integer> = [8, 16, 32, 64, 128, 4, 2, 0];
begin
  CheckEquals(4, TAlgorithms.HighestElement(LArray));
end;

procedure TAlgorithmsTest.TestHighestElementWhenHighestElementIsAtTheBeginning;
const
  LArray: TArray<Integer> = [19, 11, 8, 7, 4, -2, -5];
begin
  CheckEquals(Low(LArray), TAlgorithms.HighestElement(LArray));
end;

procedure TAlgorithmsTest.TestHighestElementWhenHighestElementIsAtTheEnd;
const
  LArray: TArray<Integer> = [-32, -16, -8, 0, 8, 16, 32];
begin
  CheckEquals(High(LArray), TAlgorithms.HighestElement(LArray));
end;

procedure TAlgorithmsTest.TestHighestElementWhenHighestElementIsAtTheMiddle;
const
  LArray: TArray<Integer> = [-1, 0, 1, 4, 3, 2];
begin
  CheckEquals(Length(LArray) / 2, TAlgorithms.HighestElement(LArray));
end;

procedure TAlgorithmsTest.TestSortWhenArrayIsEmpty;
const
  LArray: TArray<Integer> = [];
  LExpectedArray: TArray<Integer> = [];
begin
  CheckEquals(LExpectedArray, TAlgorithms.Sort(LArray));
end;

procedure TAlgorithmsTest.TestSortWhenArrayIsNotSorted;
const
  LArray: TArray<Integer> = [0, 1, 2, 9, 8, 7, 6, 5, 4, 3];
  LExpectedArray: TArray<Integer> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
begin
  CheckEquals(LExpectedArray, TAlgorithms.Sort(LArray));
end;

procedure TAlgorithmsTest.TestSortWhenArrayIsSortedInReverse;
const
  LArray: TArray<Integer> = [128, 64, 32, 16, 8];
  LExpectedArray: TArray<Integer> = [8, 16, 32, 64, 128];
begin
  CheckEquals(LExpectedArray, TAlgorithms.Sort(LArray));
end;

procedure TAlgorithmsTest.TestSortWhenArrayIsSorted;
const
  LArray: TArray<Integer> = [-4, -3, -2, -1, 0, 1, 2, 3, 4];
  LExpectedArray: TArray<Integer> = [-4, -3, -2, -1, 0, 1, 2, 3, 4];
begin
  CheckEquals(LExpectedArray, TAlgorithms.Sort(LArray));
end;

initialization
  RegisterTest(TAlgorithmsTest.Suite);

end.

