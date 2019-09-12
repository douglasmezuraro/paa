unit Impl.Algorithms.Test;

interface

uses
  TestFramework, System.Math, System.Generics.Collections, Impl.Algorithms;

type
  TAlgorithmsTest = class(TTestCase)
  strict private
    function SameArray(const A, B: TArray<Integer>): Boolean;
  published
    {$REGION 'TestHighestElement'}
    procedure TestHighestElementWhenArrayIsEmpty;
    procedure TestHighestElementWhenHighestElementIsAtTheBeginning;
    procedure TestHighestElementWhenHighestElementIsAtTheMiddle;
    procedure TestHighestElementWhenHighestElementIsAtTheEnd;
    procedure TestHighestElementWhenHighestElementIsAtIndex0;
    procedure TestHighestElementWhenHighestElementIsAtIndex1;
    procedure TestHighestElementWhenHighestElementIsAtIndex2;
    procedure TestHighestElementWhenHighestElementIsAtIndex3;
    procedure TestHighestElementWhenHighestElementIsAtIndex4;
    procedure TestHighestElementWhenHighestElementIsAtIndex5;
    procedure TestHighestElementWhenHighestElementIsAtIndex6;
    procedure TestHighestElementWhenHighestElementIsAtIndex7;
    procedure TestHighestElementWhenHighestElementIsAtIndex8;
    procedure TestHighestElementWhenHighestElementIsAtIndex9;
    {$ENDREGION}

    {$REGION 'TestSort'}
    procedure TestSortWhenArrayIsEmpty;
    procedure TestSortWhenArrayIsSortedInReverse;
    procedure TestSortWhenArrayIsSorted;
    procedure TestSortWhenHighestElementIsAtIndex0;
    procedure TestSortWhenHighestElementIsAtIndex1;
    procedure TestSortWhenHighestElementIsAtIndex2;
    procedure TestSortWhenHighestElementIsAtIndex3;
    procedure TestSortWhenHighestElementIsAtIndex4;
    procedure TestSortWhenHighestElementIsAtIndex5;
    procedure TestSortWhenHighestElementIsAtIndex6;
    procedure TestSortWhenHighestElementIsAtIndex7;
    procedure TestSortWhenHighestElementIsAtIndex8;
    procedure TestSortWhenHighestElementIsAtIndex9;
    {$ENDREGION}
  end;

implementation

const
  OrdenedArray: TArray<Integer> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

{ TAlgorithmsTest }

function TAlgorithmsTest.SameArray(const A, B: TArray<Integer>): Boolean;
var
  Index: Integer;
begin
  if Length(A) <> Length(B) then
    Exit(False);

  if (Length(A) = 0) and (Length(B) = 0) then
    Exit(True);

  for Index := Low(A) to High(A) do
    if A[Index] <> B[Index] then
      Exit(False);

  Result := True;
end;

procedure TAlgorithmsTest.TestHighestElementWhenArrayIsEmpty;
begin
  CheckEquals(TAlgorithms.NotFoundIndex, TAlgorithms.HighestElement([]));
end;

procedure TAlgorithmsTest.TestHighestElementWhenHighestElementIsAtIndex0;
const
  LArray: TArray<Integer> = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0];
begin
  CheckEquals(0, TAlgorithms.HighestElement(LArray));
end;

procedure TAlgorithmsTest.TestHighestElementWhenHighestElementIsAtIndex1;
const
  LArray: TArray<Integer> = [0, 9, 8, 7, 6, 5, 4, 3, 2, 1];
begin
  CheckEquals(1, TAlgorithms.HighestElement(LArray));
end;

procedure TAlgorithmsTest.TestHighestElementWhenHighestElementIsAtIndex2;
const
  LArray: TArray<Integer> = [0, 1, 9, 8, 7, 6, 5, 4, 3, 2];
begin
  CheckEquals(2, TAlgorithms.HighestElement(LArray));
end;

procedure TAlgorithmsTest.TestHighestElementWhenHighestElementIsAtIndex3;
const
  LArray: TArray<Integer> = [0, 1, 2, 9, 8, 7, 6, 5, 4, 3];
begin
  CheckEquals(3, TAlgorithms.HighestElement(LArray));
end;

procedure TAlgorithmsTest.TestHighestElementWhenHighestElementIsAtIndex4;
const
  LArray: TArray<Integer> = [0, 1, 2, 3, 9, 8, 7, 6, 5, 4];
begin
  CheckEquals(4, TAlgorithms.HighestElement(LArray));
end;

procedure TAlgorithmsTest.TestHighestElementWhenHighestElementIsAtIndex5;
const
  LArray: TArray<Integer> = [0, 1, 2, 3, 4, 9, 8, 7, 6, 5];
begin
  CheckEquals(5, TAlgorithms.HighestElement(LArray));
end;

procedure TAlgorithmsTest.TestHighestElementWhenHighestElementIsAtIndex6;
const
  LArray: TArray<Integer> = [0, 1, 2, 3, 4, 5, 9, 8, 7, 6];
begin
  CheckEquals(6, TAlgorithms.HighestElement(LArray));
end;

procedure TAlgorithmsTest.TestHighestElementWhenHighestElementIsAtIndex7;
const
  LArray: TArray<Integer> = [0, 1, 2, 3, 4, 5, 6, 9, 8, 7];
begin
  CheckEquals(7, TAlgorithms.HighestElement(LArray));
end;

procedure TAlgorithmsTest.TestHighestElementWhenHighestElementIsAtIndex8;
const
  LArray: TArray<Integer> = [0, 1, 2, 3, 4, 5, 6, 7, 9, 8];
begin
  CheckEquals(8, TAlgorithms.HighestElement(LArray));
end;

procedure TAlgorithmsTest.TestHighestElementWhenHighestElementIsAtIndex9;
const
  LArray: TArray<Integer> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
begin
  CheckEquals(9, TAlgorithms.HighestElement(LArray));
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
begin
  CheckTrue(SameArray(LArray, TAlgorithms.Sort(LArray)));
end;

procedure TAlgorithmsTest.TestSortWhenHighestElementIsAtIndex0;
const
  LArray: TArray<Integer> = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0];
begin
  CheckTrue(SameArray(OrdenedArray, TAlgorithms.Sort(LArray)));
end;

procedure TAlgorithmsTest.TestSortWhenHighestElementIsAtIndex1;
const
  LArray: TArray<Integer> = [0, 9, 8, 7, 6, 5, 4, 3, 2, 1];
begin
  CheckTrue(SameArray(OrdenedArray, TAlgorithms.Sort(LArray)));
end;

procedure TAlgorithmsTest.TestSortWhenHighestElementIsAtIndex2;
const
  LArray: TArray<Integer> = [0, 1, 9, 8, 7, 6, 5, 4, 3, 2];
begin
  CheckTrue(SameArray(OrdenedArray, TAlgorithms.Sort(LArray)));
end;

procedure TAlgorithmsTest.TestSortWhenHighestElementIsAtIndex3;
const
  LArray: TArray<Integer> = [0, 1, 2, 9, 8, 7, 6, 5, 4, 3];
begin
  CheckTrue(SameArray(OrdenedArray, TAlgorithms.Sort(LArray)));
end;

procedure TAlgorithmsTest.TestSortWhenHighestElementIsAtIndex4;
const
  LArray: TArray<Integer> = [0, 1, 2, 3, 9, 8, 7, 6, 5, 4];
begin
  CheckTrue(SameArray(OrdenedArray, TAlgorithms.Sort(LArray)));
end;

procedure TAlgorithmsTest.TestSortWhenHighestElementIsAtIndex5;
const
  LArray: TArray<Integer> = [0, 1, 2, 3, 4, 9, 8, 7, 6, 5];
begin
  CheckTrue(SameArray(OrdenedArray, TAlgorithms.Sort(LArray)));
end;

procedure TAlgorithmsTest.TestSortWhenHighestElementIsAtIndex6;
const
  LArray: TArray<Integer> = [0, 1, 2, 3, 4, 5, 9, 8, 7, 6];
begin
  CheckTrue(SameArray(OrdenedArray, TAlgorithms.Sort(LArray)));
end;

procedure TAlgorithmsTest.TestSortWhenHighestElementIsAtIndex7;
const
  LArray: TArray<Integer> = [0, 1, 2, 3, 4, 5, 6, 9, 8, 7];
begin
  CheckTrue(SameArray(OrdenedArray, TAlgorithms.Sort(LArray)));
end;

procedure TAlgorithmsTest.TestSortWhenHighestElementIsAtIndex8;
const
  LArray: TArray<Integer> = [0, 1, 2, 3, 4, 5, 6, 7, 9, 8];
begin
  CheckTrue(SameArray(OrdenedArray, TAlgorithms.Sort(LArray)));
end;

procedure TAlgorithmsTest.TestSortWhenHighestElementIsAtIndex9;
const
  LArray: TArray<Integer> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
begin
  CheckTrue(SameArray(OrdenedArray, TAlgorithms.Sort(LArray)));
end;

procedure TAlgorithmsTest.TestSortWhenArrayIsSortedInReverse;
const
  LArray: TArray<Integer> = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0];
begin
  CheckTrue(SameArray(OrdenedArray, TAlgorithms.Sort(LArray)));
end;

procedure TAlgorithmsTest.TestSortWhenArrayIsSorted;
const
  LArray: TArray<Integer> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
begin
  CheckTrue(SameArray(OrdenedArray, TAlgorithms.Sort(LArray)));
end;

initialization
  RegisterTest(TAlgorithmsTest.Suite);

end.

